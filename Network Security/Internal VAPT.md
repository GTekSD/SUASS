# Internal Vulnerability Assessment and Penetration Testing

You conduct VAPT from inside of the client’s network. You act like an attacker who has internal access to a client's/ companie's network. Now, what will u do ? Monitoring, credential stealing, man in the middle attacks (MITM), privilege escalation, information leakage, malware infections, or any other malicious activity. This PT will show the organization’s entry points/weaknesses, and help assess an attack’s impact. Even if you are secure from external threats, internal testing is vital should an attacker access your network from the inside.

### Basic Pre-Engagement
Client will ask u to do an internal penetration test and will gives u list of scope. The scope can be Firewalls, Database Servers, File Servers, Physical Server, eMail Server, etc. 

Since the test is to be performed from within the network, only vulnerability assessment is performed, Penetration testing will performed only as per client's requirement.

To perform Internal security assesment, you need to get into client's network. 
How? by Remote Desktop Protocol (RDP) or SSH or VPN. if client dosen't provide you these options, then we have to walk to the client's location.

### Scope of work:
Clients will share the list of internal IP addresses to test. Confirm the given scope before start scanning. Stay within the scope of the agreed-upon work! If the job scope includes only email servers, then test only email servers – do not go outside of that! Communicate regularly with client, asking questions and being willing to answer any of their questions. 

#### SSH Key Whitelisting | ssh-keygen

Command for public key generation:  `ssh-keygen -m <format> -t <dsa/rsa> -b <bits> -f <output_keyfile>`

Where, 
- [-m format] [-t dsa | ecdsa | ecdsa-sk | ed25519 | ed25519-sk | rsa] [-b bits] [-f output_keyfile]

- The minimum and maximum values for RSA and DSA keys are 512 and 32768 bits respectively. 

- The default for RSA keys is 2048 bits, the default for DSA is 1024 and the default for ECDSA keys is 256. 

This public key to be sent to the Single Point Of Contact (SPOC) person so he will give permission to this key to access in its internal networks and he will provide ssh username, password, and IP address to connect to. 

```
ssh-keygen -m PEM -t rsa -b 4096 -f ssh_key
```
```
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase): empty
Enter same passphrase again: empty
Your identification has been saved in ssh_key
Your public key has been saved in ssh_key.pub
The key fingerprint is:
SHA256:gNPLhN4f6cAclDjr8cs3xCZ9Mgt3k5dnM4do5IcMo6I cyxac@GTekSD
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

Connect to client's internal network using ssh
```powershell
ssh <Username>@<IP_Address> 
```
Then it will ask for password, provide the password and you got the access. 


### Remember

1. Ask client to give final defined scope.
2. Ask client to provide you two systems, installed Kali Linux and Nessus.
3. Provided system's IP should be whitelisted in client's internal network.
4. If your performing remotely, Ask to provide VPN credentials, RDP credentials or SSH credentials.
5. The assigned IP should be whitelisted in their internal network or static IP should be assigned.
6. Check the reachability of defined scope and make sure all the IP are reachable.
   ```shell
   ping -c 4 <IP_Address>
   nmap -sn -iL <List_of_defined_scope>
   ```
7. If not, then raise the issue to the SPOC person and make them reachable.
8. Then perform port scanning and observe if any port is filtered or not.
   ```shell
   nmap -Pn -p-65535 -iL <List_of_defined_scope>
   ```
9. If some ports are filtered, convey the same to the SPOC and get those ports open.
10. Ask SPOC, when the scanning should be perform? In Buissness Hours or After Buissness Hours or on weekends.
11. After this make batches of scope and put them on Nessus Advanced Scan:
    Advanced Scan 
> Settings
  - DISCOVERY
    - Host Discovery
      -  - [x] UDP
     
    - Port Scanning
      - Port scan range: 0-65535
      -  - [x] UDP
     
> Plugins
  - Backdoors: `DISABLED`
  - Denial of Service: `DISABLED`

12. After the scan is complete fetch the report into .cvs and proceed to the false positive approach.
13. This can be done by using Nmap NSE scripts or testssl.
14. Take the POC of the actual findings, make the report and submit it to the spoc person. 


https://www.threatintelligence.com/blog/internal-penetration-testing
