global	_ft_strcpy
section .text

_ft_strcpy:
	mov		rax, rdi
while:
	cmp		byte [rsi], 0
	jz		return
	mov		cx, [rsi]
	mov		[rdi], cx
	inc		rdi
	inc		rsi
	jmp		while

return:
	mov		byte [rdi], 0
	ret
