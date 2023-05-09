.global _start

.section .text
_start:

movq root, %rax
movq new_node, %rdx

testq %rax, %rax
je EMPTY_TREE_HW1

SEARCH_LOOP_W1:
	movq (%rax), %rcx
	cmpq new_node, %rcx
	je END_HW1
	js RIGHT_NODE_HW1	
	
LEFT_NODE_HW1:
	movq 8(%rax), %rbx
	movq $8, %rsi
	cmp $0, %rbx
	je ADD_NODE_HW1
	
	movq 8(%rax), %rax
	jmp SEARCH_LOOP_W1
	
RIGHT_NODE_HW1:
	movq 16(%rax), %rbx
	movq $16, %rsi
	cmp $0, %rbx
	je ADD_NODE_HW1
	
	movq 16(%rax), %rax
	jmp SEARCH_LOOP_W1

EMPTY_TREE_HW1:
    movq $new_node, root
	jmp END_HW1

ADD_NODE_HW1:
	movq $new_node, %r9
	movq %r9, (%rax,%rsi)

END_HW1:


