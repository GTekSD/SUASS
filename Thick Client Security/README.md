# Thick Client Security Testing

Thick client applications are generally desktop applications that contain nearly all components required for independently operating and executing software applications. A Thick Client application is basically an application that runs on the User’s host machine/system and communicates with the backend server or database server.  The Thick Client is also known as the “Fat Client”, “Rich Client” or “Heavy Client” Application. 

Thick client applications can be developed using various programming languages such as: .Net, Java, C/C++, Microsoft Silverlight, Java applets.

Example: Video games, Microsoft Office, Adobe Creative Suite, media players, and web browsers.

# OWASP Top 10 Desktop Application Security Risks (2021) | Quick Reference Table  


The OWASP Desktop App. Security Top 10 is a standard awareness document for developers, product owners and security engineers. It represents a broad consensus about the most critical security risks to Desktop applications.

Globally recognized by developers as the first step towards more secure coding.

Companies should adopt this document and start the process of ensuring that their desktop applications / thick-clients minimize these risks. Using the OWASP Top 10 is perhaps the most effective first step towards changing the software development culture within your organization into one that produces more secure code.



| OWASP Top 10 Desktop App | Examples | 
|---|---|
| DA1 - Injections | SQLi, LDAP, XML, OS Command, etc. |
| DA2 - Broken Authentication & Session Management | OS / DesktopApp account Authentication & Session Management, Auth. for Import / Export with external Drive, Auth. for Network Shared Drives or other Peripheral devices |
| DA3 - Sensitive Data Exposure | Data in Memory post App Logout, Logs with Sensitive Info., Hardcoded Secrets in files, etc. |
| DA4 - Improper Cryptography Usage | Weak Keys or Usage of Outdated Cryptographic Algorithms, Inappropriate usage of Cryptographic Functions, reuse of Cryptographic Parameters across all Installations, Improper usage of Cryptography for Integrity check |
| DA5 - Improper Authorization | Weak File/Folder Permission per User Role, Missing Principle of Least Privilege approach, Improper User Roles |
| DA6 - Security Misconfiguration | Weak OS Hardening, Misconfigured Group Policies / Registry / Firewall rules etc., Missing File Type check for File Processing Apps,  Misconfigured Named-Pipes, misconfigured 3rd party services, etc. |
| DA7 - Insecure Communication | Usage of weak TLS or DTLS Cipher-suites or Protocols, Unencrypted DB Queries in Transit, Absent Encrypted standard/custom protocol communication like HTTP, MQTT, COAP, etc. |
| DA8 - Poor Code Quality | Missing Code-Signing and Verification for File Integrity, Missing Code Obfuscation, Dll-Preloading or Injection, Race Conditions, lack of binary protection (Overflows, Null pointers, memory corruption) etc.  |
| DA9 - Using Components with Known Vulnerabilities | Usage of Outdated Softwares, or Usage of Obsolete Components/Services of Windows/3rd Party vendors |
| DA10 - Insufficient Logging & Monitoring | Missing or Improper Logging of Activities, Missing Regular Monitoring to Detect Abuse |  


Note: These Top10 have been created keeping in mind Windows, *Nix platforms and using commonly available CVE, exploits, writeups.

