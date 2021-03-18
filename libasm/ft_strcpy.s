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

global _ft_strcpy

section .text
_ft_strcpy:							; rdi - dest, rsi - src
.main:
		cmp rsi, 0					; проверка на NULL
		je .return
		xor rbx, rbx				; i = 0
.cycle:
		mov al , byte[rsi + rbx]	; разименовали src[i]
		mov byte[rdi + rbx], al		; записали в dest[i]
		inc rbx						; i++
		cmp al, 0					; if src[i] != '\0' repeat
		jne .cycle

.return:
		mov rax, rdi
		ret
