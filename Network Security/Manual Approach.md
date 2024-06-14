#### Findings and their NSE scripts

### BEAST Security Vulnerability
```
testssl --quiet --sneaky -A <ip:port>
```
```
nmap --script ssl-enum-ciphers <target ip>
```

### Server Vulnerable to SSL Lucky13 Attack
```
testssl --quiet --sneaky -L <ip:port>
```
```
nmap --script ssl-enum-ciphers <target ip>
```

### SSL / TLS Versions Supported
```
nmap --script ssl-enum-ciphers <target ip>
```

### SSL Cipher Suites Supported
```
nmap --script ssl-enum-ciphers <target ip>
```

### SSL DROWN Attack Vulnerability (Decrypting RSA with Obsolete and Weakened encryption)
```
testssl --quiet --sneaky -D <ip:port>
```
```
nmap --script ssl-enum-ciphers <target ip>
```

### SSL Medium Strength Cipher Suites Supported (SWEET32)
```
testssl --quiet --sneaky -W <ip:port>
```
```
nmap --script ssl-enum-ciphers <target ip>
```

### SSL RC4 Cipher Suites Supported (Bar Mitzvah)
```
testssl --quiet --sneaky -4 <ip:port>
```
```
nmap --script ssl-enum-ciphers <target ip>
```

### SSL Version 2 and 3 Protocol Detection
```
testssl --quiet --sneaky -p <ip:port>
```
```
nmap --script ssl-enum-ciphers <target ip>
```

### SSL Weak Cipher Suites Supported
```
nmap --script ssl-enum-ciphers <target ip>
```

### SSLv3 Padding Oracle on Downgraded Legacy Encryption Vulnerability (POODLE)
```
testssl --quiet --sneaky -O <ip:port>
```
```
nmap --script ssl-enum-ciphers <target ip>
```
### TLS Version 1.0 Protocol Deprecated
### TLS Version 1.1 Protocol Deprecated
```
testssl --quiet --sneaky -p <ip:port>
```
```
nmap --script ssl-enum-ciphers <target ip>
```

### Vulnerable OpenSSH 8.2 and 8.8 Version Detection
### Vulnerable OpenSSL 1.1.1t Version Detection
### Vulnerable VMware ESX / ESXi 6.7.0 Version Detection
### ManageEngine ADAudit Plus 7.0 Multiple Vulnerabilities
### Nginx v1.16.1 is vulnerable to Information Disclosure vulnerability
```
nmap -Pn -sV <target ip>
```

### SSL/TLS Diffie-Hellman Modulus <= 1024 Bits (Logjam)	
```
nmap --script ssl-dh-params <target ip>
```

### SSL Certificate Cannot Be Trusted
### SSL Certificate Chain Contains RSA Keys Less Than 2048 bits
### SSL Certificate Expiry
### SSL Certificate Signed Using Weak Hashing Algorithm
### SSL Self-Signed Certificate
```
nmap --script ssl-cert <target ip>
```

### Obsolete CBC ciphers Enabled
```
testssl --quiet --sneaky -s <ip:port>
```

### SSH Server CBC Mode Ciphers Enabled
### SSH Weak Key Exchange Algorithms Enabled
### SSH Weak MAC Algorithms Enabled
```
nmap --script ssh2-enum-algos <target ip>
```

### HTTP TRACE / TRACK Methods Allowed
```
nmap --script http-methods <target ip>
```

### HSTS Missing from HTTPS Server
```
nmap --script http-security-headers <target ip>
```

### Microsoft SQL Server Unsupported Version Detection (remote check)
```
nmap -p 1433 --script ms-sql-info <target ip>
```

### Unencrypted Telnet Server
```
nmap -p 23 --script telnet-encryption <target ip>
```

### Microsoft SQL Server Unsupported Version Detection
```
nmap -Pn --script ms-sql-info
```

### NFS Sensitive Information Disclosure
```
nmap -sV --script=nfs-* -Pn -p 111 
```

### Vulnerable Apache Version Detection
```
nmap -Pn -sV <target ip>
```

### Microsoft Windows SMBv1 Multiple Vulnerabilities
```
smb-protocols
```

### MS17-010: Security Update for Microsoft Windows SMB Server
```
smb-vuln-ms17-010
```

### NetScaler Unencrypted Web Management Interface
```
testssl -p --quiet
```

### Remote Desktop Protocol Server Man-in-the-Middle Weakness
```
nmap -Pn -sV --script rdp-enum-encryption
```

### SMB Signing not required
```
nmap --script smb2-security-mode -Pn
```

### SSH Terrapin Prefix Truncation Weakness
```
nmap -Pn -sV --script ssh2-enum-algos
```

### Terminal Services Doesn't Use Network Level Authentication (NLA) Only
### Terminal Services Encryption Level is not FIPS-140 Compliant
### Terminal Services Encryption Level is Medium or Low
```
nmap -Pn -sV --script rdp-enum-encryption
```

### Web Server HTTP Header Internal IP Disclosure
```
nmap -Pn -sV --script http-internal-ip-disclosure
```

### Example

```
root@Kali:~# nmap -sC 10.211.55.6
..
21/tcp   open   ftp
| ftp-anon: Anonymous FTP login allowed (FTP code 230)
|_Can't get directory listing: PASV failed: 550 Permission denied.
| ftp-syst:
|   STAT:
| FTP server status:
|      Connected to 10.211.55.4
|      Logged in as ftp
…
|      vsFTPd 3.0.3 – secure, fast, stable
|_End of status
22/tcp   open   ssh
| ssh-hostkey:
|   2048 81:21:ce:a1:1a:05:b1:69:4f:4d:ed:80:28:e8:99:05 (RSA)
|   256 5b:a5:bb:67:91:1a:51:c2:d3:21:da:c0:ca:f0:db:9e (ECDSA)
|_  256 6d:01:b7:73:ac:b0:93:6f:fa:b9:89:e6:ae:3c:ab:d3 (ED25519)
53/tcp   open   domain
| dns-nsid:
|   id.server: ATL
|_  bind.version: dnsmasq-2.75
80/tcp   open   http
|_http-title: 404 Not Found
…
3306/tcp open   mysql
| mysql-info:
|   Protocol: 10
|   Version: 5.7.12-0ubuntu1
…
```
