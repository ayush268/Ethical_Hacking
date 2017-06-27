section .data
  msg1 db "It is 1!", 0xa
  msg2 db "It is 2!", 0xa
  msg3 db "It is 3!", 0xa

section .text
  global _start

_start:
  mov rax, 1
  mov rbx, 2
  mov rcx, 3
  push rax
  push rbx
  push rcx

  mov rax, [rsp+16]
  cmp rax, 1
  je .itis1
  cmp rax, 2
  je .itis2
  cmp rax, 3
  je .itis3
  jmp .exit

.itis1:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg1
  mov rdx, 9
  syscall
  jmp .exit

.itis2:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg2
  mov rdx, 9
  syscall
  jmp .exit

.itis3:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg3
  mov rdx, 9
  syscall
  jmp .exit

.exit:
  mov rax, 60
  mov rdi, 0
  syscall
