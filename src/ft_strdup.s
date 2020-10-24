global	_ft_strdup
extern	_malloc
extern	_ft_strcpy
section .text

_ft_strdup:
	push	rbx
	call	_malloc
	cmp		rax, 0
	jz		return
	pop		rbx

return
	ret
