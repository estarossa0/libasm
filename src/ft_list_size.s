global	_ft_list_size

section	.text

_ft_list_size:
	xor		rax, rax

iter:
	cmp		qword rdi, 0
	jz		return
	inc		rax
	mov		rdi, [rdi + 8]
	jmp		iter

return:
	ret
