# Vulnerability analysis of `exec` (n-server)

`exec` is a 32-bit, statically linked, non-PIE HTTP server (`n-server.c`, built `Dec 3 2017`). It listens on TCP/8080, serves files from its current working directory, and is single-threaded (epoll based).

## Binary protections

| Protection | State | Notes |
|------------|-------|-------|
| PIE | **off** | `EXEC` ELF, code/data at fixed addresses |
| NX | **off** | `GNU_STACK` is `RWE` (executable stack) |
| Stack canary | **absent** in app code | `__stack_chk_fail` exists in libc but is unused |
| RELRO | partial | `.got` writable |
| ASLR | **disabled by the program itself** | `main` calls `personality(ADDR_NO_RANDOMIZE)` and re-execs itself |

The last point is worth stressing: before doing anything else `main` calls `personality(0xffffffff)`; if `ADDR_NO_RANDOMIZE` is not set it sets it and `execvp`s itself. As a result every run has identical stack/heap addresses.

## Primary bug: unbounded stack buffer overflow

`client_process_request` declares three fixed local buffers:

```c
char method[16];
char filename[256];
char version[16];
```

and passes pointers to them to `parse_request`:

```c
parse_request(cc, method, filename, version);
```

`parse_request` splits the first request line into three whitespace (`' '`, `'\r'`, `'\n'`) delimited tokens and copies each token into the caller-supplied buffer **without any length check**:

```c
while (p < end && !is_delimiter(*p))
    *method++ = *p++;      /* method  : 16 bytes  */
...
while (p < end && !is_delimiter(*p))
    *filename++ = *p++;    /* filename: 256 bytes */
...
while (p < end && !is_delimiter(*p))
    *version++ = *p++;     /* version : 16 bytes  */
```

There is no `strlcpy`/`memcpy` bound, so a request such as

```
GET / HTTP/1<AAAA...>
```

overflows `version[16]`, then `method`/`filename` are only bounded by the request size (the server keeps reading up to 0x10000 bytes). A single request is therefore enough to overwrite saved registers and the return address of `client_process_request`.

### Exact frame layout

