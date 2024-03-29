;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    libasm                                             :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: tsaiyan <tsaiyan@42.fr>                    +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2021/03/16 21:29:30 by tsaiyan           #+#    #+#              #
;#    Updated: 2021/03/16 21:29:32 by tsaiyan          ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

global _ft_read				; позволяет видеть функцию из других файлов

extern ___error

section .text 				; основная секция для работы программы
_ft_read:
.main:
		mov rax, 0x02000003	; вызов read
		syscall				; системный вызов
		jc .error			; переход к ошибке, если флаг переноса установлен в 1. (if CF = 1)
		ret					; return если все ок, в rax будет количество напечатанных символов

.error:
		push rax			; сохраняем код ошибки
		call ___error 		; записывает в rax адрес errno
		pop rbx				; возвращаем из стека код ошибки в буфер
		mov [rax], rbx		; записываем в errno код ошибки
		mov rax, -1			; возвращаем -1
		ret
