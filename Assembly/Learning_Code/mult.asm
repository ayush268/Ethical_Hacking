section .data
  msg db 'The product of 10 and 30 is: '
  len equ $ - msg

section .bss
  num resb 2

section .text
  global _start
_start:
  mov ax, 10
  mov bx, 30

  imul bx

  mov [num], ax
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, num
  mov edx, 2
  int 0x80

  mov eax, 1
  mov ebx, 0
  int 0x80
