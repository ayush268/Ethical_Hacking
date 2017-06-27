.data
    
    HelloWorld:
        .ascii "Hello World!"

    ByteLocation:
        .byte 10

    int32:
        .int 32

    int16:
        .short 16

    float:
        .float 1.6

    intarray:
        .int 10,20,30,40,50


.bss
    .comm Largebuffer 10000


.text
    
    .globl _start

    _start:
        nop
        
        movl $10, %eax

        movw $50, int16

        movl %eax, %ebx

        movl int32, %eax

        movb $3, %al

        movb %al, ByteLocation

        movl $0, %ecx
        movl $2, %edi
        movl $22, intarray(%ecx,%edi, 4)
        
        movl $1, %eax
        movl $0, %ebx
        int $0x80
