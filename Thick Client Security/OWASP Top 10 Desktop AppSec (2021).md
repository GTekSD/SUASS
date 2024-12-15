# OWASP Top 10 Desktop Application Security Risks (2021) | Detailed Description

### [DA1 - Injections](#da1)

Issues such as SQL, LDAP, XML, OS command injection, etc. occur when untrusted input is passed to the interpreter as a part of a query/command. An attacker can trick interpreters to execute arbitrary commands to perform unwanted operations or gather unauthorized data.
 
### [DA2 - Broken Authentication and Session Management](#da2)

It includes issues such as insecure authentication implementation, authentication bypass, improper session, etc. An attacker can exploit insecure implementation in order to compromise user sessions, passwords and keys or to assume the identity of the user of the application.

### [DA3 - Sensitive Data Exposure](#da3)

Unintentional exposure of sensitive information such as PII, financial information, healthcare information or application keys and secrets. This may include data in memory post app logout, logs with sensitive info., hardcoded secrets in files (dll, binaries, configuration files), etc. An attacker can use this information to carry out identity frauds.

### [DA4 - Improper Cryptography Usage](#da4)

Issues such as usage of weak cryptographic algorithms, weak keys or secrets, custom cryptographic functions and insecure key management. An attacker can exploit these flaws to retrieve the sensitive information or to attack the users of the different instances of the same application.

### [DA5 - Improper Authorization](#da5)

Authorization flaws include weak file/folder permission per user role, missing principle of least privilege approach, improper user roles, unauthorized access to registry or environment variables, etc. An attacker can gain elevated privilege of the application or of the target system.

### [DA6 - Security Misconfiguration](#da6)

Flaws include misconfigured group policies / registry / firewall rules etc., missing file-content type check for file processing apps, misconfigured named-pipes, misconfigured supporting services used by the application, misconfigured third party services (SQL, AD, etc). An attacker can gain system access by exploiting these flaws.

### [DA7 - Insecure Communication](#da7)

Insecure communication issues include usage of weak TLS or DTLS cipher-suites/protocols, plaintext database connections, usage of plaintext communication protocols such as HTTP, COAP, MQTT,etc. These flaws allow an attacker to perform MiTM attacks in order to sniff and manipulate the data of an active connection.

### [DA8 - Poor Code Quality](#da8)

Issues related to absence of secure coding practices such as missing code-signing and verification of file integrity, missing code obfuscation, lack of binary protection, memory leaks, buffer overflows, etc. An attacker can reverse engineer the application in order to obtain information about the application logic, business specific proprietary logic or can exploit application processing using binary attacks like dll-preloading or injections, overflow/underflows and memory corruption. 

### [DA9 - Using Components with Known Vulnerabilities](#da9)

It includes usage of outdated softwares, obsolete components/services of OS/Third-party vendors. An attacker can exploit the vulnerable components/services to retrieve information or to compromise the target system either locally or remotely depending upon the exploit.

### [DA10 - Insufficient Logging & Monitoring](#da10)

Includes missing or insecure implementation of logs, improper parameters within audit logs, missing regular monitoring to detect abuse, etc. Centralized Logging and monitoring are used to detect/analyze an incident and to detect an active attack respectively, sometimes attackers try to manipulate this data to prevent alarms with many techniques like timestomping and many others, such issues also have to be focused.


<br/><br/>
# OWASP Top 10 Desktop Application Security Risks | Detailed
___
# <a name="da1" > DA1 - Injections </a>
### Description:
Issues such as SQL, LDAP, XML, OS command injection, etc. occur when untrusted input is passed to the interpreter as a part of a query/command. In general Desktop apps widely use 2 or 3 Tier architecture, so depending upon the sink, it would be impacted.
Desktop apps may use XML to save configuration/data hence all kinds of XML injections would apply. They also quite often use databases like MySQL/MSSQL/etc., so they are equally vulnerable to SQL injections. Many Desktop apps provide functionality which may use system calls in background, leaving wide exposure to OS command injection. Sometimes desktop apps are made to render HTML content (e.g. email clients), so HTML injections are also possible. Sometimes the sink can be scripting templates, XPath, LDAP, etc., so those would be equally impacted. So just like Web applications, Desktop apps are quite vulnerable to all common Injection attacks. If Desktop apps consume web API/microservices, so all relevant attacks of the web would also be applicable here. 

### Exploitability Rational:
Since desktop apps may be used under multiple situations, it might need an user to login or sometimes a guest user like a public kiosk.

### Impact: 
Based upon sink, either it may end up into a successful privileged command execution,  unauthorized data access, entire system compromise or denial of service.

### Prevention:
* One of the quite common practices is to sanitize user input, considering all input as suspicious.
* Industrial Standard recommendation for SQL like usage of stored procedures / parameterized queries. 
* Avoiding user input getting into execution of system level commands.
* Using forms of encoding based upon where it is going to be used, can prevent injections.



<br/><br/>
# <a name="da2" > DA2 - Broken Authentication and Session Management </a>
### Description:
Desktop apps either have their own application layer authentication or they inherit Authentication of Windows / *nix OS or sometimes they intake authentication from external things like RFID Authentication cards / USB Keys etc. or sometimes they explicitly do not ask authentication just relying upon platform security.
Issues such as insecure authentication implementation, authentication bypass, improper session, etc. falls into this vulnerability category. An attacker can exploit insecure implementation in order to compromise user sessions, credentials and keys or to assume the identity of the user of the application.
Taking example of desktop apps which are deployed to be used by public users e.g. ticketing kiosk / dispensers / tourist information kiosk etc., such systems might miss out implementing authentication properly or some emergency devices like in medical systems, where authentication is considered a little relaxed, if it comes at risk to patient life while performing a treatment or power plants, production line, law enforcement system apps etc.. 

### Exploitability Rational:
Since a desktop may be used under multiple situations, it might need an attacker to login or sometimes a guest user like a public kiosk with physical access.

### Impact: 
It may end up in a successful unauthorized data access or entire system compromise.

### Prevention:
* Industrial Standard recommendations like invalidating session upon inactivity, having short session life time, session entropy, etc. can prevent improper session management.
* In the case of external Authentication hardware (like RFID/USB key etc.) is being used, accepting a dynamic user challenge code in the form of PIN/password as 2nd factor of Authentication. So in case such a device is lost, it cannot be misused.
* Implementing proper Authentication across all of services/UI interface/shared drives etc. 




<br/><br/>
# <a name="da3" > DA3 - Sensitive Data Exposure </a>
  
### Description:
Unintentional exposure of sensitive information such as PII, application keys and secrets, financial / personal / healthcare information, etc would be classified as sensitive data exposure. An attacker can use this information to carry out frauds like data, identity, financial theft, etc.
Many Desktop apps tend to save sensitive information like encryption keys/connection string etc. in hardcoded form inside app binaries (executables, dll, config files, etc.) or sometimes within comments and then forget to remove them. 
It may also happen that desktop apps process any form of sensitive information like PII/Financial records/documents etc., but they do not have data encryption in place, this may lead unauthorized person to access such information in cleartext. Ideally drive level encryption and application layer encryption for data at rest is required.
In case if the system which runs the desktop app is poorly configured, it may allow dumping memory of a process. In case if post app logout/session expiry memory dump contains sensitive information, it would cause loss of data confidentiality violation. Depending upon language/platform garbage collector recycles stale memory, however upon explicit logout or after use sensitive data should be freed.

### Exploitability Rational:
Since a desktop may be used under multiple situations, it might need an user to login or sometimes a guest user like a public kiosk with physical access.
Suppose hardcoded keys are identified by an attacker, this would leave all possible installations in vulnerable condition, since they would use the same installer which had hardcoded value.

### Impact: 
It may end up in a successful unauthorized data access within a system or having such hardcoded keys someone can either decrypt the ciphers or bypass validations across all systems using the key-values.

### Prevention:
* Industrial Standard recommendations like using drive/partition level encryption for *nix/Windows hosts and have application layer encryption with proper key management scheme in place. 
* Using a Password Based Key Derivation function can be a good solution here.
* Deriving Secured-Random numbers to generate keys on runtime/first time installation & there by avoiding hardcoding items. 
* If using a filesystem to save sensitive information, it needs to be done with proper role based access control plus properly implemented cryptography in place (Hashing, Salting, Encryption with Proper Key Management).
* For unauthorized person, preventing access to process memory and clearing memory immediately post session expiry.

  
  
  
  
<br/><br/>
# <a name="da4" > DA4 - Improper Cryptography Usage </a>

### Description:
Improper Cryptography usage, may it be because of Outdated Cryptographic Algorithms or Weak Keys, Inappropriate usage of Cryptographic Functions, reuse of Cryptographic Parameters across all Installations, Improper usage of Cryptography for Integrity check, etc.
Choosing an incorrect form of Cryptographic Function may also cause problems, like using encryption instead of hashing (e.g. passwords storage, de-identification purpose, etc.) or improper management of key storage will cause serious risks. Many times custom made cryptographic functions are used, even when accepted industrial standards are available, which may open threats.

### Exploitability Rational:
If libraries with support for old/obsolete cryptographic functions are used, choosing weak keys, sometimes an attacker can downgrade and exploit to perform cryptanalysis, etc. All such use cases would allow an attacker to brute force or use common techniques for cryptanalysis.

### Impact: 
Primarily it may be a violation of data confidentiality or integrity, since via exploitation an attacker can retrieve sensitive information or can tamper with data.

### Prevention:
* Using the latest and industrial standard Cryptographic algorithms and functions.
* Using Proper key length, avoiding weak keys, choosing proper mode of operation and salt value.
* Choosing Proper way of applying cryptographic functions, e.g. choosing hash functions for the need of 1 way data operations like password storage, choosing salt to prevent ready made dictionary attacks.
* Using Secure Random function to generate any value used by cryptographic functions like salt/IV/auto generated keys etc.
* Usage of hash/symmetric/asymmetric key crypto system where required i.e. in scenario of data integrity (i.e. code signing/CRC/HMAC) or Authentication (e.g. digital certificate/HMAC) or data confidentiality (e.g. HTTPS or encryption at rest)




<br/><br/>
# <a name="da5" > DA5 - Improper Authorization </a>
### Description:
Authorization flaws include weak file/folder permission per user role, missing principle of least privilege approach, improper user roles, unauthorized registry or environment variables access, etc. Below are some most common vulnerabilities:

- Application or supporting services running on systems with higher privileges than required, such as root on *nix operating system and administrator on Windows operating system. If this service is compromised, an attacker directly gets full privilege access to the entire system.
- Binary of the application with setuid/setgid permission for *nix.
- Having an application directory with read/write access to low privileged users. For instance configuration files saved in public directories or configuration files with write access to other users (xx7) permissions on linux operating system or read-write-execute for everyone/non-admin in Windows. Similarly, executable files with write permission for low privileged users allows replacing legitimate files with malicious executable containing shellcode to perform privilege escalation. It might also happen that some sensitive information is saved within files and read permission instead of only admin, has been given to everyone.
- Having Write access to registry values used by applications on Windows operating systems for low privileged users. Sometimes apps are made which save security settings within the registry, if these registry keys can be tampered by a limited user it may impose threat. (e.g. data loss prevention, anti-virus, unwanted script blocking apps etc. prevent configuration alterations by using registry/group policies. If they have written configuration with weak permission, anyone with limited privilege role can easily bypass it)

### Exploitability Rational:
Having limited access to the system/app, an attacker can try exploiting the mentioned mis-configuration to gain privileged access. It might be possible to exploit this with system local access or remotely as well based on a few limited scenarios.

### Impact:
Improper authorization vulnerabilities will enable the attacker to escalate the privilege on the target system/app. After escalating the privilege an attacker can attack systems on the network, other users on the compromised system. Upon having system full privileged access, one can steal data or tamper with it causing loss of CIA. Exploitation can also be used to bypass various restrictions. 

### Prevention:
* Configuring the application to run at the lowest possible privilege.
* Avoiding setting setuid/setgid permission for the binary of the application.
* Configuring the read/write permission for application directory or files of the application to the privileged or required user role only
* Restricting read/write access of the registry values / configuration / log files to the user required for the operation. 




<br/><br/>
# <a name="da6" > DA6 - Security Misconfiguration </a>
### Description:
Flaws include misconfigured group policies / registry / firewall rules etc., missing file type/content check for file processing apps, misconfigured named-pipes, misconfigured supporting services used by the application, misconfigured third party services (SQL, AD, etc). An attacker can gain system access by exploiting these flaws. Security configuration issues spans across

