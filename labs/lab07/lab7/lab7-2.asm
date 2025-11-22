; Программа нахождения максимального из 3 чисел (A, B, C)
%include 'in_out.asm'

section .data
    msg1 db 'Введите B: ', 0h      ; Приглашение для ввода
    msg2 db 'Наибольшее число: ', 0h 
    A dd '20'                      ; Число A жестко задано как строка для примера
    C dd '50'                      ; Число C жестко задано

section .bss
    max resb 10    ; Переменная для хранения максимума
    B resb 10      ; Буфер для ввода числа B

section .text
    global _start

_start:
    ; --- Вывод приглашения и ввод B ---
    mov eax, msg1
    call sprint
    
    mov ecx, B
    mov edx, 10
    call sread
    
    ; --- Преобразование B из строки в число ---
    mov eax, B
    call atoi      ; Теперь в EAX лежит число B
    mov [B], eax   ; Сохраняем число B обратно в память (уже как число)

    ; --- Преобразование A из строки в число и запись в max ---
    mov ecx, [A]   ; ECX = '20' (символы)
    mov [max], ecx ; max = '20'
    
    cmp ecx, [C]   ; Сравниваем A и C (как символы, согласно методичке)
    jg check_B     ; Если A > C, то идем проверять B
    mov ecx, [C]   ; Иначе берем C
    mov [max], ecx ; max = C

check_B:
    ; --- Преобразование текущего max в число для сравнения с B ---
    mov eax, max
    call atoi      ; EAX = числовое значение max
    mov [max], eax ; Сохраняем число в max
    
    ; --- Сравнение max и B ---
    mov ecx, [max]
    cmp ecx, [B]   ; Сравниваем текущий максимум с B
    jg fin         ; Если max > B, то прыгаем на вывод
    mov ecx, [B]   ; Иначе B больше
    mov [max], ecx ; max = B

fin:
    ; --- Вывод результата ---
    mov eax, msg2
    call sprint
    mov eax, [max]
    call iprintLF  ; Вывод числа
    call quit
