; Нахождение наименьшего из 3 чисел
; Вариант 14: a=81, b=22, c=72
%include 'in_out.asm'

section .data
    msg_res db 'Наименьшее число: ', 0h
    ; Значения из Варианта 14
    val_a dd 81
    val_b dd 22
    val_c dd 72

section .bss
    min resd 1  ; Резервируем память под результат

section .text
    global _start

_start:
    ; 1. Сравниваем A и B
    mov eax, [val_a] ; EAX = A (81)
    mov ebx, [val_b] ; EBX = B (22)
    
    cmp eax, ebx     ; Сравниваем 81 и 22
    jl check_c       ; Если A < B, идем проверять C (здесь переход не случится)
    
    ; Если мы здесь, значит B <= A, то есть B пока минимум
    mov eax, ebx     ; EAX = 22 (текущий минимум)

check_c:
    ; Здесь в EAX лежит min(A, B). Сравниваем его с C
    mov ecx, [val_c] ; ECX = C (72)
    cmp eax, ecx     ; Сравниваем 22 и 72
    jl fin           ; Если 22 < 72, то прыгаем на выход
    
    ; Если бы C было меньше, мы бы записали его в EAX
    mov eax, ecx     

fin:
    mov [min], eax   ; Сохраняем результат (должно быть 22)

    ; Вывод
    mov eax, msg_res
    call sprint
    mov eax, [min]
    call iprintLF
    
    call quit
