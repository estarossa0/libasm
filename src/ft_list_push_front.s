global _ft_list_push_front
extern _malloc
section .text

_ft_list_push_front:
	cmp		qword rdi, 0
	jz		return
	call	create
	cmp		qword [rdi], 0
	jz		is_null

is_not_null:
	push	rbx
	mov		rbx, [rdi]
	mov		[rax + 8], rbx
	mov		[rdi], rax
	pop		rbx
	jmp		return

create:
	push	rdi
	push	rsi
	mov		rdi, 16
	call	_malloc
	pop		rsi
	pop		rdi
	cmp		qword rax, 0
	jz		return
	mov		[rax], rsi
	ret

is_null:
	push	rbx
	mov		[rdi], rax
	mov		rbx, [rdi]
	add		rbx, 8
	mov		qword [rbx], 0
	mov		rsi, [rbx]
	pop		rbx
	ret

return:
	ret
