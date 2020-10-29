global	_ft_list_remove_if
extern	_free
extern	_vibe_check
section .text

;rbx	: current
;rbp	: prev
;r12	: tmp

_ft_list_remove_if:

check:
cmp		qword rdi, 0
jz		exit
cmp		qword [rdi], 0
jz		exit
push	rbx
push	rbp
push	r12
sub		rsp, 24
first_loop:
cmp		qword [rdi], 0
jz		return
push	rdi
push	rsi
push	rdx
mov		rdi, [rdi]
mov		rdi, [rdi]
call	rdx
pop		rdx
pop		rsi
pop		rdi
cmp		rax, 0
jz		remove_head
jmp		second_loop_init

remove_head:
mov		rbp, [rdi]
mov		rbx, [rbp + 8]
mov		[rdi], rbx
push	rdi
push	rsi
push	rdx
mov		rdi, rbp
call	_free
pop		rdx
pop		rsi
pop		rdi
jmp		first_loop

second_loop_init:
cmp		qword [rdi], 0
jz		return
mov		rbx, [rdi]
mov		rbx, [rbx + 8]
mov		rbp, [rdi]

second_loop:
cmp		rbx, 0
jz		return
push	rdi
push	rsi
push	rdx
mov		rdi, [rbx]
call	rdx
pop		rdx
pop		rsi
pop		rdi
cmp		rax, 0
jnz		iter

remove_curr:
mov		r12, rbx
mov		rbx, [rbx + 8]
mov		[rbp + 8], rbx
push	rdi
push	rsi
push	rdx
mov		rdi, r12
call	_free
pop		rdx
pop		rsi
pop		rdi
jmp		second_loop

iter:
mov		rbx, [rbx + 8]
mov		rbp, [rbp + 8]
jmp		second_loop

return:
add		rsp, 24
pop		r12
pop		rbp
pop		rbx
ret

exit:
ret
