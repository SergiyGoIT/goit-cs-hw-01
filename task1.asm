org 0x100               ; Вказуємо, що це програма .COM

section .data
    a db 5              ; Визначаємо a = 5
    b db 3              ; Визначаємо b = 3
    c db 2              ; Визначаємо c = 2
    resultMsg db 'Result: $' ; Рядок повідомлення для виведення

section .text
_start:
    mov al, [b]         ; AL = b
    sub al, [c]         ; AL = b - c
    add al, [a]         ; AL = b - c + a

    ; Перетворення результату в ASCII-символ (для однозначного результату 0..9)
    add al, 30h         ; AL = ASCII('0') + результат

    ; Виведення повідомлення "Result: "
    mov ah, 09h
    lea dx, resultMsg
    int 21h

    ; Виведення результату (один символ)
    mov dl, al
    mov ah, 02h
    int 21h

    ; Завершення програми
    mov ax, 4c00h
    int 21h
