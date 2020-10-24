global	_remove_if
extern	_free
extern _foo
section .text

;rbx	: current
;//		: prev
;//		: tmp

_ft_list_remove_if:
check:
cmp		qword rdi, 0
jz		exit
cmp		qword [rdi], 0
jz		exit
push	rbx
mov		rbx, [rdi]
first_loop:
