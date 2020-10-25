global	_ft_list_sort
extern	_vibe_check
extern	_nibe_check
extern	_test
;i = rbx
;j = rbp
;tmp = r12

section .text

_ft_list_sort:
cmp		rdi, 0
jz		exit
cmp		qword [rdi], 0
jz		exit
push	rbx
push	rbp
push	r12
sub		rsp, 24

mov		rbx, [rdi]
outer_loop:
cmp		qword [rbx + 8], 0
jz		return
mov		rbp, [rdi]
inner_loop:
cmp		qword [rbp + 8], 0
jz		outer_iter

compare:
push	rdi
push	rsi
mov		rdi, [rbp]
mov		r12, rsi
mov		rsi, [rbp + 8]
mov		rsi, [rsi]
call	r12
mov		rsi, r12
pop		rsi
pop		rdi
cmp		eax, 0
jl		inner_iter


swap:
push	rdi
mov		r12, [rbp]
mov		rdi, [rbp + 8]
mov		rdi, [rdi]
mov		[rbp], rdi
mov		rdi, [rbp + 8]
mov		[rdi], r12
pop		rdi

inner_iter:
mov		rbp, [rbp + 8]
jmp		inner_loop

outer_iter:
mov		rbx, [rbx + 8]
jmp		outer_loop

return:
add		rsp, 24
pop		r12
pop		rbp
pop		rbx
ret

exit:
ret
