global _ft_list_push_front
extern _malloc
section .text

_ft_list_push_front:
	cmp		rdi, 0
	jz		return
	push	rdi
	push	rsi
	sub		rsp, 8
	mov		rdi, 16
	call	_malloc
	add		rsp, 8
	pop		rsi
	pop		rdi
	cmp		qword rax, 0
	jz		return
	mov		[rax], rsi
	cmp		qword [rdi], 0
	jz		is_null

is_not_null:
	push	rbx
	mov		rbx, [rdi]
	mov		[rax + 8], rbx
	mov		[rdi], rax
	pop		rbx
	ret


is_null:
	mov		qword [rax + 8], 0
	mov		[rdi], rax
	ret

return:
	ret
