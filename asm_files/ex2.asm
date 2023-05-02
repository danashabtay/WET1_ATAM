.global _start

.section .text
_start:

mov $0x0, %eax
movl num, %eax
movslq %eax, %rax
mov $destination, %rbx
mov %rax, (%rbx)
