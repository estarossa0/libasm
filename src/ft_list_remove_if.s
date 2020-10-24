global	_ft_list_remove_if
extern	_free
section .text

;rbx	: current
;//		: prev
;//		: tmp
_ft_list_remove_if:
cmp		qword rdi, 0
jz		exit
cmp		qword [rdi], 0
jz		exit
push	rbx
mov		rbx, [rdi]
first_part:
	cmp		qword rbx, 0
	jz		second_part
	cmp		qword [rbx + 8], 0
	jz		second_part
	push	rdi
	mov		rdi, [rbx + 8]
	mov		rdi, [rdi]
	push	rdx
	push	rsi
	call	rdx
	pop		rsi
	pop		rdx
	pop		rdi
	cmp		rax, 0
	jz		remove

iter:
	mov		rbx, [rbx + 8]
	jmp		first_part


remove:
; call vibe_check
	push	rdi
	push	rcx
	mov		rdi, [rbx + 8]
	mov		rcx, rbx
	mov		rcx, [rcx + 8]
	mov		rcx, [rcx + 8]
	mov		[rbx + 8], rcx
	push	rdx
	push	rsi
	call	_free
	pop		rsi
	pop		rdx
	pop		rcx
	pop		rdi
	jmp	iter

second_part:
	mov		rbx, [rdi]
	cmp		qword rbx, 0
	jz		return
	push	rdi
	mov		rdi, [rbx]
	call	rdx
	pop		rdi
	cmp		rax, 0
	jnz		return
	mov		rax, [rbx+8]
	mov		[rdi], rax
	push	rdi
	sub		rsp, 8
	mov		rdi, rbx
	call	_free
	add		rsp, 8
	pop		rdi
	pop		rbx
	ret
return:
	pop rbx
	ret
exit:
	ret
