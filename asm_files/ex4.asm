.global _start

.section .text
_start:

movq head, %rdi
cmpq $0, %rdi
je END_HW1

movq Source, %rcx
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
	
	movq %rdi, %r8 #save previos to val in %r8
	movq 4(%rdi), %rdi
	jmp SEARCH_VALUE_HW1

SEARCH_SOURCE_HW1:
	movq head, %rdi
	movl (%rcx), %edx 
	SOURCE_LOOP_HW1:
		cmpl %edx, (%rdi) #check if node==src
		je SWITCH_HW1
		
		movq %rdi, %r9 #save previos to source in %r9
		movq 4(%rdi), %rdi
		jmp SOURCE_LOOP_HW1		

SWITCH_HW1: 
#r10=val rdi=src r8=preval r9=presrc

	movq 4(%rdi), %rax #save src_next in %rax
	movq 4(%r10), %rbx #save val_next in %rbx
	
	movq %rax, 4(%r10)
	movq %rbx, 4(%rdi)
	
	cmpq $0, %r8
    je NO_PREVAL_HW1
	cmpq $0, %r9
    je NO_PRESRC_HW1
	
	movq %rdi, 4(%r8)
	movq %r10, 4(%r9)
	jmp END_HW1
	
NO_PREVAL_HW1: #val was head -> src is now head
	movq %r10, 4(%r9)
	movq %rdi, head
	jmp END_HW1
	
NO_PRESRC_HW1: #src was head -> val is now head
	movq %rdi, 4(%r8)	
	movq %r10, head

END_HW1:
