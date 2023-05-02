.global _start

.section .text
_start:

mov $0x40, %rdx
mov $0x1, %rcx
mov $0x0, %rax
mov num, %rbx

LOOP_HW1:
	cmp %rdx, %rcx
	jg END_HW1
	ROR %rbx
	adc $0x0, %rax
	inc %rcx
	jmp LOOP_HW1
END_HW1:
	movb %al, Bool

