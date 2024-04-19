**OWASP TOP-10**
---

**1.	Broken access control**
   
Broken access control is the vulnerability in the access control system that allows unauthorized access to sensitive data or resources.
When access control becomes broken, the severity of the impact is dangerous.
It can lead to unauthorized access to sensitive data, potentially leading to data breaches, theft of confidential information, and loss of credibility and trust.

---

**2.	Cryptographic Failures**
   
Cryptographic Failures are security vulnerabilities that can occur when cryptographic algorithms, protocols, or implementations are incorrectly used. This can expose sensitive data to attackers, such as passwords, credit card numbers, and personal identification numbers.

---

**3.	Injection**
   
Injection vulnerabilities allow attackers to insert malicious inputs into an application or relay malicious code through an application to another system.

---

**4.	Insecure design**
   
Insecure design is the lack of security controls being integrated into the application throughout the development cycle. as the application itself is not designed with security in mind.

---

**5. Security misconfiguration**
   
Security misconfiguration: the improper configuration of security settings, permissions, and controls that can lead to vulnerabilities and unauthorized access.

---

**6.	Vulnerable and outdated components**
   
Vulnerable and outdated components If the components you are using to build your applications become outdated or have a serious vulnerability, you would be impacted by that.

---

**7.	Identification and authentication failures**
   
Identification and authentication failures are vulnerabilities related to applications' authentication schemes. Such failures can lead to serious and damaging data breaches.

---

**8.	Software and data integrity failures**

Software and data integrity failures are vulnerabilities in software or infrastructure that allow an attacker to modify or delete data in an unauthorized manner. Attackers can exploit these vulnerabilities to gain access to sensitive information.

 ---
 
**9.	Security logging and monitoring failures**

Security logging and monitoring failures are security vulnerabilities that can occur when a system or application fails to log or monitor security events properly. This can allow attackers to gain unauthorized access to systems and data without detection.

---

**10.	SSRF**
    
SSRF attack involves an attacker abusing server functionality to access or modify resources. The attacker targets an application that supports data imports from URLs or allows them to read data from URLs.

---


## Common Web Application Security Risks


| Category | Vulnerabilities |
|---|---|
| Broken Access Control |  - Insecure Direct Object References (IDOR) <br> - Vertical/Horizontal Privilege Escalation <br> - Forced Browsing <br> - CSRF Attacks <br> - Session-related Attacks <br> - Path Traversal <br> - Directory Listing  <br> - Back Button Vulnerability <br> - Open Redirection |
| Cryptographic Failures | - Weak SSL/TLS Cipher Protocols <br> - Missing HTTPS Schema <br> - Weak Random Functions <br> - Improper Cryptographic Key Management <br> - Failure to Verify Cryptographic Signatures <br> - Key Length and Strength Issues <br> - Padding Oracle Attacks <br> - Weak Encryption Algorithms (DES, MD5) <br> - Lack of Perfect Forward Secrecy (PFS) <br> - Side-Channel Attacks |
| Injection | - SQL Injection <br> - OS Command Injection <br> - Cross-Site Scripting (XSS) <br> - XML External Entity Injection (XXE) <br> - CSV Injection <br> - Server-Side Template Injection (SSTI) <br> - Local File Inclusion (LFI) / Remote File Inclusion (RFI) <br> - LDAP Injection <br> - IFrame Injection <br> - HTML Injection |
| Insecure Design | - Uploading Malicious Files <br> - Race Conditions <br> - External XML Entities <br> - XSS through File Name/Type (SVG) <br> - Sensitive Data in Browser Cookies <br> - Missing File Size Validation <br> - Missing Account Lockout Policy <br> - Weak Input Validation <br> - Rate Limiting Bypass <br> - Account Verification Bypass |
| Security Misconfiguration | - CORS Misconfiguration <br> - Guessable CAPTCHA <br> - Clickjacking <br> - HTTP Request Smuggling <br> - Working Default Credentials <br> - Improper Error Handling <br> - Absent/Weak Security Headers <br> - Sensitive Cookie Without 'HttpOnly' Flag <br> - Password in Configuration File <br> - Cleartext Storage of Sensitive Information |
| Vulnerable and Outdated Components | - Components with Known Vulnerabilities <br> - Unpatched Dependencies <br> - Unmaintained Libraries <br> - Vulnerable jQuery Version <br> - Vulnerable Bootstrap Version <br> - Vulnerable Server Version Disclosure <br> - Vulnerable ASP.NET Version Disclosure <br> - Vulnerable Framework Version Disclosure |
| Identification and Authentication Failures | - Session Hijacking <br> - Session Fixation <br> - Weak Password Recovery Mechanisms <br> - Weak Password Requirements <br>  - Insufficient Session Expiration <br> - Unverified Password Change <br> - Username/Password Enumeration <br> - Brute Force Attacks <br> - CAPTCHA Bypass |
| Software and Data Integrity Failures | - Insecure Deserialization <br> - Missing Integrity Checks <br> - Untrusted External Source Inclusion |
| Security Logging and Monitoring Failures | - Logging Sensitive Information <br> - Lack of Logging Important Information <br> - Log Injection/Forging |


