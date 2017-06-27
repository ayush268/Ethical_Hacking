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

        movl $1, %eax
        movl $0, %ebx
        int $0x80
