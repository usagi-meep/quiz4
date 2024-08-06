section .data
	x dd 23			; assigns 23 to x
	z dd 13			; assigns 13 to z
	y dd 90			; assigns 90 to y
	result dd 0		; placeholder for result

section .text
	global _start

_start:
	;Set up function
	mov eax, [x]		; moves x to eax
	push eax		; push value of eax to stack
	mov eax, [y]		; moves y to eax
	push eax		; push y to stack
	mov eax, [z]		; moves z to eax
	push eax		; push z to stack

	call quiz_function	; call function

	; Exit
	mov eax, 1
	xor ebx, ebx
	int 0x80

quiz_function:
	; Add
	; Return result
	; Deallocate

	pop edx			; moves top of stack to edx, edx = z
	pop ecx			; moves top of stack to ecx, ecx = y
	pop ebx			; moves top of stack to ebx, ebx = x

	; Add
	mov eax, 0 		; initialize eax to 0
	add eax, ebx		; eax = 0 + 23 or 0 + x
	add eax, ecx		; eax = 23 + 90 or x + y
	add eax, edx		; eax = 23 + 90 + 13 or x + y + z

	; Return result
	mov [result], eax	; store result in result

	; Deallocate
	ret 12			; returns to caller and ensures the stack is cleaned
