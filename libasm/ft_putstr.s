extern _ft_putchar

global _ft_putstr

section .text
_ft_putstr:
	cmp  byte [rdi], 0
	je _exit
	push rdi
	mov rdi, [rdi]
	call _ft_putchar
	pop rdi
	inc rdi
	jnz _ft_putstr
_exit:
	xor rax, rax
	ret
