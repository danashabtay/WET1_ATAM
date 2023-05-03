.global _start

.section .text
_start:

mov $0x0, %rdx
movl num, %eax
movslq %eax, %rax

mov $source, %rcx

cmp $0x0, %rax
jl NEGATIVE_HW1


LOOP1_HW1:
	
	cmp $0x0, %rax
	je END_HW1 

	cmp %rax, %rdx
	jg LOOP2_HW1
	
	movq (%rcx, %rdx, 1), %rbx
	movb (%rbx), %bl
	movb %bl, (%rbp, %rdx, 1)
	
	inc %rdx	
	jmp LOOP1_HW1


mov $0x0, %rdx
mov $destination, %rbx 

LOOP2_HW1: 

	cmp %rax, %rdx
	jg END_HW1
	
	movq (%rbp, %rdx, 1), %rcx
	movb (%rcx), %cl	
	movb %cl, (%rbx, %rdx, 1)	
	
	inc %rdx	
	jmp LOOP2_HW1

NEGATIVE_HW1:
	mov $destination, %rbx 
	mov %rax, (%rbx)

END_HW1:
