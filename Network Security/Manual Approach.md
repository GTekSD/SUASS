#### Findings and their NSE scripts

- BEAST Security vulnerability
- Server vulnerable to SSL Lucky13 Attack
- SSL / TLS Versions Supported
- SSL Cipher Suites Supported
- SSL DROWN Attack vulnerability (Decrypting RSA with Obsolete and Weakened encryption)
- SSL Medium Strength Cipher Suites Supported (SWEET32)
- SSL RC4 Cipher Suites Supported (Bar Mitzvah)
- SSL Version 2 and 3 Protocol Detection
- SSL Weak Cipher Suites Supported
- SSLv3 Padding Oracle on Downgraded Legacy Encryption Vulnerability (POODLE)
- TLS Version 1.0 Protocol Deprecated
- TLS Version 1.1 Protocol Deprecated
```
nmap --script ssl-enum-ciphers <target ip>
```


- Nginx v1.16.1 is vulnerable to Information Disclosure vulnerability
```
nmap -sV <target ip>
```


- SSL/TLS Diffie-Hellman Modulus <= 1024 Bits (Logjam)	
```
nmap --script ssl-dh-params <target ip>
```


- SSL Certificate Chain Contains RSA Keys Less Than 2048 bits
- SSL Certificate Expiry
- SSL Certificate Signed Using Weak Hashing Algorithm
- SSL Self-Signed Certificate
```
nmap --script ssl-cert <target ip>
```

- Obsolete CBC ciphers Enabled
- SSH Server CBC Mode Ciphers Enabled
- SSH Weak Key Exchange Algorithms Enabled
- SSH Weak MAC Algorithms Enabled
```
nmap --script ssh2-enum-algos <target ip>
```

- HTTP TRACE / TRACK Methods Allowed
```
nmap --script http-methods <target ip>
```

- HSTS Missing from HTTPS Server
```
nmap --script http-security-headers <target ip>
```


- Microsoft SQL Server Unsupported Version Detection (remote check)
```
nmap -p 1433 --script ms-sql-info <target ip>
```


- Unencrypted Telnet Server
```
nmap -p 23 --script telnet-encryption <target ip>
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
