global _ft_write		; позволяет видеть функцию из других файлов
extern ___error

section .bss

section .text 			; основная секция для работы программы

_ft_write:
	mov rax, 0x02000004	; вызов write
	syscall				; системный вызов
	jc _error			; переход к ошибке, если флаг переноса установлен в 1. (if CF = 1)
	ret					; return если все ок, в rax будет количество напечатанных символов

_error:
	push rax			; сохраняем код ошибки
	call ___error 		; записывает в rax адрес errno
	pop rbx				; возвращаем из стека код ошибки в буфер
	mov [rax], rbx		; записываем в errno код ошибки
	mov rax, -1			; возвращаем -1
	ret
