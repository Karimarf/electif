extern printf
extern scanf

section .data
    question: db "Quel âge as-tu ?",10,0
    demande_age: db "Votre âge -> ", 0
    format: db "%d", 0
    si_inf: db "Tu es trop jeune.", 10, 0
    si_sup: db "Bienvenue !", 10, 0

section .bss    
    age: resd 1 ; Assuming 4-byte integer

section .text
    global main

main:
    push rbp

    mov rdi, question
    mov rax, 0
    call printf

    mov rdi, demande_age
    mov rax, 0
    call printf

    mov rdi, format
    mov rsi, age
    mov rax, 0
    call scanf

    mov eax, [age]
    cmp eax, 18
    jae supérieur

    mov rdi, si_inf
    mov rax, 0
    call printf
    jmp end

supérieur:
    mov rdi, si_sup
    mov rax, 0
    call printf

end:
    pop rbp
    mov rax, 60
    xor rdi, rdi
    syscall
