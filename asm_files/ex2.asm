.global _start

.section .text
_start:

movl $0x0, %edx
movl (num), %eax

movq $source, %r8
movq $destination, %rbx 
cmpl $0x0, %eax
jl NEGATIVE_HW1


LOOP1_HW1:

	;cmpl %eax, %edx
	;jge END_HW1
	
	movb (%r8), %cl
	movb %cl, (%rbx)
	incq %r8
	incq %rbx
	decl %eax
	jnz LOOP1_HW1
	
	; movq (%r8, %rdx, 1), %r9
	; movb (%r9), %cl
	; movb %cl, (%rbx, %rdx, 1)
	
	; incl %edx	
	;jmp LOOP1_HW1
	

NEGATIVE_HW1:
	movl %eax, (destination)

END_HW1:
