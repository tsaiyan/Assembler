global    _main

section   .text

_main:
	mov rcx, 10
_cycle:
	mov		rax, 0x02000004
	mov		rdi, 1
	mov		rsi, message
	mov		rdx, len
	syscall
	dec rcx
	jnz _cycle
_end:
	mov		rax, 0x02000001
	xor		rdi, rdi
	syscall

section   .data
message:  db		 "Hello, World", 10
len: equ $ - message
