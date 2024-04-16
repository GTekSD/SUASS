# Internal Vulnerability Assessment and Penetration Testing


Create ssh key and send it to client so that they will configure in their sys to allow remote connection
On windows
```
ssh-keygen -m PEM -t rsa -b 4096
```
```
PS C:\Users> ssh-keygen -m PEM -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (C:\Users/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in C:\Users/.ssh/id_rsa
Your public key has been saved in C:\Users/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:xcHgmrKKje9tNmq9UnDN4qcCTDoA0POLUgiYFUcc4pA anzentech\sdhole@ANZLAP024
The key's randomart image is:
+---[RSA 4096]----+
|==+++.  .o.      |
|Eooo.  . ...     |
|o..o o  . o      |
|o.o + oo .       |
|=. =.oo S        |
|=.. +o.          |
| + o.o           |
| ++o*            |
|o+**oo           |
+----[SHA256]-----+
```