- Application using misconfigured named-pipes for interprocess communication
- Application using background service misconfigured due to unquoted path in conjunction with weak folder permissions
- Applications using third-party services such as message queues, database services, etc. with default credentials, insecure access control, etc.
- Application having file upload features to support creation of entities but without file-type/content checking or applications which processes configuration files/data with misconfigured parsers, etc.
- Certain Windows applications rely on registry / group policies for security controls. However, there could be multiple misconfiguration chances, which leaves such applications vulnerable. For instance antivirus/Data loss prevention tools/device management tools etc., most cases they are restricted from uninstallation or tampering with configuration, despite having local admin users using group policies or registry. Since such exploitations are attempted by trusted insiders, hence an additional layer of security is required here to follow zero trust.
- Sometimes few apps are configured to serve API, web access, network shares, services, etc. only within the same machine, despite being connected over the network via firewall or source IP filtering rules etc. Misconfigurations in them expose such interfaces over the network and increase attack surface.
 
### Exploitability Rational:
Since a desktop may be used under multiple situations, it might need an user to login or sometimes a guest user like a public kiosk with physical access. Exploiting security misconfigurations can be simple sometimes, as it might be enforced only through obscurity. And sometimes it may also happen that the attacker can be a trusted insider.

### Impact:
An attacker can bypass restrictions & hence run arbitrary code by abusing misconfigured features or even escalate privilege on the system running the target application.

### Prevention:
* Named pipes with lowest possible privilege to carry out the communication and operation.
* Hardened supporting background process & third-party services
* Hardened/Defused file parser, File type/content validations
* Configuring proper firewall rules, group policies, registries, etc.



<br/><br/>
# <a name="da7" > DA7 - Insecure Communication </a>
### Description:
When any Application needs to communicate with the remote services such as remote SQL servers, web services, file transfer, sending commands or any other process running on the remote server, but uses plaintext communication protocols to consume services, such vulnerabilities fall under Insecure Communication. Insecure communication issues include usage of plaintext communication protocols such as FTP, TELNET, HTTP, MQTT, WS, etc. or usage of weak TLS/DTLS cipher-suites/protocols, plaintext database connections, using self signed certificates for secure channel communication, etc. These flaws allow an attacker to perform Man-in-The-Middle (MiTM) attacks in order to sniff and manipulate the data of an active connection.

### Exploitability Rational:
An attacker present within the network can access the communication via MiTM attack. If it is already unencrypted, it becomes easier to sniff confidential information or replay packets. Otherwise in case of weak encryption communication, an attacker can downgrade the connection and thereby sniff the traffic.

### Impact:
An attacker can retrieve user credentials, service credentials, communication strings, user session information by sniffing the communication between the application and remote service. Moreover, an attacker can manipulate or replay an active communication by carrying out a MiTM attack.

### Prevention:
* Risk of insecure communication can be mitigated by using secure version of the protocols such as HTTPS instead of HTTP, WSS instead of WS, SFTP instead of FTP, SSH instead of TELNET, etc.
* Disabling obsolete protocols and cipher-suits responsible for encrypted communication.
* Encrypted SQL connections
* Implementing tunnels for plaintext protocols for ex SSH tunnel, IPSec, etc.
* Using CA signed certificate and not using self signed certificate.



<br/><br/>
# <a name="da8" > DA8 - Poor Code Quality </a>
### Description:
Application build without following secure code practices. Issues such as but not limited to:
- Presence of dead code or test data in release build
- Poor memory management
- Lack of binary protection
- Unobfuscated code
- Missing code signing and verification

### Exploitability Rational:
An attacker needs access to the binary or installer of the target application. Subject to the kind of language used i.e. managed or unmanaged, reverse engineering may yield either assembly level or original source code equivalent. And in absence of code integrity, it may allow an attacker to run arbitrary code.

### Impact:
An attacker can reverse engineer the application and can glean information about the application logic, business proprietary logic, secrets used in the application. Bypass certain restrictions using run time debugging e.g. bypassing license check. It may also allow execution of malware in place of legitimate code or may help in privilege escalation.

### Prevention:
* Following secure coding practices, using SAST tools to detect security issues at an early stage of development
* Removing unused, dead code, test environment details. Following best practice for code comment, clean code approach.
* Using TPM/HSM or any other secure platforms to store the secrets, keys, etc.
* Obfuscating the code (however, this is considered as partial solution)
* Implementing protection mechanism via ASLR, DEP, validating length of data entering the buffers, preventing memory leaks, out of band leakage, etc.
* Implementing detection of code tampering via code signing and verification, detecting hooking of debuggers thereby preventing runtime debugging, etc.






