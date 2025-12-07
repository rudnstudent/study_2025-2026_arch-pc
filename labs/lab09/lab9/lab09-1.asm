; lab09-1.asm
; Программа вычисления выражения f(g(x)), где f(x)=2x+7, g(x)=3x-1
; Использует вложенные подпрограммы

%include 'in_out.asm'

SECTION .data
msg: DB 'Введите x: ',0
result: DB 'Результат f(g(x)): ',0

SECTION .bss
x: RESB 80
res: RESB 80

SECTION .text
GLOBAL _start

_start:
    ; --- Основная программа ---
    mov eax, msg
    call sprint     ; Вывод приглашения

    mov ecx, x
    mov edx, 80
    call sread      ; Чтение x

    mov eax, x
    call atoi       ; Преобразование ASCII в число, результат в EAX
    
    call _calcul    ; Вызов подпрограммы вычисления f(g(x))

    mov eax, result
    call sprint     ; Вывод текста результата
    
    mov eax, [res]
    call iprintLF   ; Вывод значения результата
    
    call quit       ; Выход

; --- Подпрограмма вычисления f(result_g) = 2*result_g + 7 ---
_calcul:
    push ebx        ; Сохраняем регистры (хороший тон, хотя здесь не обязательно)
    
    call _subcalcul ; Вызов вложенной подпрограммы для расчета g(x)
    ; В EAX сейчас находится результат g(x)

    mov ebx, 2
    mul ebx         ; EAX = EAX * 2 (то есть g(x) * 2)
    add eax, 7      ; EAX = EAX + 7

    mov [res], eax  ; Сохраняем итоговый результат в память
    
    pop ebx         ; Восстанавливаем регистры
    ret             ; Возврат в основную программу

; --- Подпрограмма вычисления g(x) = 3x - 1 ---
_subcalcul:
    ; На входе в EAX лежит x
    mov ebx, 3
    mul ebx         ; EAX = x * 3
    sub eax, 1      ; EAX = EAX - 1
    ret             ; Возврат в _calcul
