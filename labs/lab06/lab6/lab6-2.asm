; Здесь мы складываем числа 6 и 4
; и используем 'iprint' (не 'iprintLF') для вывода.

%include 'in_out.asm'

SECTION .text
GLOBAL _start

_start:
    mov eax, 6      ; Загружаем число 6
    mov ebx, 4      ; Загружаем число 4
    add eax, ebx    ; Складываем, eax = 10
    
    ; Выводим результат (число 10) на экран
    ; Используем iprint, который НЕ добавляет перевод строки
    call iprint

    call quit       ; Выход из программы