<br/><br/>
# <a name="da9" > DA9 - Using Components with Known Vulnerabilities </a>
### Description:
Either any component/service offered by the underlying OS or an external 3rd party component which had a publicly known vulnerability (with/without exploit available), will impose very high risk on the products/assets. As part of the product life cycle any such affected component would be complemented with a security patch or newer version of that component. Some of them are automated, where the end-user doesn’t have to bother about it, however sometimes manually patching is required due to various reasons. Third party components are the reusable software components generally used to save time and budget, while developing any product/solution. There are two categories of third party components:
1. Open Source Components:
	These components are maintained by the open source community and the release of updates/patches for the components may/may not be in a timely manner.
2. Commercial Components:
These components are maintained by the third party vendors and updates are frequently released based on the business model. Patches are released generally at a fixed interval of time or immediately for some critical issues.

Using any of the above kinds of components can introduce new vulnerabilities and attack surfaces. It is necessary for the developers of the application to patch the discovered vulnerability in the open source components and use the latest/patched version of commercial components.

### Exploitability Rational:
An attacker needs to know the vulnerable component version, which is being used within the product, thereby allowing it to exploit based on the public available details.
It may also happen that there can be transitive dependencies, for instance in your product ‘A’ you may be using 3rd party product/component ‘B’, in turn product ‘B’ uses another 3rd party product/component ‘C’. If a vulnerability within product ‘C’ is disclosed, by default product ‘A’ is vulnerable as it inherits via using component ‘B’.

### Impact:
An attacker can exploit the publicly disclosed vulnerability in the OS offered/third party component in order to take over the system running the application, cause loss of data confidentiality/integrity or even may cause service unavailability depending upon the kind of exploit published.

### Prevention:
* Use Proprietary components with the latest update/patch.
* Only use open source components which are actively maintained by the open source community
* Check for the disclosed vulnerabilities using vulnerability databases like NVD, MITRE, etc. periodically and apply stable patches upon release by the vendor.
* Identifying SBOM (Software bill of materials) i.e. keeping track of all individual components being used within the product (while in the development phase itself), which can be handy when any exploit is published.




<br/><br/>
# <a name="da10" > DA10 - Insufficient Logging & Monitoring </a>

### Description:
Logging of the user operations, background tasks, etc are considered as important aspects of any application. As it records all the activities performed within the context of the application. Logging enables the application to resolve runtime functional errors and monitor the activities of the user for auditing purposes. 
There are different kinds of log such as 
1. Application logs - Records functional or operational logs.
2. Debug logs - Application generated logs used by developers of the application to debug the errors and runtime exceptions.
3. Audit logs - Logs recording information of an event. Log entry consists of 
	1. Date and timestamp 
	2. Operation performed or resource accessed
	3. User who performed the operation
	4. Source & destination address of the operation.
Only admin/designated users of the system/application must be authorized to configure and access logs.

In addition, a monitoring mechanism will use logs and enable the owner of the application to receive alerts like:
- Identifying security attacks
- Identifying compliance violation
- Unusual behaviors such as authentication failures, authorization failures, input validation failures, etc.

Common Logging and Monitoring issues comprise of:
- Many times developers, to understand what went wrong, put everything in logs which may log sensitive data such as PII, login credentials, encryption keys, tokens, etc.
- Storing logs in public folders with world read/writable permissions
- Non-admin users can access and update the audit logs.
- Using values supplied by the end-user within Audit trail e.g. IP address, username, timestamp, etc. from request are used. Or sometimes intaking parameters from the user, which can in turn inject values within the Audit trail, making it look like a legitimate entry.
- Absence of the monitoring mechanism.
- Insecure baseline configurations/rules for alerts.

### Exploitability Rational:
Since a desktop may be used under multiple situations, it might need an user to login or sometimes a guest user like a public kiosk with physical access.

### Impact:
Logging allows us to track the operations performed within the context of the application. It is very useful to detect/analyze any occurrence of the incident. Without a secure & robust logging mechanism, it will be easier for an attacker to manipulate the logs in order to cover tracks of the operation performed. Inappropriate or weak monitoring mechanisms will fail to detect an attack in real time and will not allow the owner of the application to take appropriate action to prevent the attack.

### Prevention:
* Avoid access to logs for common end users (neither read/write), unless required.
* Periodically monitor logs to identify suspicious activities.
* Do not intake user supplied parameters inside logs, in case if required sanitize the input and only allow in predefined places.
* Implement and configure robust alert/escalation mechanisms to detect the attacks.

<br/>
