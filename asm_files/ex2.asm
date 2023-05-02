.global _start

.section .text
_start:

mov $0x0, %rdx
movl num, %eax
movslq %eax, %rax
mov $destination, %rbx
mov $source, %rcx

cmp $0x0, %rax
jl NEGATIVE_HW1


LOOP1_HW1:
	
	cmp $0x0, %rax
	je END_HW1 

	cmp %rax, %rdx
	jg END_HW1
	
	movb ((%rcx), %rdx, 1), %al
	movb %al, ((%rbp), %rdx, 1)	
	
	inc %rdx	
	jmp LOOP1_HW1


mov $0x0, %rdx

LOOP2_HW1: 

	cmp %rax, %rdx
	jg END_HW1
	
	movb ((%rbp), %rdx, 1), %al
	movb %al, ((%rbx), %rdx, 1)	
	
	inc %rdx	
	jmp LOOP2_HW1

NEGATIVE_HW1:
	mov %rax, (%rbx)

END_HW1: