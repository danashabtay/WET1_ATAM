.global _start

.section .text
_start:

movq head, %r9
movq Source, %r8

cmpq $0, %r8
jmp END_HW1

cmpq $0, %r9
jmp END_HW1

cmpq %r8, %r9
je SOURCE_HEAD_HW1

movl $Value, %r10d
cmpl (%r9), %r10d
je VALUE_HEAD_HW1

jmp BOTH_MIDDLE_HW1

SOURCE_HEAD_HW1: #r9=r8=head=src  
	movl $Value, %r10d
	cmpl (%r9), %r10d
	je END_HW1
	
	VALUE_LOOP:
		cmpl (%r9), %r10d
		je SWAP_SRC_FIRST_HW1
		movq %r9, %r11 # %r11 = pre_val
		movq 4(%r9), %r9
		jmp VALUE_LOOP 

SWAP_SRC_FIRST_HW1: # %r11 = pre_val %r8=src %r9=val_node
	cmpq %r11, %r8
	je ADJ_1
	movq 4(%r9), %rbx # %rbx=val_next
	movq 4(%r8), %rax # %rax=src_next
	
	movq %rax, 4(%r9)
	movq %rbx, 4(%r8)
	movq %r8, 4(%r11)
	movq %r9, head
	jmp END_HW1
	
ADJ_1:
	movq 4(%r9), %rbx # %rbx=val_next
	movq %rbx, 4(%r8)
	movq %r8, 4(%r9)
	movq %r9, head
	jmp END_HW1

VALUE_HEAD_HW1: #r9=head=val_node %r8=src
	movq %r9, %rdi
	cmpq %rdi, %r8
	je END_HW1
	
	SRC_LOOP:
		cmpq %rdi, %r8
		je SWAP_VAL_FIRST_HW1
		movq %rdi, %r12 # %r12 = pre_src
		movq 4(%rdi), %rdi
		jmp SRC_LOOP 
	
SWAP_VAL_FIRST_HW1: #r9=head=val_node %r8=src %r12=pre_src
	cmpq %r12, %r9
	je ADJ_2_HW1
	movq 4(%r9), %rbx # %rbx=val_next
	movq 4(%r8), %rax # %rax=src_next
	
	movq %rax, 4(%r9)
	movq %rbx, 4(%r8)
	movq %r9, 4(%r12)
	movq %r8, head
	jmp END_HW1
	
ADJ_2_HW1:
	movq 4(%r8), %rax # %rax=src_next
	movq %rax, 4(%r9)
	movq %r9, 4(%r8)
	movq %r8, head
	jmp END_HW1

BOTH_MIDDLE_HW1:
	movq %r9, %rdi
	FIND_VAL_HW1:
		cmpl (%r9), %r10d	
		je FIND_SRC_HW1
		cmpq $0, %r9 #val not found
		jmp END_HW1
		movq %r9, %r11 # %r11=preval
		movq 4(%r9), %r9
		jmp FIND_VAL_HW1
		
FIND_SRC_HW1: # %r8=src %rdi=head %r11=preval %r9=val_node
	cmpq %r8, %rdi
	je SWAP2_HW1
	movq %rdi, %r12 # %r12=presrc
	movq 4(%rdi), %rdi
	jmp FIND_SRC_HW1
	
SWAP2_HW1:	# %r8=src %r12=presrc %r11=preval %r9=val_node
 cmpq %r12, %r9
 je ADJ_VAL_SRC_HW1
 cmpq %r11, %r8
 je ADJ_SRC_VAL_HW1
 
 movq 4(%r8), %rax # %rax=src_next
 movq 4(%r9), %rbx # %rbx=val_next
 movq %r8, 4(%r11)
 movq %rax, 4(%r9)
 movq %r9, 4(%r12)
 movq %rbx, 4(%r8)
 jmp END_HW1
 
 ADJ_VAL_SRC_HW1:
	movq 4(%r8), %rax # %rax=src_next
	movq %r8, 4(%r11)
	movq %r9, 4(%r8)
	movq %rax, 4(%r9)
	jmp END_HW1
	
ADJ_SRC_VAL_HW1:
	movq 4(%r9), %rbx # %rbx=val_next
	movq %r9, 4(%r12)
	movq %r8, 4(%r9)
	movq %rax, 4(%r8)
	jmp END_HW1


END_HW1:
