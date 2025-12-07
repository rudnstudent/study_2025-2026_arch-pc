; lab09-2.asm
; Простая программа для вывода "Hello, world!", используемая для отладки GDB
; (Этот файл предназначен для задания 3.2 "Отладка программ с помощью GDB")

SECTION .data
msg1: db "Hello, ",0x0
msg1Len: equ $ - msg1
msg2: db "world!",0xa
msg2Len: equ $ - msg2

SECTION .text
global _start

_start:
    ; Вывод "Hello, "
    mov eax, 4      ; sys_write
    mov ebx, 1      ; stdout
    mov ecx, msg1   ; адрес строки
    mov edx, msg1Len - 1 ; длина строки (без нулевого символа)
    int 0x80
    
    ; Вывод "world!\n"
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, msg2Len
    int 0x80
    
    ; Выход
    mov eax, 1      ; sys_exit
    mov ebx, 0      ; код возврата
    int 0x80
