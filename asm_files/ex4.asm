.global _start

.section .text
_start:

movl $Value, %ebx
movl head, %edi
movl source, %ecx
movl (%ecx), %r8d

FIND_VAL_HW1:
	testl %edi, %edi
	je END_HW1

	movl (%edi), %eax
	cmp %eax, %ebx
	je FIND_SOURCE_HW1
	
	movl %edi, %edx ;SAVE ADDRESS OF NODE BEFORE VAL TO %EDX
	addl $8, %edi
	jmp FIND_VAL_HW1 
	
FIND_SOURCE_HW1:
	movl %edi, %esi ;SAVE ADDRESS OF VAL TO %ESI
	movl head, %edi
	
	SOURCE_LOOP_HW1:
		movl (%edi), %ecx
		cmp %ecx, %r8d
		je SWITCH_HW1 ;ADDRESS OF SOURCE IS SAVED IN %EDI
		
		movl %edi, %r9d ;SAVE ADDRESS OF NODE BEFORE SOURCE TO %R9D
		addl $8, %edi
		jmp SOURCE_LOOP_HW1 


SWITCH_HW1: 
	movl 4(%edx), %r10d
	movl %ecx, (%r10d)
	
	movl 4(%edi), %r8d
	movl 4(%esi), %r13d
	movl 4(%esi), %r11d
	movl %r8d, (%r11d)
	
	movl 4(%ecx), %ebx
	movl %esi, (%ebx)
	
	movl 4(%edi), %r12d
	movl %r13d, (%r12d)

END_HW1:

