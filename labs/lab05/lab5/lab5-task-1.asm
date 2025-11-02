SECTION .data
    msg: DB 'Введите строку:',10
    msgLen: EQU $-msg

SECTION .bss
    buf1: RESB 80 ; Буфер для вводимой строки

SECTION .text
    GLOBAL _start
_start:
    ; 1. Выводим приглашение "Введите строку:"
    mov eax,4       ; sys_write
    mov ebx,1       ; stdout
    mov ecx,msg     ; адрес сообщения
    mov edx,msgLen  ; длина сообщения
    int 80h

    ; 2. Читаем ввод с клавиатуры в buf1
    mov eax, 3      ; sys_read
    mov ebx, 0      ; stdin
    mov ecx, buf1   ; адрес буфера
    mov edx, 80     ; максимальная длина
    int 80h

    ; 3. Выводим то, что ввели (содержимое buf1)
    mov eax, 4      ; sys_write
    mov ebx, 1      ; stdout
    mov ecx, buf1   ; адрес буфера, который мы только что заполнили
    mov edx, 80     ; Длина буфера (можно и меньше, но 80 безопасно)
    int 80h

    ; 4. Выход
    mov eax,1       ; sys_exit
    mov ebx,0       ; код возврата 0
    int 80h
