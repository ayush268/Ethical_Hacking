# Solutions for Assembly CTF

If you think at any point I ran the executable on my machine then you are seriously mistaken.

Everything here is done in docker (isolated environment).
(Obviously used docker.)

### s3cr3T1

Since flag is a string first trying the basic thing from the executable.
(Don't think the problem to be hard, it might the simplest one you solve.)

```sh
$ strings s3cr3T1 | grep flag
The flag is mY_f1R5t_h4cK
```

P.S. Don't try to use gdb here, (good work with infinite loop btw).

**Answer - mY_f1R5t_h4cK**

### find_M3

When using strings on this file, this file explicitely tells you to use GDB but before that I examined it like this.

```sh
$ objdump -D find_M3

...

0000000000400596 <main>:
  400596:	55                   	push   %rbp
  400597:	48 89 e5             	mov    %rsp,%rbp
  40059a:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
  4005a1:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4005a8:	00 00
  4005aa:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4005ae:	31 c0                	xor    %eax,%eax
  4005b0:	c7 85 60 ff ff ff 45 	movl   $0x45,-0xa0(%rbp)
  4005b7:	00 00 00
  4005ba:	c7 85 64 ff ff ff 61 	movl   $0x61,-0x9c(%rbp)
  4005c1:	00 00 00
  4005c4:	c7 85 68 ff ff ff 35 	movl   $0x35,-0x98(%rbp)
  4005cb:	00 00 00
  4005ce:	c7 85 6c ff ff ff 59 	movl   $0x59,-0x94(%rbp)
  4005d5:	00 00 00
  4005d8:	c7 85 70 ff ff ff 5f 	movl   $0x5f,-0x90(%rbp)
  4005df:	00 00 00
  4005e2:	c7 85 74 ff ff ff 66 	movl   $0x66,-0x8c(%rbp)
  4005e9:	00 00 00
  4005ec:	c7 85 78 ff ff ff 6c 	movl   $0x6c,-0x88(%rbp)
  4005f3:	00 00 00
  4005f6:	c7 85 7c ff ff ff 34 	movl   $0x34,-0x84(%rbp)
  4005fd:	00 00 00
  400600:	c7 45 80 67 00 00 00 	movl   $0x67,-0x80(%rbp)
  400607:	48 b8 43 61 6e 27 74 	movabs $0x6f792074276e6143,%rax
  40060e:	20 79 6f
  400611:	48 89 45 90          	mov    %rax,-0x70(%rbp)
  400615:	48 b8 75 20 66 69 6e 	movabs $0x7420646e69662075,%rax
  40061c:	64 20 74
  40061f:	48 89 45 98          	mov    %rax,-0x68(%rbp)
  400623:	48 b8 68 65 20 66 6c 	movabs $0x3f67616c66206568,%rax
  40062a:	61 67 3f
  40062d:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
  400631:	48 b8 3f 0a 55 73 65 	movabs $0x4447206573550a3f,%rax
  400638:	20 47 44
  40063b:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  40063f:	48 b8 42 20 6b 69 64 	movabs $0x293b2064696b2042,%rax
  400646:	20 3b 29
  400649:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
  40064d:	48 c7 45 b8 0a 00 00 	movq   $0xa,-0x48(%rbp)
  400654:	00
  400655:	48 8d 55 c0          	lea    -0x40(%rbp),%rdx
  400659:	b8 00 00 00 00       	mov    $0x0,%eax
  40065e:	b9 06 00 00 00       	mov    $0x6,%ecx
  400663:	48 89 d7             	mov    %rdx,%rdi
  400666:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  400669:	48 89 fa             	mov    %rdi,%rdx
  40066c:	89 02                	mov    %eax,(%rdx)
  40066e:	48 83 c2 04          	add    $0x4,%rdx
  400672:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  400676:	48 89 c6             	mov    %rax,%rsi
  400679:	bf 34 07 40 00       	mov    $0x400734,%edi
  40067e:	b8 00 00 00 00       	mov    $0x0,%eax
  400683:	e8 e8 fd ff ff       	callq  400470 <printf@plt>

...
```

I noticed that in main funtion it was moving too many things to stack so went on to examine that in GDB first.
And set the breakpoint at the position of main starting and main+237 (calling different function)

```sh
gdb-peda$ break *main
gdb-peda$ break *(main+237)
gdb-peda$ run
gdb-peda$ x/100s $rsp
```

I printed here to see if there was anything in the stack before that but nothing significant.

```sh
gdb-peda$ c
gdb-peda$ x/100s $rsp

0x7fffffffdd60:	"E"
0x7fffffffdd62:	""
0x7fffffffdd63:	""
0x7fffffffdd64:	"a"
0x7fffffffdd66:	""
0x7fffffffdd67:	""
0x7fffffffdd68:	"5"
0x7fffffffdd6a:	""
0x7fffffffdd6b:	""
0x7fffffffdd6c:	"Y"
0x7fffffffdd6e:	""
0x7fffffffdd6f:	""
0x7fffffffdd70:	"_"
0x7fffffffdd72:	""
0x7fffffffdd73:	""
0x7fffffffdd74:	"f"
0x7fffffffdd76:	""
0x7fffffffdd77:	""
0x7fffffffdd78:	"l"
0x7fffffffdd7a:	""
0x7fffffffdd7b:	""
0x7fffffffdd7c:	"4"
0x7fffffffdd7e:	""
0x7fffffffdd7f:	""
0x7fffffffdd80:	"g"
0x7fffffffdd82:	""
0x7fffffffdd83:	""
0x7fffffffdd84:	""
0x7fffffffdd85:	""
0x7fffffffdd86:	""
0x7fffffffdd87:	""
0x7fffffffdd88:	""
0x7fffffffdd89:	""
0x7fffffffdd8a:	""
0x7fffffffdd8b:	""
0x7fffffffdd8c:	""
0x7fffffffdd8d:	""
0x7fffffffdd8e:	""
0x7fffffffdd8f:	""
0x7fffffffdd90:	"Can't you find the flag??\nUse GDB kid ;)\n"

...
```

After this message I got the flag, it was written there but I also made it sure by going further and checking stack.

**Answer - Ea5Y_fl4g**

### R0X

After doing basic checks.

When we run this file, it asks for a string from us.
Also by checking the file in editor, it could be that the flag is the string we enter.
So checking main for any clues.

```sh
$ objdump -D R0X

...

0000000000400686 <main>:
  400686:	55                   	push   %rbp
  400687:	48 89 e5             	mov    %rsp,%rbp
  40068a:	48 83 ec 20          	sub    $0x20,%rsp
  40068e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  400695:	00 00
  400697:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  40069b:	31 c0                	xor    %eax,%eax
  40069d:	bf a8 07 40 00       	mov    $0x4007a8,%edi
  4006a2:	e8 89 fe ff ff       	callq  400530 <puts@plt>
  4006a7:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  4006ab:	48 89 c6             	mov    %rax,%rsi
  4006ae:	bf ba 07 40 00       	mov    $0x4007ba,%edi
  4006b3:	b8 00 00 00 00       	mov    $0x0,%eax
  4006b8:	e8 b3 fe ff ff       	callq  400570 <__isoc99_scanf@plt>
  4006bd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  4006c1:	b8 be ba be ab       	mov    $0xabbebabe,%eax
  4006c6:	48 31 d0             	xor    %rdx,%rax
  4006c9:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  4006cd:	b8 ef be ad de       	mov    $0xdeadbeef,%eax
  4006d2:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
  4006d6:	75 1b                	jne    4006f3 <main+0x6d>

...
```

I compares rax with something stored in the stack (probably password) so digging deeper.

I asks for our input by calling the scan function and then moves the input from stack to rdx.

Next, it does a xor operation with **0xabbebabe** and **rdx**

Thus, finally compares the xor output with **0xdeadbeef**

Thus the final answer that we need to give is xor of **0xabbebabe** **0xdeadbeef**

But the above thing gives us the hex answer so converting it to decimal is the final flag.

Xor of 0xabbebabe and 0xdeadbeef is **0x75130451**

**Answer - 1964180561**

### Th1$_$h1T

Didn't need to go to GDB in this file also.

```sh
$ strings Th1\$_\$h1T

...

Enter the password here:
Congrats!! You got the flag
Lol....!!!
Password is in the link ;)

...
```

```sh
$ vim Th1\$_\$h1T

...

Congrats!! You got the flag^@^@^@^@m^@^@^@4^@^@^@N^@^@^@d^@^@^@1^@^@^@R^@^@^@_^@^@^@w^@^@^@4^@^@^@h^@^@^@1^@^@^@_^@^@^@b^@^@^@4^@^@^@n^@^@^@4^@^@^@Y^@^@^@3^@^@^@n^@^@^@g^@^@^@3^@^@^@^@^@^@^@Lol....!!!

...
```

```sh
$ cat Th1\$_\$h1t

...

Congrats!! You got the flagm4Nd1R_w4h1_b4n4Y3ng3Lol....!!!

...
```

Nice try but my terminal is good enough to render it :P

**Answer - m4Nd1R_w4h1_b4n4Y3**


### License

Free Solutions by Ayush Bansal
