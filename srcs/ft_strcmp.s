global	_ft_strcmp
section	.text

_ft_strcmp:
while:
	cmp		byte [rdi], 0
	jz		return
	cmp		byte [rsi], 0
	jz		return
	mov		rcx, [rdi]
	sub		rcx, [rsi]
	cmp		cl, 0
	jl		down
	jg		greater
	inc		rsi
	inc		rdi
	jmp		while

return:
	mov		rcx, [rdi]
	sub		rcx, [rsi]
	cmp		cl, 0
	jl		down
	jg		greater
	mov		rax, 0
	ret
down:
	mov	rax, -1
	ret

greater:
	mov		rax, 1
	ret

