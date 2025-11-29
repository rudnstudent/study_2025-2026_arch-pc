; Программа для самостоятельной работы
; Вариант 14: f(x) = x + 12
; Сумма значений функции для переданных аргументов

%include 'in_out.asm'

SECTION .data
msg_func db "Функция: f(x) = x + 12", 0
msg_res  db "Результат (сумма): ", 0

SECTION .text
global _start

_start:
    ; Вывод информации о функции
    mov eax, msg_func
    call sprintLF

    pop ecx     ; Количество аргументов (argc)
    pop edx     ; Имя программы (argv[0])
    sub ecx, 1  ; Исключаем имя программы

    mov esi, 0  ; В esi будем накапливать общую сумму результатов

next_arg:
    cmp ecx, 0h
    jz print_res

    pop eax     ; Берем очередной аргумент x
    call atoi   ; Преобразуем строку в число (x)
    
    ; --- Вычисление f(x) = x + 12 ---
    ; eax уже содержит x
    add eax, 12  ; eax = x + 12
    ; ---------------------------------

    add esi, eax ; Добавляем результат функции к общей сумме (esi += f(x))
    
    loop next_arg

print_res:
    mov eax, msg_res
    call sprint
    
    mov eax, esi ; Выводим накопленную сумму
    call iprintLF
    
    call quit
