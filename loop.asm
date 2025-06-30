section .bss
    buffer resb 32
    i resq 1

section .text
    global _start

_start:
    mov     qword [i], 0

.loop:
    mov     rax, [i]
    mov     rbx, 10
    mov     rcx, buffer + 31
    mov     byte [rcx], 10
    dec     rcx

    xor     rdx, rdx

.convert:
    xor     rdx, rdx
    div     rbx
    add     dl, '0'
    dec     rcx
    mov     [rcx], dl
    test    rax, rax
    jnz     .convert

    mov     rax, 1
    mov     rdi, 1
    mov     rsi, rcx
    mov     rdx, buffer + 32
    sub     rdx, rcx
    syscall

    inc     qword [i]
    jmp     .loop
