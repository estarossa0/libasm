global _vibe_check

section .text

_vibe_check:
	push	rax
	push	rdi
	push	rdx
	push	rsi
	; sub		rsp, 8
	mov		rax, 0x02000004
	mov		rdi, 1
	mov		rdx, 1
	mov		rsi, msg
	syscall
	; add		rsp, 8
	pop		rsi
	pop		rdx
	pop		rdi
	pop		rax
	ret

section   .data
msg:  db	"v", 0
