; Программа вычисления ПРОИЗВЕДЕНИЯ аргументов командной строки

%include 'in_out.asm'

SECTION .data
msg db "Результат (произведение): ",0

SECTION .text
global _start

_start:
    pop ecx     ; Количество аргументов
    pop edx     ; Имя программы
    sub ecx, 1  ; Исключаем имя программы из счета

    mov esi, 1  ; Инициализируем esi единицей (для умножения нейтральный элемент - 1)

next:
    cmp ecx, 0h ; Проверка на окончание аргументов
    jz _end

    pop eax     ; Извлекаем аргумент
    call atoi   ; Преобразуем строку в число
    
    imul esi, eax ; Умножаем текущий результат (esi) на число (eax)

    loop next   ; Повторяем цикл

_end:
    mov eax, msg
    call sprint
    
    mov eax, esi ; Переносим результат в eax для вывода
    call iprintLF
    
    call quit
