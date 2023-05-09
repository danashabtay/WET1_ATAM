.global _start

.section .text
_start:

movq root, %rax
movq new_node, %rdx

testq %rax, %rax
je END_HW1

COMPARE_LOOP_W1:
	cmpq (%rax), (%rdx)
	je END_HW1
	ja RIGHT_NODE_HW1
	jb LEFT_NODE_HW1

RIGHT_NODE_HW1:
	movq 16(%rax), %rbx
	movq (%rbx), %rcx
	cmp $0, $rcx
	je ADD_NODE_HW1
	
	movq 16(%rax), %rax
	jmp COMPARE_LOOP_W1

LEFT_NODE_HW1:
	movq 8(%rax), %rbx
	movq (%rbx), %rcx
	cmp $0, $rcx
	je ADD_NODE_HW1
	
	movq 8(%rax), %rax
	jmp COMPARE_LOOP_W1


ADD_NODE_HW1:
	movq %rdx, %rbx

END_HW1:


