section .data
	x dd 23			; assigns 23 to x
	z dd 13			; assigns 13 to z
	y dd 90			; assigns 90 to y
	result dd 0		; placeholder for result

section .text
	global _start

_start:
	;Set up function
	push dword [z]		; push z to stack
	push dword [y]		; push y to stack
	push dword [x]		; push x to stack

	call quiz_function	; call function

	; Exit
	mov eax, 1
	xor ebx, ebx
	int 0x80

quiz_function:
	; Add
	; Return result
	; Deallocate
	push ebp		; save the base pointer
   	mov ebp, esp		; set base pointer to current stack pointer

	mov eax, [ebp+8]	; load x into eax
	mov ebx, [ebp+12]	; load y into ebx
	mov ecx, [ebp+16]	; load z into ecx

	; Add
	add eax, ebx		; eax = eax + ebx
	add eax, ecx		; eax = eax + ecx

	mov esp, ebp		; restore stack pointer
	pop ebp			; restore base pointer

	; Return result
	mov [result], eax	; store result in result

	; Deallocate
	ret 12			; returns to caller and ensures the stack is cleaned
