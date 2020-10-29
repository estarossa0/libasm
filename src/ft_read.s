global	_ft_read
extern ___error
section .text

_ft_read:
	mov rax, 0x02000003
	syscall
	jc	error
	ret

error:
	push rax
	call	___error
	mov		rbx, rax
	pop		rax
	mov		[rbx], rax
	mov		rax, -1
	ret
