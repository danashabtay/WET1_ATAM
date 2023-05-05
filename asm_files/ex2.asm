.global _start

.section .text
_start:

movl $0x0, %edx
movl (num), %eax

movq $source, %r8
movq $destination, %rbx 
cmpl $0x0, %eax
jle NEGATIVE_HW1

cmpq %r8, %rbx 
jg LOOP2_HW1

subl %0x1, %eax
LOOP1_HW1:
	
	movb (%r8), %cl
	movb %cl, (%rbx)
	incq %r8
	incq %rbx
	decl %eax
	jnz LOOP1_HW1
	jmp END_HW1
	
LOOP2_HW1:
	addq %rax, %r8
	addq %rax, %rbx
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
