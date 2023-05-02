.global _start

.section .text
_start:

movl num, %eax
movslq %eax, %rax
leaq destination, %rbx
mov %rax, (%rbx)
