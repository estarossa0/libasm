global	_ft_read
section .text

_ft_read:
	mov rax, 0x02000003
	syscall
	ret
