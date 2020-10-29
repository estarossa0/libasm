global	_ft_atoi_base
extern	_vibe_check

_ft_atoi_base:
push	rbx
push	rbp
push	r12
push	r13
sub		rsp, 24

;rbx = i
;rbp = j
get_base:
mov		rbx, rsi
get_base_outer_loop:
cmp		byte [rbx], 0
jz		get_base_end
mov		rbp, rbx
inc		rbp
cmp		byte [rbx], 43 ; ascii(43) = '+'
je		fail
cmp		byte [rbx], 45 ; ascii(45) = '-'
je		fail
get_base_inner_loop:
cmp		byte [rbp], 0
jz		get_base_outer_loop_inc
mov		r12b, [rbx]
cmp		r12b, [rbp]
je		fail
inc		rbp
jmp		get_base_inner_loop
get_base_outer_loop_inc:
inc		rbx
jmp		get_base_outer_loop
get_base_end:
sub		rbx, rsi
;call	_vibe_check
check_error_get_sign:
mov		r12, rbx ;saving base in r12
cmp		r12, 0
je		fail
cmp		r12, 1
je		fail
mov		r13, 1	;saving sign in r13
cmp		byte [rdi], 43 ; ascii(43) = '+'
jne		skip1
inc		rdi
jmp		skip2
skip1:
cmp		byte [rdi], 45 ; ascii(43) = '-'
jne		skip2
inc		rdi
mov		r13, -1
skip2:
mov		rbx, rdi
get_lenght:
cmp		byte [rbx], 0
jz		get_lenght_end
cmp		byte [rbx], 43 ; ascii(43) = '+'
je		fail
cmp		byte [rbx], 45 ; ascii(43) = '-'
je		fail
inc		rbx
jmp		get_lenght
get_lenght_end:
sub		rbx, rdi
cmp		rbx, 0
jz		fail
mov		r14, rbx ; saving lenght in r14
dec		r14
mov		rax, 0

convert_loop:
cmp		r14, 0
jl		end
mov		rbx, rsi
get_value:
cmp		byte [rbx], 0
jz		fail
mov		bpl, [rdi]
cmp		bpl, [rbx]
je		get_value_end
inc		rbx
jmp		get_value
get_value_end:
sub		rbx, rsi
push	r14
mov		rbp, 1
power:
cmp		r14, 0
jz		power_end
imul	rbp, r12
dec		r14
jmp		power
power_end:
pop		r14
imul	rbx, rbp
add		rax, rbx
dec		r14
inc		rdi
jmp		convert_loop
end:
imul	rax, r13
add		rsp, 24
pop		r13
pop		r12
pop		rbp
pop		rbx
ret

fail:
add		rsp, 24
pop		r13
pop		r12
pop		rbp
pop		rbx
mov		rax, 0
ret
