.global _start

.section .text
_start:

movl $array1, %eax
movl $array2, %ebx
movl $mergedArray, %ecx
movl $0x0, (%ecx)

CHECK_LOOP_HW1:
	movl (%eax), %r9d
	movl (%ebx), %r10d

	movl $0, %edx   # Initialize loop counter

CHECK_MERGED_ARRAY:
	cmpl $0, (%ecx, %edx, 4)
	je ADD_TO_MERGED_ARRAY_HW1

	cmpl %r9d, (%ecx, %edx, 4)
	jne COMPARE_ARRAY2_HW1

	# The element already exists in mergedArray
	jmp NEXT_HW1

COMPARE_ARRAY2_HW1:
	cmpl %r10d, (%ecx, %edx, 4)
	jne NEXT_HW1

	# The element already exists in mergedArray
	jmp NEXT_HW1

ADD_TO_MERGED_ARRAY_HW1:
	movl %r9d, (%ecx)
	addl $4, %ecx
	jmp NEXT_HW1

NEXT_HW1:
	addl $4, %eax
	addl $4, %ebx
	addl $4, %edx

	# Check if we've reached the end of either array
	cmpl $0, (%eax)
	jne CHECK_LOOP_HW1

	cmpl $0, (%ebx)
	jne CHECK_LOOP_HW1

	movl $0x0, (%ecx)  # Add 0 to end of mergedArray
