.global _start

.section .text
_start:

movl num, %eax
movslq %eax, %rax
mov %rax, $destination
