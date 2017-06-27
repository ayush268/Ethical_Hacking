section.data:
  msg db 'Displaying 9 stars', 0xa
  len equ $ - msg
  star times 9 db '*', 0xa
  len2 equ $ - star

section.text:
  global _start
_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, star
  mov edx, len2
  int 0x80

  mov eax, 1
  mov ebx, 0
  int 0x80
