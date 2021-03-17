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

extern _ft_putchar

global _ft_putstr

section .text
_ft_putstr:
.main:
		cmp  byte [rdi], 0
		je .exit
		push rdi
		mov rdi, [rdi]
		call _ft_putchar
		pop rdi
		inc rdi
		jnz _ft_putstr
.exit:
		xor rax, rax
		ret
