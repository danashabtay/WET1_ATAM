.global _start

.section .text
_start:

mov $0x0, %rbx
movslq num, %rbx
cmp $0x0, %ebx
jl NEGATIVE_HW1
mov $0x0, %rcx

LOOP_HW1:
	
	cmp $0x0, %rbx
	je END_HW1 

	cmp %rbx, %rcx
	jg END_HW1
	
	movb %rcx(source), %al
	movb %al, %rcx(destination)	
	inc %rcx	
	jmp LOOP_HW1
	
NEGATIVE_HW1:
	movsx %rbx, (destination)

END_HW1:
