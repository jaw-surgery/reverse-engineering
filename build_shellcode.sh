#!/bin/sh
set -eu

srcdir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

gcc -m32 -O1 -fno-stack-protector -fno-asynchronous-unwind-tables \
    -fno-ident -nostdlib -ffreestanding -fno-pic -fno-pie -fno-builtin \
    -c "$srcdir/shellcode.c" -o "$tmp/shellcode.o"
ld -m elf_i386 --oformat binary -e _start "$tmp/shellcode.o" -o "$tmp/shellcode.bin"

python3 - "$tmp/shellcode.bin" <<'PY'
import sys

data = open(sys.argv[1], "rb").read()
bad = [b for b in (0x0a, 0x0d, 0x20) if b in data]
if bad:
    raise SystemExit(
        "payload contains forbidden delimiter bytes: " + ", ".join(hex(b) for b in bad)
    )

print("const SHELLCODE: [u8; %d] = [" % len(data))
for i in range(0, len(data), 16):
    print("    " + ", ".join("0x%02x" % b for b in data[i:i + 16]) + ",")
print("];")
PY