`client_process_request` uses no frame pointer. Its epilogue is `add esp,0x19c; pop ebx; pop esi; pop edi; pop ebp; ret`. The compiler lays the locals out as (addresses from the server's own debug print):

```
method   @ ebp_base + 0x80   (16 bytes)
filename @ ebp_base + 0x90   (256 bytes)
version  @ ebp_base + 0x190  (16 bytes)
...
saved ebx/esi/edi/ebp
return address @ version + 0x24
```

So overwriting the return address requires only **40 bytes** of version data (`version[0] == '1'` is required by an earlier check, so send `"1" + 35 filler + ret`).

Because the overflow happens inside the callee (`parse_request`), but writes upward into the caller's frame, `parse_request`'s own return address (lower on the stack) is untouched and `client_process_request` returns normally into the attacker-controlled address.

## Delimiter constraint

Tokens stop at `' '` (0x20), `'\r'` (0x0d) and `'\n'` (0x0a), so the overflow/shellcode bytes must not contain those three bytes. NUL is fine. The shellcode shipped with the exploit is written to obey this.

## Ret2stack

All ingredients for a classic ret2stack are present:

* stack is executable (NX off),
* ASLR is off,
* no canary,
* the program even prints the addresses of its stack buffers to the console:

  ```c
  printf("method:%p  filename:%p  version:%p  c:%p cc:%p\n", ...);
  ```

The exploit does not even need the leak, because a stack pivot makes the position independent:

* gadget `push esp ; ret` at `0x080bc9d6` (`54 c3`),
* (also available: `call esp` at `0x080ce270`, `jmp esp` at `0x080ddb07`).

Overwriting the return address with `0x080bc9d6` causes the CPU to jump straight to the bytes that follow the overwritten return address (the shellcode), with `ESP` pointing at them.

## Exploit chain

The show-case exploit (`exploit.rs`) sends one request:

```
GET / HTTP/1<35 filler><ret=0x080bc9d6><shellcode>\r\n\r\n
```

The shellcode (555 bytes, no `0x0a/0x0d/0x20`) then:

1. `write(1, "pwned!", 6)` — prints `pwned!` on the server console,
2. opens `/tmp/secret.txt` and streams the **entire** file (in a `read`/`write` loop, not a single fixed-size read) to both fd 1 (server console) and fd 5 (the accepted client socket), bracketed on the socket by the markers `>>>SECRET<<<` / `>>>END<<<` so the exploit can recover the exact bytes binary-safely (the flag format is unknown), then
3. `open("5-kocicek.jpg", O_WRONLY|O_CREAT|O_TRUNC, 0644)` and copies into it whatever bytes arrive on the client socket (fd 5), until EOF. The attacker streams its **own** local `image.jpg` over the same connection; nothing needs to exist on the server beforehand,
4. closes fds 3..30 and `execve("/proc/self/exe", ...)` so the server restarts and keeps serving the (now replaced) image.

Two details make the file transfer reliable:

* The accepted client connection is always fd 5 (fds 0–2 stdio, 3 = listening socket, 4 = epoll) — used both to exfiltrate the secret and to receive the new image.
* The client socket is **non-blocking** (`set_nonblock(c->fd)`), so the image-receive loop treats a negative `read` return as `EAGAIN` and retries; it stops on `read() == 0`, which the exploit produces with `shutdown(SHUT_WR)` after sending the image (size-agnostic). The exploit only starts sending the image *after* it has read the `>>>END<<<` marker, which guarantees the server's first (single) request read has already consumed the 610-byte payload and the shellcode is sitting in the receive loop (otherwise the first image bytes could be swallowed into the request buffer).
* Scratch space for the `read` buffers is taken **below** the shellcode's stack frame; an earlier version read above `esp`, which overran the top of the stack whenever the shellcode landed at a high address (e.g. after the server re-execs).

After re-exec the exploit reconnects and downloads `/5-kocicek.jpg` to confirm the replacement.

### Building the shellcode

The payload is written in **C** (`shellcode.c`) and compiled to a flat, position-independent blob with the 32-bit freestanding mode of the host `gcc` (no cross toolchain, no 32-bit libc required). `build_shellcode.sh` does the compile+link and prints the byte array embedded in `exploit.rs`:

```sh
chmod +x build_shellcode.sh
./build_shellcode.sh
# manual equivalent:
gcc -m32 -O1 -fno-stack-protector -fno-asynchronous-unwind-tables \
    -fno-ident -nostdlib -ffreestanding -fno-pic -fno-pie -fno-builtin \
    -c shellcode.c -o shellcode.o
ld -m elf_i386 --oformat binary -e _start shellcode.o -o shellcode.bin
```

The helper refuses to emit a payload containing `0x0a`, `0x0d` or `0x20` (the delimiter constraint above) and prints a ready-to-paste `const SHELLCODE: [u8; N]`. Replace the array in `exploit.rs` and rebuild.

Two tricks keep the C output usable as shellcode:

* **No globals.** `gcc -fPIC` would reference string literals through a GOT, which a flat blob has no room for and which does not line up without a linker script. Instead every string is a `volatile char[]` **local**, so it is materialised on the stack with immediate stores and addressed `esp`-relative — the result has no relocations, no `.rodata` and no GOT, and is genuinely position-independent.
* **`-O1`.** `-O2` happens to place one local at `esp+0x20`, and that `0x20` displacement byte is a forbidden delimiter. `-O1` lays the frame out so no forbidden byte appears; the build script fails loudly if any ever does.

Points to observe when writing your own:

* the payload takes control with `ESP` pointing at its first byte (set by the `push esp ; ret` gadget), so everything must be `esp`-relative — do not assume a fixed load address,
* avoid the three delimiter bytes anywhere in the payload (the build script checks),
* keep the scratch buffer inside the shellcode's own stack frame; reading above `esp` overran the top of the stack whenever the shellcode landed at a high address (e.g. after the server re-execs),
* on the client socket (fd 5) the payload speaks a tiny protocol: `>>>SECRET<<<` then the raw file then `>>>END<<<`, followed by the uploaded image until EOF — mirror that in any client you write.

`shellcode.S` is the equivalent hand-written i386 assembly (assembled with GNU `as`) kept as a reference; it produces the same behaviour.

## Secondary issues

* **Debug information leak.** The un-annotated `printf` in `client_process_request` leaks stack addresses of `method`, `filename`, `version` and the client pointer on every request. Combined with the disabled ASLR this makes the process trivially exploitable.
* **Reflected input in error pages.** `client_http_error` interpolates attacker-controlled strings (`method`, `version`, file name) directly into the HTML response without escaping (`client_http_error(cc, 405, "Method %s not allowed", method)`), i.e. reflected content injection.
* **Path traversal filtering is superficial.** The only defence against `../` is `strstr(filename, "..")`; it is applied to the *post-parse* buffer, so it does not protect the overflowing copies and would also be bypassable by encodings/absolute paths in other configurations.
* **Unbounded request growth.** The read loop doubles the request buffer up to 0x10000 bytes; combined with `realloc` failures being ignored this is fragile.

## Files

* `exploit.rs` — Rust exploit (`./exploit http://host:port`).
* `shellcode.c` (primary), `shellcode.S` (equivalent hand-written asm), `build_shellcode.sh` — payload sources and build helper.
* `decompiled-clean/` — reconstructed, renamed and formatted sources.
* `decompiled/` — raw r2/ghidra decompilation.
* `objdumps/exec.asm` — disassembly of the server's own functions.
