.global _start

.section .text
_start:

mov num, %eax
movsx %eax, %rax
leaq destination, %rbx
mov %rax, %rbx
