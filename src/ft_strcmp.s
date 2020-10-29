global	_ft_strcmp
section	.text

_ft_strcmp:
while:
	cmp		byte [rdi], 0
	jz		return
	cmp		byte [rsi], 0
	jz		return
	mov		rcx, [rdi]
	cmp		rcx, [rsi]
	jl		greater
	jg		down
	inc		rsi
	inc		rdi
	jmp		while

return:
	mov		rcx, [rdi]
	cmp		rcx, [rsi]
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

