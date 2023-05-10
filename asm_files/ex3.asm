.global _start

.section .text
_start:

xor %rax, %rax 
xor %rbx, %rbx 
xor %rcx, %rcx 
movq $array1, %rax 
movq $array2, %rbx 
movq $mergedArray, %rcx 
movl $0x0, %edx

CHECK_LOOP_HW1:
	movl (%rax), %r9d 
	movl (%rbx), %r10d 
	
	cmp %r9d, %r10d 
	jb COPY_LOOP1_HW1
	ja COPY_LOOP2_HW1
	je LOOP_EQUAL_HW1
	
COPY_LOOP1_HW1:
	cmp %edx, %r9d
	je DUP1_LOOP_HW1
	
	movl %r9d, (%rcx) 
	movl %r9d, %edx
	addq $4, %rcx 
	addq $4, %rax 
	jmp CHECK_LOOP_HW1

COPY_LOOP2_HW1:
	cmp %edx, %r10d
	je DUP2_LOOP_HW1

	movl %r10d, (%rcx) 
	movl %r10d, %edx
	addq $4, %rcx 
	addq $4, %rbx 
	jmp CHECK_LOOP_HW1
	
	
DUP1_LOOP_HW1:
	addq $4, %rax 
	jmp CHECK_LOOP_HW1
	
DUP2_LOOP_HW1:
	addq $4, %rbx 
	jmp CHECK_LOOP_HW1


LOOP_EQUAL_HW1:
	cmp $0x0, %r9d
	je END_HW1
	
	movl %r9d, (%ecx)
	movl %r9d, %edx
	addl $4, %ecx
	addl $4, %eax
	addl $4, %ebx
	jmp CHECK_LOOP_HW1
	
END_HW1:
	movl $0x0, (%ecx)

	