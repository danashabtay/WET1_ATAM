.global _start

.section .text
_start:

movq root, %rax
movq new_node, %rdx

testq %rax, %rax
je EMPTY_TREE_HW1

COMPARE_LOOP_W1:
	cmpq $new_node, (%rax)
	je END_HW1
	
	ja RIGHT_NODE_HW1
	jb LEFT_NODE_HW1

RIGHT_NODE_HW1:
	movq 16(%rax), %rbx
	movq $16, %rsi
	testq %rbx, %rbx
	je ADD_NODE_HW1
	
	movq 16(%rax), %rax
	jmp COMPARE_LOOP_W1

LEFT_NODE_HW1:
	movq 8(%rax), %rbx
	movq $8, %rsi
	testq %rbx, %rbx
	je ADD_NODE_HW1
	
	movq 8(%rax), %rax
	jmp COMPARE_LOOP_W1

EMPTY_TREE_HW1:
    movq $new_node, root
	jmp END_HW1

ADD_NODE_HW1:
	movq $new_node, %r9
	movq %r9, (%rax,%rsi)

END_HW1:


