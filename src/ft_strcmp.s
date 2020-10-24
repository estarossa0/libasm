global	_ft_strcmp
section	.text

_ft_strcmp:
while:
	cmp		byte [rdi], 0
	jz		return
	cmp		byte [rsi], 0
	jz		return
	mov		al, [rdi]
	cmp		al, [rsi]
	jne		return
	inc		rsi
	inc		rdi
	jmp		while

return:
	mov		rax, 0
	mov		rcx, 0
	mov		cl, [rsi]
	sub		rax, rcx
	ret
