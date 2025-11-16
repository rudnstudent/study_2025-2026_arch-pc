;
; Самостоятельная работа (п. 6.4)
; Вариант 14
; Функция: f(x) = (x/2 + 8) * 3
;

%include 'in_out.asm'

SECTION .data
    msg_formula: DB 'f(x) = (x/2 + 8) * 3', 10, 0 ; 10 - код \n
    msg_prompt:  DB 'Vvedite x: ', 0
    msg_result:  DB 'Resultat: ', 0

SECTION .bss
    x_buf: RESB 80   ; Буфер для ввода x

SECTION .text
GLOBAL _start

_start:
    ; Вывод формулы на экран
    mov eax, msg_formula
    call sprintLF

    ; Вывод приглашения "Vvedite x: "
    mov eax, msg_prompt
    call sprint

    ; Чтение строки (ввод x)
    mov ecx, x_buf
    mov edx, 80
    call sread

    ; Преобразование строки в число (ASCII в Integer)
    mov eax, x_buf
    call atoi        ; Теперь в eax лежит число x

    ; Вычисление выражения f(x) = (x/2 + 8) * 3
    
    ; 1. x/2
    xor edx, edx     ; Очищаем edx для деления
    mov ebx, 2       ; Делитель = 2
    div ebx          ; eax = eax / ebx (т.е. x / 2). 
                     ; Результат (частное) в eax.
    
    ; 2. (x/2 + 8)
    add eax, 8       ; eax = (x/2) + 8
    
    ; 3. ... * 3
    mov ebx, 3
    mul ebx          ; eax = (x/2 + 8) * 3
                     ; Финальный результат в eax

    ; Сохраняем результат (eax) в edi,
    ; т.к. eax сейчас понадобится для вывода строки
    mov edi, eax

    ; Вывод "Resultat: "
    mov eax, msg_result
    call sprint
    
    ; Вывод самого результата
    mov eax, edi     ; Возвращаем результат в eax
    call iprintLF    ; Печатаем число и переводим строку

    call quit        ; Завершение
