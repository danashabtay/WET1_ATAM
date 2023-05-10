.global _start

.section .text
_start:
	#; Check if source is null:
    movq Source(%rip), %r8   		# r8 = source
	testq %r8, %r8    				# if (source == null)
	jz end_HW1                     		#   finish
	
	#; Check if head is null:
	movq head(%rip), %rdi	    	# rdi = head
	testq %rdi, %rdi    			# if (head == null)
	jz end_HW1                     		#   finish
	
	#; Get value:
	movl Value(%rip), %ebx    		# ebx = value
	#; Get head's value:
	movl (%rdi), %eax    			# eax = head.value
	
	#; Check if value is in head:
	movq $0, %r14					# r14 = 0
	cmpl %ebx, %eax    				# if (value == head.value)
	je value_is_first_HW1			# 	go to value_is_first_HW1
	
#; Find the node with value(in r9) and it's previous node(in rdi):
while1_HW1:		# rdi = prev, r9 = current
	inc %r14						# r14++
    movq 4(%rdi), %r9    			# current = prev.next 
    testq %r9, %r9    				# if (current == null)
	jz end_HW1                     		#	finish
	
	#; Check if value is in current node:
	movl (%r9), %eax    			# eax = current.value
	cmpl %ebx, %eax    				# if (value == current.value)
	je value_in_middle_HW1              #   go to value_in_middle_HW1
	
	#; Advance the loop:
    movq 4(%rdi), %rdi    			# prev = prev.next
	jmp while1_HW1 					# go to while1_HW1
	
#------------------------------- value is the first node:
value_is_first_HW1:		# r8 = source
	cmpq %r8, %rdi    				# if (source == head)
	je end_HW1							#   finish (because both of them are the first node)
	
	movq %rdi, %r11    				# r11 = head

#; Find the source node and it's previous node:
while2_HW1:		# rdi = prev, r10 = current
    movq 4(%rdi), %r10    			# current = prev.next 
    testq %r10, %r10    			# if (current == null)
	jz end_HW1 		                    #   finish
	
	cmpq %r10, %r8    				# if (source == current)
	je swap1_HW1			        #   go to swap1_HW1
	
	#; Advance the loop:
    movq 4(%rdi), %rdi    			# prev = prev.next
	jmp while2_HW1                  # go to while2_HW1

swap1_HW1:		# value = head = r11, prevSource = rdi, source = r8
	cmpq %rdi, %r11					# if (value == prevSource)
	je swap_adjacent1_HW1			#	go to swap_adjacent1_HW1

	movq 4(%r11), %r12				# r12 = value.next
	
	movq 4(%r8), %r13				# r13 = source.next
	movq %r13, 4(%r11)				# value.next = r13
	
	movq %r11, 4(%rdi)				# prevSource.next = value
	
	movq %r12, 4(%r8)				# source.next = r12
	
	movq %r8, (head)				# head = source
	jmp end_HW1

swap_adjacent1_HW1:
	movq 4(%r8), %r13				# r13 = source.next
	movq %r13, 4(%r11)				# value.next = r13
	
	movq %r11, 4(%r8)				# source.next = value
	
	movq %r8, (head)				# head = source
	jmp end_HW1
	
#------------------------------- value isn't the first node:
value_in_middle_HW1:	# r8 = source, r9 = value, rdi = prevValue
	cmpq %r8, head(%rip)    		# if (source != head)
	jne both_in_middle_HW1			#	go to both_in_middle_HW1
	
	#; Swap r8 and r9 and goto swap1_HW1:
	movq %r9, %r12
	movq %r8, %r9
	movq %r12, %r8
	#; Prepare for swap1_HW1:
	movq %r9, %r11
	jmp swap1_HW1

both_in_middle_HW1:		# r8 = source, r9 = value, rdi = prevValue, r14 = value index, r15 = source Index

#; Find the source node and it's previous node:
	movq head(%rip), %rcx			# rcx = head
	movq $0, %r15					# r15 = 0
	
while3_HW1:		# rcx = prev, rdx = current, r15 source index
	inc %r15						# r15++
    movq 4(%rcx), %rdx    			# current = prev.next 
    testq %rdx, %rdx    			# if (current == null)
	jz end_HW1 		                    #   finish
	
	cmpq %rdx, %r8    				# if (source == current)
	je swap2_HW1			        #   go to swap2_HW1
	
	#; Advance the loop:
    movq 4(%rcx), %rcx    			# prev = prev.next
	jmp while3_HW1                  # go to while3_HW1
	

swap2_HW1:
	cmpq %r14, %r15
	je end_HW1
	jg do_swap2_HW1
	
	#; Here source is before value, so swap source and value, and prevSource and prevValue:
	movq %r8, %r12
	movq %r9, %r8
	movq %r12, %r9
	
	movq %rdi, %r12
	movq %rcx, %rdi
	movq %r12, %rcx
	
do_swap2_HW1:			#	r9 = value, rdi = prevValue, r8 = source, rcx = prevSource
	cmpq %r9, %rcx					# if (value == prevSource)
	je swap_adjacent2_HW1			#	go to swap_adjacent2_HW1
	
	movq 4(%r9), %r13				# r13 = value.next
	
	movq 4(%r8), %r12				# r12 = source.next
	movq %r12, 4(%r9)				# value.next = r12
	
	movq %r13, 4(%r8)				# source.next = r13
	
	movq %r9, 4(%rcx)				# prevSource.next = value
	
	movq %r8, 4(%rdi) 				# prevValue.next = source
	
	jmp end_HW1

swap_adjacent2_HW1:
	movq %r8, 4(%rdi)				# prevValue.next = source
	
	movq 4(%r8), %r12				# r12 = source.next
	movq %r12, 4(%r9)				# value.next = r12
	
	movq %r9, 4(%r8)				# source.next = value
	
end_HW1:
