.global _start

.section .text
_start:

movl $Value, %ebx
movq head, %rdi
movq Source, %rcx
movl (%ecx), %r8d

FIND_VAL_HW1:
	testl %rdi, %rdi
	je END_HW1

	cmpl (%rdi), %ebx
	je FIND_SOURCE_HW1
	
	movl %rdi, %rdx ;SAVE ADDRESS OF NODE BEFORE VAL TO %RDX
	addl $8, %rdi
	jmp FIND_VAL_HW1 
	
FIND_SOURCE_HW1:
	movq %rdi, %rsi ;SAVE ADDRESS OF VAL TO %ESI
	movq head, %rdi
	
	SOURCE_LOOP_HW1:
		cmpl (%rdi), %r8d
		je SWITCH_HW1 ;ADDRESS OF SOURCE IS SAVED IN %EDI
		
		movl %rdi, %r9 ;SAVE ADDRESS OF NODE BEFORE SOURCE TO %R9D
		addl $8, %rdi
		jmp SOURCE_LOOP_HW1 


SWITCH_HW1: 
	movq 4(%rdx), %r10
	movq %rcx, (%r10)
	
	movq 4(%rdi), %r8
	movq 4(%rsi), %r13
	movq 4(%rsi), %r11
	movq %r8, (%r11)
	
	movq 4(%rcx), %rbx
	movq %rsi, (%rbx)
	
	movq 4(%rdi), %r12
	movq %r13, (%r12)

END_HW1:

