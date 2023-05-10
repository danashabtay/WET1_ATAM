.global _start

.section .text
_start:

movq head, %rdi
cmpq $0, %rdi
je END_HW1

movq Source, %rcx
cmpq $0, %rcx
je END_HW1
movl $Value, %ebx
movl (%rcx), %edx
cmpl %edx, %ebx
je END_HW1

movq $0, %r8 #previous node to value
movq $0, %r9 #previous node to source

SEARCH_VALUE_HW1:
	movq %rdi, %r10 #val
	cmpl (%rdi), %ebx #check if node==val
	je SEARCH_SOURCE_HW1
	
	cmpq $0, 4(%rdi) #check if next node is null
    je END_HW1
	
	movq %rdi, %r8 #save previous to val in %r8
	movq 4(%rdi), %rdi
	jmp SEARCH_VALUE_HW1

SEARCH_SOURCE_HW1:
	movq head, %rdi
	movl (%rcx), %edx 
	SOURCE_LOOP_HW1:
		cmpl %edx, (%rdi) #check if node==src
		je SWITCH_HW1
		
		movq %rdi, %r9 #save previous to source in %r9
		movq 4(%rdi), %rdi
		jmp SOURCE_LOOP_HW1		

SWITCH_HW1: 
#r10=val rdi=src r8=preval r9=presrc

	movq 4(%rdi), %rax #save src_next in %rax
	movq 4(%r10), %rbx #save val_next in %rbx
	cmpq %rbx, %rdi
	je ADJ_VAL_SRC_HW1
	cmpq %rax, %r10
	je ADJ_SRC_VAL_HW1
	movq %rax, 4(%r10)
	movq %rbx, 4(%rdi)
	jmp SET_PRE_HW1
	
ADJ_VAL_SRC_HW1:
	movq %rax, 4(%r10)
	movq %r10, 4(%rdi)
	cmpq $0, %r8
    je NO_PREVAL_HW1
	movq %rdi, 4(%r8)
	jmp END_HW1

	
ADJ_SRC_VAL_HW1:	
	movq %rbx, 4(%rdi)
	movq %rdi, 4(%r10)
	jmp SET_PRE_HW1
	cmpq $0, %r9
    je NO_PRESRC_HW1
	movq %r10, 4(%r9)
	jmp END_HW1
	
SET_PRE_HW1:
	cmpq $0, %r8
    je NO_PREVAL_HW1
	movq %rdi, 4(%r8)
	cmpq $0, %r9
    je NO_PRESRC_HW1
	movq %r10, 4(%r9)
	jmp END_HW1	
	
NO_PREVAL_HW1:
	movq %r10, 4(%r9)
	cmpq %r10, head
	jne END_HW1
	movq %rdi, head
	jmp END_HW1
	
NO_PRESRC_HW1: 	
	cmpq %rdi, head
	jne END_HW1
	movq %r10, head
	jmp END_HW1
	
END_HW1:
