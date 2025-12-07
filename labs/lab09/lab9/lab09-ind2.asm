
; Самостоятельная работа №2 (Вариант 14)
; Вычисление выражения f(x) = 2x + 10.
; В отличие от Задания 1, здесь используется прямое вычисление без подпрограммы.

%include 'in_out.asm'

SECTION .data
msg: DB 'Введите x (для 2x + 10, Самостоятельная 2): ',0
result: DB 'Результат: ',0

SECTION .bss
x_input: RESB 80
res: RESB 80

SECTION .text
GLOBAL _start

_start:
    ; Запрос данных
    mov eax, msg
    call sprint

    mov ecx, x_input
    mov edx, 80
    call sread

    mov eax, x_input
    call atoi       ; EAX = введенное число x

    ; --- Вычисление 2x + 10 ---
    mov ebx, 2
    mul ebx         ; EAX = x * 2
    add eax, 10     ; EAX = EAX + 10
    
    mov [res], eax  ; Сохранение результата в память

    ; ---- Вывод результата на экран
    mov eax, result
    call sprint
    mov eax, [res]
    call iprintLF
    
    call quit
