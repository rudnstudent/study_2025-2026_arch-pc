; Программа для самостоятельной работы
; Запрашивает имя и записывает его в файл

%include 'in_out.asm'

SECTION .data
    filename db 'name.txt', 0h      ; Имя создаваемого файла
    prompt db 'Как Вас зовут? ', 0h ; Вопрос пользователю
    my_name_is db 'Меня зовут ', 0h ; Первая часть сообщения для файла

SECTION .bss
    name resb 255                   ; Буфер для имени

SECTION .text
    global _start

_start:
    ; 1. Вывод приглашения "Как Вас зовут?"
    mov eax, prompt
    call sprint

    ; 2. Ввод имени с клавиатуры
    mov ecx, name
    mov edx, 255
    call sread

    ; 3. Создание файла name.txt
    mov ecx, 0777o      ; Права доступа
    mov ebx, filename   ; Имя файла
    mov eax, 8          ; sys_creat
    int 80h
    
    mov esi, eax        ; Сохраняем дескриптор файла в ESI

    ; 4. Запись фразы "Меня зовут " в файл
    ; Сначала найдем длину этой фразы
    mov eax, my_name_is
    call slen
    
    mov edx, eax        ; Длина строки "Меня зовут "
    mov ecx, my_name_is ; Адрес строки
    mov ebx, esi        ; Дескриптор
    mov eax, 4          ; sys_write
    int 80h

    ; 5. Дописывание введенного имени в файл
    ; Сначала найдем длину введенного имени
    mov eax, name
    call slen

    mov edx, eax        ; Длина имени
    mov ecx, name       ; Адрес буфера с именем
    mov ebx, esi        ; Дескриптор
    mov eax, 4          ; sys_write
    int 80h

    ; 6. Закрытие файла
    mov ebx, esi        ; Дескриптор
    mov eax, 6          ; sys_close
    int 80h

    call quit
