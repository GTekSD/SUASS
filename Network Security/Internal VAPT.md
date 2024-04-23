# Internal Vulnerability Assessment and Penetration Testing

You conduct VAPT from inside of the client’s network. You act like an attacker who has internal access to a client's/ companie's network. Now, what will u do ? Monitoring, credential stealing, man in the middle attacks (MITM), privilege escalation, information leakage, malware infections, or any other malicious activity. This PT will show the organization’s entry points/weaknesses, and help assess an attack’s impact. Even if you are secure from external threats, internal testing is vital should an attacker access your network from the inside.

------ 


Basic Pre-Engagement
Client will ask u to do an internal penetration test and will gives u list of scope. To perform Internal PT, you need to get into client's network. 
How? by Remote Desktop Protocol (RDP) or SSH, if client dosen't provide theses options then we have to walk to the client's location.


Scope of work:
Clients will share the list of internal IP addresses to test. Confirm the given scope before start scanning. Stay within the scope of the agreed-upon work! If the job scope includes only email servers, then test only email servers – do not go outside of that! Communicate regularly with client, asking questions and being willing to answer any of their questions. 

#### Create SSH Key | ssh-keygen
Create SSH Key and send it to a client so that they will configure in their sys to allow remote connection
```
ssh-keygen -m PEM -t rsa -b 4096
```
Where, [-m format] [-t dsa | ecdsa | ecdsa-sk | ed25519 | ed25519-sk | rsa] [-b bits]
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
