.global _start

.section .text
_start:

mov $0x0, %rcx
mov $0x0, %rbx
mov num, %ebx
movsxd %ebx, %rbx
cmp $0x0, %rbx
jl NEGATIVE_HW1

mov source, %rax
mov destination, %rdx

LOOP_HW1:
	
	cmp $0x0, %rbx
	je END_HW1 

	cmp %rbx, %rcx
	jg END_HW1
	
	movb (%rax, %rcx, 1), %al
	movb %al, (%rdx, %rcx, 1)	
	
	inc %rcx	
	jmp LOOP_HW1
	
NEGATIVE_HW1:
	mov %rbx, %rdx

END_HW1:
