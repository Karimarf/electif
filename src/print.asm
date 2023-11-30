extern printf

section .data
    hello db 'Bonjour', 0

section .text
    global _start

    mov rdi , hello
    mov rax,0
    call printf

    mov rax,0
    mov rdi,60
    syscall
    ret
    
