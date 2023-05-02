.global _start

.section .text
_start:

movslq num, %rbx
cmp $0x0, %rbx
jg NEGATIVE_HW1
mov $0x0, &rcx

LOOP_HW1:
	cmp %rbx, %rcx
	jg END_HW1
	movb ((source),%rcx, $0x1), (destination)	
	inc %rcx	
	jmp LOOP_HW1
	
NEGATIVE_HW1:
	movsq %rbx, (destination)

END_HW1:

#your code here
