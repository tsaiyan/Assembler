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

default	rel 				; включение относительной адресации
global _ft_putchar			; позволяет видеть функцию из других файлов

section .bss				; секция неициализированных данных
		char resb 1			; резервирование 1 байта в переменную char

section .text 				; основная секция для работы программы
_ft_putchar:
.main:
		mov [char], rdi		; запись в char адреса входящего аргумента (символа)
		mov rax, 0x02000004	; вызов write
		lea rsi, char		; lea копирует адрес: источник только переменная, приемник - адрес
		mov rdi, 1			; fd
		mov rdx, 1			; lenght
		syscall				; системный вызов
.return:
		xor rax, rax
		ret					; return
