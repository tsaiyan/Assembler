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

global _ft_strcmp

section .text
_ft_strcmp:							; rdi - s1, rsi - s2
.main:
		xor rbx, rbx				; i = 0
.cycle:
		mov al , byte[rdi + rbx]	; получение значения 1 аргумента
		mov dl , byte[rsi + rbx]	; получение значения 2 аргумента
		cmp al, 0					; проверяем, что 1 строка не закончена
		je .exit
		cmp dl, 0					; проверяем, что 2 строка не закончилась
		je .exit
		inc rbx						; i++
		cmp al, dl					; if str[i] = str2[i] повторяем цикл
		je .cycle
.exit:
		movzx rax, al				; movzx - записывает в аргумент большего размера из меньшего
		movzx rcx, dl
		sub rax, rcx				; str[i] - str2[i]
.return:
		ret
