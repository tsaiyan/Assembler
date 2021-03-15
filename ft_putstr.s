global _ft_putstr

section .data
	len: $ - rdi

section .text
_ft_putstr:
	mov	rax, 0x02000004
	mov	rsi, rdi
	mov	rdi, 1
	mov	rdx, equ $ - rdi
	syscall
	ret
