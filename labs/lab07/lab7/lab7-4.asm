; Вычисление функции f(x) для Варианта 14
; f(x) = 3a + 1, если x < a
; f(x) = 3x + 1, если x >= a
%include 'in_out.asm'

section .data
    prompt_x db 'Введите x: ', 0
    prompt_a db 'Введите a: ', 0
    res_msg db 'Результат: ', 0

section .bss
    x resd 1
    a resd 1
    res resd 1

section .text
    global _start

_start:
    ; --- Ввод x ---
    mov eax, prompt_x
    call sprint
    mov ecx, x
    mov edx, 10
    call sread
    mov eax, x
    call atoi
    mov [x], eax

    ; --- Ввод a ---
    mov eax, prompt_a
    call sprint
    mov ecx, a
    mov edx, 10
    call sread
    mov eax, a
    call atoi
    mov [a], eax

    ; --- Сравнение x и a ---
    mov eax, [x]
    cmp eax, [a]
    jge case_greater_equal ; Если x >= a, прыгаем

    ; Ветка 1: x < a (Формула: 3a + 1)
    mov eax, [a]
    mov ebx, 3
    mul ebx           ; EAX = 3 * a
    add eax, 1        ; EAX = 3a + 1
    jmp print_res

case_greater_equal:
    ; Ветка 2: x >= a (Формула: 3x + 1)
    mov eax, [x]
    mov ebx, 3
    mul ebx           ; EAX = 3 * x
    add eax, 1        ; EAX = 3x + 1

print_res:
    mov [res], eax    ; Сохраняем результат
    
    push eax          ; Сохраняем EAX перед вызовом sprint
    mov eax, res_msg
    call sprint
    pop eax           ; Восстанавливаем EAX (результат)
    
    call iprintLF     ; Выводим число
    
    call quit
