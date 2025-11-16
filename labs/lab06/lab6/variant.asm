;
; Программа вычисления варианта
; Листинг 6.4 из методички
;

%include 'in_out.asm'

SECTION .data
    msg: DB 'Введите № студенческого билета: ', 0
    rem: DB 'Ваш вариант: ', 0

SECTION .bss
    x: RESB 80       ; Буфер для ввода номера студ. билета

SECTION .text
GLOBAL _start

_start:
    ; Вывод приглашения
    mov eax, msg
    call sprintLF

    ; Чтение номера билета
    mov ecx, x       ; Адрес буфера
    mov edx, 80      ; Макс. длина
    call sread

    ; Преобразование строки в число
    mov eax, x
    call atoi        ; Результат (число) будет в eax

    ; Вычисление варианта: (S_n mod 20) + 1
    xor edx, edx     ; Обнуляем edx
    mov ebx, 20      ; Делитель 20
    div ebx          ; Делим S_n на 20. Частное в eax, остаток в edx

    inc edx          ; edx = (остаток) + 1. Это и есть номер варианта

    ; Вывод сообщения "Ваш вариант: "
    mov eax, rem
    call sprint

    ; Вывод номера варианта
    mov eax, edx     ; Перемещаем номер варианта в eax
    call iprintLF    ; Печатаем его

    call quit        ; Завершение программы
