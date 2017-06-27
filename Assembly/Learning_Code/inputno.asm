section .data
  msg1 db 'Please enter a number: '
  len1 equ $ - msg1
  msg2 db 'You have entered: '
  len2 equ $ - msg2

section .bss
  num resb 5

section .text
  global _start
_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg1
  mov edx, len1
  int 0x80

  mov eax, 3
  mov ebx, 0 
  mov ecx, num
  mov edx, 5
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, msg2
  mov edx, len2
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, num
  mov edx, 5
  int 0x80
  
  mov eax, 1
  mov ebx, 0
  int 0x80
