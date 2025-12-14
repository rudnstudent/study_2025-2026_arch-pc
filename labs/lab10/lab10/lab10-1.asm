; Программа записи в файл сообщения
; Листинг 10.1 из методички

%include 'in_out.asm'

SECTION .data
    filename db 'readme.txt', 0h    ; Имя файла
    msg db 'Введите строку для записи в файл: ', 0h ; Сообщение-подсказка

SECTION .bss
    contents resb 255              ; Переменная для вводимой строки

SECTION .text
    global _start

_start:
    ; --- Печать сообщения msg ---
    mov eax, msg
    call sprint

    ; --- Запись введенной с клавиатуры строки в contents ---
    mov ecx, contents
    mov edx, 255
    call sread

    ; --- Создание/Открытие файла ---
    ; В методичке используется sys_creat (8) для создания,
    ; но в тексте листинга также есть кусок с sys_open для открытия.
    ; Чтобы код соответствовал заданию "записи в файл сообщения",
    ; логичнее сначала создать файл. Используем sys_creat.
    
    mov ecx, 0777o      ; Права доступа (rwxrwxrwx) в восьмеричной системе
    mov ebx, filename   ; Имя файла
    mov eax, 8          ; Системный вызов sys_creat
    int 80h             ; Вызов ядра

    ; После sys_creat дескриптор файла лежит в EAX. 
    ; Сохраним его в ESI для дальнейшего использования.
    mov esi, eax

    ; --- Расчет длины введенной строки ---
    mov eax, contents   ; Адрес строки
    call slen           ; Расчет длины (результат в EAX)

    ; --- Запись в файл (sys_write) ---
    mov edx, eax        ; Количество байтов для записи (длина строки)
    mov ecx, contents   ; Адрес строки данных
    mov ebx, esi        ; Дескриптор файла
    mov eax, 4          ; Системный вызов sys_write
    int 80h

    ; --- Закрытие файла (sys_close) ---
    mov ebx, esi        ; Дескриптор файла
    mov eax, 6          ; Системный вызов sys_close
    int 80h

    call quit
