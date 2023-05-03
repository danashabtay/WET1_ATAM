.global _start

.section .text
_start:

mov $0x0, %edx
movl num, %eax

mov $source, %rcx

cmp $0x0, %eax
jl NEGATIVE_HW1


LOOP1_HW1:
	
	cmp $0x0, %eax
	je END_HW1 

	cmp %eax, %edx
	jg LOOP2_HW1
	
	movq (%rcx, %edx, 1), %rbx
	movb (%rbx), %bl
	movb %bl, (%r9, %edx, 1)
	
	incl %edx	
	jmp LOOP1_HW1


mov $0x0, %edx
mov $destination, %rbx 

LOOP2_HW1: 

	cmp %eax, %edx
	jg END_HW1
	
	movq (%r9, %edx, 1), %rcx
	movb (%rcx), %cl	
	movb %cl, (%rbx, %edx, 1)	
	
	incl %edx	
	jmp LOOP2_HW1

NEGATIVE_HW1:
	movl %eax, destination

END_HW1:
