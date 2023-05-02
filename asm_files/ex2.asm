.global _start

.section .text
_start:

mov num, %eax
movsx %eax, %rax
mov %rax, (destination)