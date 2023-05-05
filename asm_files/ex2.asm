.global _start

.section .text
_start:

movl $0x0, %edx
movl (num), %eax

movq $source, %r8
movq $destination, %rbx 
cmpl $0x0, %eax
jl NEGATIVE_HW1

cmpq %r8, %rbx 
jg LOOP2_HW1

LOOP1_HW1:
	
	movb (%r8), %cl
	movb %cl, (%rbx)
	incq %r8
	incq %rbx
	decl %eax
	jnz LOOP1_HW1
	jmp END_HW1
	
LOOP2_HW1:
	addq num, %r8
	addq num, %rbx
	movb (%r8), %cl
	movb %cl, (%rbx)
	decq %r8
	decq %rbx
	decl %eax
	jnz LOOP2_HW1
	jmp END_HW1

NEGATIVE_HW1:
	movl %eax, (destination)

END_HW1:
