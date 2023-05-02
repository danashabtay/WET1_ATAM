.global _start

.section .text
_start:

movslq num, %ebx
cmp $0x0, %ebx
jl NEGATIVE_HW1
mov $0x0, %rcx

LOOP_HW1:
	
	cmp $0x0, %ebx
	je END_HW1 

	cmp %ebx, %rcx
	jg END_HW1
	
	movb (source, %rcx, $0x1), (destination)	
	inc %rcx	
	jmp LOOP_HW1
	
NEGATIVE_HW1:
	movslq %ebx, (destination)

END_HW1:
