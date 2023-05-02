.global _start

.section .text
_start:

mov $0x0, %rcx
mov $0x0, %rbx
movslq num, %rbx
cmp $0x0, %ebx
jl NEGATIVE_HW1

leaq (source), %rax
leaq (destination), %rdx

LOOP_HW1:
	
	cmp $0x0, %rbx
	je END_HW1 

	cmp %rbx, %rcx
	jg END_HW1
	
	movb ((%rax), %rcx, $0x1), %al
	movb %al, ((%rdx), %rcx, $0x1)	
	inc %rcx	
	jmp LOOP_HW1
	
NEGATIVE_HW1:
	movsx %rbx, (destination)

END_HW1:
