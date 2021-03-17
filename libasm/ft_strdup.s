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

global _ft_strdup

extern _ft_strlen
extern _ft_strcpy
extern _malloc

section .text
_ft_strdup:
.test:
		cmp rdi, 0					; rdi = src (первый аргумент)
		je .error					; проверка на NULL (je - если cmp true)
.main:
		push rdi					; сохраняем адрес строки в стек
		call _ft_strlen				; считаем ее длину
		mov rdi, rax				; кладем в 1 аргумент длину строки (результат strlen)
		call _malloc				; malloc берет из rdi длину и возвращает указатель в rax
		test rax, rax				; проверка malloc через логические И (test меняет флаги)
		jz .error					; выход если флаг ZF = 0, что значит malloc вернул NULL
		mov rdi, rax				; записали в первый агрумент аллоцированную строку
		pop rsi						; забрали строку src из стека и записали в rsi (2 аргумент)
		call _ft_strcpy				; записали src в dest (rdi - dest, rsi - src)
		ret
.error:
		xor rax, rax				; возвращаем NULL
		ret
