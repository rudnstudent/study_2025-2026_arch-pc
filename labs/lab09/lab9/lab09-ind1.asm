; lab09-ind1.asm
; Самостоятельная работа №1 (Вариант 14)
; Преобразование программы из ЛР8 с использованием подпрограммы.
; Выражение для Варианта 14: f(x) = 2x + 10 
; (Если формула отличается, измените значения ebx и add)

%include 'in_out.asm'

SECTION .data
msg: DB 'Введите x (Вариант 14: 2x + 10): ',0
res_msg: DB 'Ответ: ',0

SECTION .bss
x: RESB 80
res: RESB 80

SECTION .text
GLOBAL _start

_start:
    ; Запрос данных
    mov eax, msg
    call sprint

    mov ecx, x
    mov edx, 80
    call sread

    mov eax, x
    call atoi       ; EAX = введенное число x

    call _function_variant ; Вызов подпрограммы вычисления

    ; Вывод результата
    mov eax, res_msg
    call sprint
    mov eax, [res]
    call iprintLF

    call quit

; --- Подпрограмма вычисления для Варианта 14 ---
; f(x) = 2x + 10
_function_variant:
    mov ebx, 2      ; Множитель
    mul ebx         ; EAX = x * 2
    add eax, 10     ; EAX = EAX + 10
    mov [res], eax  ; Сохранение результата
    ret
