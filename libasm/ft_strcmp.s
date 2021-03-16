;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_strcmp.s                                        :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: tsaiyan <tsaiyan@42.fr>                    +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2021/03/16 21:29:30 by tsaiyan           #+#    #+#              #
;#    Updated: 2021/03/16 21:29:32 by tsaiyan          ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

; rdi - s1, rsi - s2

global _ft_strcmp

section .text
_ft_strcmp:
	lea rdx, [rdi]
	lea	rcx, [rsi]
	cmp  rdx, rcx
	je _exit
	push rdi
	mov rdi, [rdi]
	pop rdi
	inc rdi
_exit:
	xor rax, rax
	ret
