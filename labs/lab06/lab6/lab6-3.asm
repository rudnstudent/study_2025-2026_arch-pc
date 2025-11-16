; Это измененная версия Листинга 6.3
; по заданию из п. 6.3.2, шаг 6.

%include 'in_out.asm'

SECTION .data
    div_msg: DB 'Результат: ', 0        ; Сообщение о результате
    rem_msg: DB 'Остаток от деления: ', 0 ; Сообщение об остатке

SECTION .text
GLOBAL _start

_start:
    ; Вычисление выражения (4*6+2)/5
    mov eax, 5      ; EAX = 4
    mov ebx, 2      ; EBX = 6
    mul ebx         ; EAX = EAX * EBX (4 * 6 = 24)
    
    add eax, 3      ; EAX = EAX + 2 (24 + 2 = 26)
    
    xor edx, edx    ; Обнуляем EDX для корректной работы div
    mov ebx, 3      ; EBX = 5 (делитель)
    div ebx         ; EAX = EAX / EBX (26 / 5 = 5)
                    ; EDX = остаток от деления (26 % 5 = 1)
    
    mov edi, eax    ; Сохраняем результат (частное) в edi

    ; Вывод результата на экран
    mov eax, div_msg
    call sprint     ; Печатаем сообщение 'Результат: '
    
    mov eax, edi    ; Загружаем результат (5) в eax
    call iprintLF   ; Печатаем число из eax и переводим строку

    ; Вывод остатка на экран
    mov eax, rem_msg
    call sprint     ; Печатаем сообщение 'Остаток от деления: '
    
    mov eax, edx    ; Загружаем остаток (1) в eax
    call iprintLF   ; Печатаем число из eax и переводим строку

    call quit       ; Вызов подпрограммы завершения
