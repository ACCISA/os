section .text
global memset
global memcpy
global memmove
global memcmp

memset: ;rdi (buffer) rsi (value) rdx (size)
    cld ; clear direction flag
    mov ecx,edx
    mov al,sil
    rep stosb
    ret

memcmp: ;rdi (src1) rsi (src2) rdx (size)
    cld
    xor eax,eax
    mov ecx,edx
    repe cmpsb ; compare bytes
    setn al ;if zero flag is cleared
    ret

memcpy: ;rdi (dst) rsi (src) rdx (size)
memmove:
    cld
    cmp rsi,rdi
    jae .copy
    mov r8,rsi
    add r8,rdx
    cmp r8,rdi
    jbe .copy

.overlap:
    std ; set direction flag
    add rdi,rdx
    add rsi,rdx
    sub rdi,1
    sub rsi,1

.copy:
    mov ecx,edx
    rep movsb
    cld
    ret
