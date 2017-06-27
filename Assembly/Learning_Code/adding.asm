section .data
  msg1 db 'This program will add 2 numbers.', 0xa
  len1 equ $ - msg1
  msg2 db 'Enter a 2-digit number: '
  len2 equ $ - msg2
  msg3 db 'Enter another 2-digit number: '
  len3 equ $ - msg3
  msg4 db 'The answer is: '
  len4 equ $ - msg4

section .bss
  x resb 2
  y resb 2
  z resb 1

section .text
  global _start
_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg1
  mov edx, len1
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, msg2
  mov edx, len2
  int 0x80

  mov eax, 3
  mov ebx, 0
  mov ecx, x
  mov edx, 2
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, msg3
  mov edx, len3
  int 0x80

  mov eax, 3
  mov ebx, 0
  mov ecx, y
  mov edx, 2
  int 0x80

  mov eax, [x]
  sub eax, '0'

  mov ebx, [y]
  sub ebx, '0'

  add eax, ebx
  add eax, '0'

  mov [z], eax

  mov eax, 4
  mov ebx, 1
  mov ecx, msg4
  mov edx, len4
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, z
  mov edx, 1
  int 0x80

  mov eax, 1
  mov ebx, 0
  int 0x80
