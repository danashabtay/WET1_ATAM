.global _start

.section .text
_start:

mov $0x0, %rdx
movl num, %eax

mov $source, %rcx

cmp $0x0, %eax
jl NEGATIVE_HW1


LOOP1_HW1:
	
	cmp $0x0, %eax
	je END_HW1 

	cmp %eax, %rdx
	jg LOOP2_HW1
	
	movq (%rcx, %rdx, 1), %rbx
	movb (%rbx), %rbx
	movb %rbx, (%r9, %rdx, 1)
	
	inc %rdx	
	jmp LOOP1_HW1


mov $0x0, %rdx
mov $destination, %rbx 

LOOP2_HW1: 

	cmp %eax, %rdx
	jg END_HW1
	
	movq (%r9, %rdx, 1), %rcx
	movb (%rcx), %rcx	
	movb %rcx, (%rbx, %rdx, 1)	
	
	inc %rdx	
	jmp LOOP2_HW1

NEGATIVE_HW1:
	movl %eax, destination

END_HW1:
