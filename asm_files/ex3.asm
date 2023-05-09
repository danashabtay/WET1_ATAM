.global _start

.section .text
_start:

movl $array1, %rax
movl $array2, %rbx
movl $mergedArray, %rcx

MAIN_LOOP_HW1:
	movl (%rcx), %r8
	movl (%rax), %r9
	movl (%rbx), %r10
	
	cmp %r9, %r10 
	jb LOOP1_HW1
	ja LOOP2_HW1
	je LOOP_EQUAL_HW1

LOOP1_HW1:
	cmp %r8, %r9 
	je MAIN_LOOP_HW1
	
	movl %r9, (%rcx)
	movl (%rcx), %r8
	addl $4, %rcx
	addl $4, %rax

LOOP2_HW1:
	cmp %r8, %r10 
	je MAIN_LOOP_HW1
	movl %r10, (%rcx)
	movl (%rcx), %r8
	addl $4, %rcx
	addl $4, %rbx

LOOP_EQUAL_HW1:
	cmp $0x0, %r9
	je END_HW1
	
	cmp %r8, %r9
	je MAIN_LOOP_HW1
	
	movl %r9, (%rcx)
	movl (%rcx), %r8
	addl $4, %rcx
	addl $4, %rax
	addl $4, %rbx
	
END_HW1:
	movl $0x0, (%rcx)