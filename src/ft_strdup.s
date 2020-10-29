global	_ft_strdup
extern	_malloc
extern	_ft_strlen
extern	_ft_strcpy
section .text

_ft_strdup:
	push	rbx
	sub		rsp, 8
	push	rdi
	call	_ft_strlen
	mov		rdi, rax
	call	_malloc
	pop		rdi
	cmp		rax, 0
	jz		return
	mov		rsi, rdi
	mov		rdi, rax
	call	_ft_strcpy

return:
	add		rsp, 8
	pop		rbx
	ret
