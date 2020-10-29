global _ft_list_push_front
extern _malloc
section .text

_ft_list_push_front:
	cmp		qword rdi, 0
	jz		return
	call	create
	cmp		byte [rdi], 0
	jz		is_null
	jnz		is_not_null

is_not_null:
	push	rbx
	push	rsi
	mov		rbx, [rdi]
iter:
	cmp		qword [rbx + 8], 0
	jz		add_tail
	mov		rsi, [rbx + 8]
	mov		rbx, rsi
	jmp		iter

add_tail:
	mov		qword [rax + 8], 0
	mov		[rbx + 8], rax
	pop		rsi
	pop		rbx
	ret

create:
	push	rdi
	push	rsi
	mov		rdi, 16
	call	_malloc
	pop		rsi
	pop		rdi
	mov		[rax], rsi
	ret

is_null:
	mov		[rdi], rax
	mov		qword [rdi + 8], 0
	mov		rsi, [rbx]
	ret

return:
	ret
