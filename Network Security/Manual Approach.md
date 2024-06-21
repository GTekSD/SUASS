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
```
testssl --quiet --sneaky -p <ip:port>
```
```
nmap --script ssl-enum-ciphers <target ip>
```

### TLS Version 1.1 Protocol Deprecated
```
testssl --quiet --sneaky -p <ip:port>
```
```
nmap --script ssl-enum-ciphers <target ip>
```

### Vulnerable OpenSSH 8.2 and 8.8 Version Detection
```
nmap -Pn -sV <target ip>
```

### Vulnerable OpenSSL 1.1.1t Version Detection
```
nmap -Pn -sV <target ip>
```

### Vulnerable VMware ESX / ESXi 6.7.0 Version Detection
```
nmap -Pn -sV <target ip>
```

### ManageEngine ADAudit Plus 7.0 Multiple Vulnerabilities
```
nmap -Pn -sV <target ip>
```

### Nginx v1.16.1 is vulnerable to Information Disclosure vulnerability
```
nmap -Pn -sV <target ip>
```

### SSL/TLS Diffie-Hellman Modulus <= 1024 Bits (Logjam)	
```
nmap --script ssl-dh-params <target ip>
```

### SSL Certificate Cannot Be Trusted
```
nmap --script ssl-cert <target ip>
```

### SSL Certificate Chain Contains RSA Keys Less Than 2048 bits
```
nmap --script ssl-cert <target ip>
```

### SSL Certificate Expiry
```
nmap --script ssl-cert <target ip>
```

### SSL Certificate Signed Using Weak Hashing Algorithm
```
nmap --script ssl-cert <target ip>
```

### SSL Self-Signed Certificate
```
nmap --script ssl-cert <target ip>
```

### Obsolete CBC ciphers Enabled
```
testssl --quiet --sneaky -s <ip:port>
```

### SSH Server CBC Mode Ciphers Enabled
```
nmap --script ssh2-enum-algos <target ip>
```

### SSH Weak Key Exchange Algorithms Enabled
```
nmap --script ssh2-enum-algos <target ip>
```

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
nmap -sV --script smb-protocols <target ip>
```

### MS17-010: Security Update for Microsoft Windows SMB Server
```
nmap -sV --script smb-vuln-ms17-010 <target ip>
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
```
nmap -Pn -sV --script rdp-enum-encryption
```

### Terminal Services Encryption Level is not FIPS-140 Compliant
```
nmap -Pn -sV --script rdp-enum-encryption
```

### Terminal Services Encryption Level is Medium or Low
```
nmap -Pn -sV --script rdp-enum-encryption
```

### Web Server HTTP Header Internal IP Disclosure
```
nmap -Pn -sV --script http-internal-ip-disclosure
```

### Redis Server Unprotected by Password Authentication
```
nmap -Pn -sV --script redis-info <targert ip>
```
