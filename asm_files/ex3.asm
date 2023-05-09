.global _start

.section .text
_start:

movl $array1, %eax
movl $array2, %ebx
movl $mergedArray, %ecx

MAIN_LOOP_HW1:
	movl (%ecx), %r8d
	movl (%eax), %r9d
	movl (%ebx), %r10d
	
	cmp %r9d, %r10d 
	jb LOOP1_HW1
	ja LOOP2_HW1
	je LOOP_EQUAL_HW1

LOOP1_HW1:
	cmp %r8d, %r9d 
	je MAIN_LOOP_HW1
	
	movl %r9d, (%ecx)
	movl (%ecx), %r8d
	addl $4, %ecx
	addl $4, %eax

LOOP2_HW1:
	cmp %r8d, %r10d 
	je MAIN_LOOP_HW1
	movl %r10d, (%ecx)
	movl (%ecx), %r8d
	addl $4, %ecx
	addl $4, %ebx

LOOP_EQUAL_HW1:
	cmp $0x0, %r9d
	je END_HW1
	
	cmp %r8d, %r9d
	je MAIN_LOOP_HW1
	
	movl %r9d, (%ecx)
	movl (%ecx), %r8d
	addl $4, %ecx
	addl $4, %eax
	addl $4, %ebx
	
END_HW1:
	movl $0x0, (%ecx)
	