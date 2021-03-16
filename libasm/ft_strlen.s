global _ft_strlen

section .text

_ft_strlen:
	xor rax, rax					; зануление возвращаемого значения
	cmp rdi, 0					; проверка на NULL
	je _exit
_cycle:
	cmp  byte [rdi + rax], 0	; разименование со смещением на n
	je _exit					; если cmp = 0, выход
	inc rax						; i++
	jmp _cycle				; безусловный переход
	
_exit:
	ret							; return
