default	rel 			; меняет настройки ассемблера для работы с адресами
global _ft_putchar		; позволяет видеть функцию из других файлов

section .text 			; основная секция для работы программы
_ft_putchar:
	mov [char], rdi		; запись в char адреса входящего аргумента (символа)
	mov rax, 0x02000004	; вызов write
	lea rsi, char		; lea копирует адрес: источник только переменная, приемник - адрес
	mov rdi, 1		; fd
	mov rdx, 1		; lenght
	syscall			; системный вызов
	ret			; return
section .data
char: db 0			; инициализация переменной со значением 0
