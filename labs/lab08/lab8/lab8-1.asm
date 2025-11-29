; Программа вывода значений регистра 'ecx'
; Версия с использованием стека для корректной работы цикла

%include 'in_out.asm'

SECTION .data
msg1 db 'Введите N: ',0h

SECTION .bss
N: resb 10

SECTION .text
global _start
_start:
    ; --- Вывод сообщения 'Введите N: ' ---
    mov eax, msg1
    call sprint

    ; --- Ввод 'N' ---
    mov ecx, N
    mov edx, 10
    call sread

    ; --- Преобразование 'N' из символа в число ---
    mov eax, N
    call atoi
    mov [N], eax

    ; --- Организация цикла ---
    mov ecx, [N] ; Счетчик цикла, ecx=N

label:
    ; Сохраняем текущее значение ecx в стек, так как
    ; функции вывода и арифметические операции могут его изменить
    push ecx 
    
    sub ecx, 1      ; Уменьшаем значение (для демонстрации изменения внутри цикла)
    mov [N], ecx
    mov eax, [N]
    call iprintLF   ; Вывод значения N
    
    ; Восстанавливаем значение ecx из стека для корректной работы loop
    pop ecx
    
    loop label      ; Уменьшает ecx на 1 и переходит на label, если ecx != 0

    call quit
