# Cyber Security Interview Questions
---

## Q.1 Introduction as you’re an experienced application security consultant.

I'll start by introducing myself. I'm working as an Application Security Consultant in ABC technologies for the past 3 years. With 3 years of experience in Application Security, I've done many security assessments of web applications and mobile applications, making me specialized in web and mobile security. I've handled many projects for various clients of different sectors like e-commerce, health care, finance, telecom, etc. Currently, I am working remotely with an e-commerce client handling their web and mobile applications and working on the closure of the reported vulnerabilities.

## Q. What are the top 10 OWASP vulnerabilities?

### Answer:
Here are the top 10 OWASP vulnerabilities, the risks associated with each vulnerability, how they can be mitigated, and the tools and techniques that can be used to identify and prevent them:

### Q.1. Broken Access Control
- **Risks:** This vulnerability allows attackers to gain unauthorized access to sensitive data or resources.
- **Mitigation:** Implement proper access control mechanisms, such as role-based access control (RBAC).
- **Tools and techniques:** Use static analysis tools to scan for access control vulnerabilities.
- Common risks associated: Path Traversal, CSRF, IDOR, Forced Browsing.

### Q.2. Cryptographic Failures
- **Risks:** This vulnerability allows attackers to steal sensitive data, such as passwords or credit card numbers, by decrypting it.
- **Mitigation:** Use strong cryptographic algorithms and properly implement cryptographic libraries.
- **Tools and techniques:** Use dynamic analysis tools to scan for cryptographic vulnerabilities.
- Common risks associated: Cleartext Transmission of Sensitive Information, Weak Encoding for Password

### Q.3. Injection
- **Risks:** This vulnerability allows attackers to inject malicious code into an application, which can then be executed by other users.
- **Mitigation:** Sanitize all user input before it is processed by the application.
- **Tools and techniques:** Use static analysis tools to scan for injection vulnerabilities.

### Q.4. Insecure Design
- **Risks:** This vulnerability allows attackers to exploit design flaws in an application, such as using hard-coded passwords or not properly validating user input.
- **Mitigation:** Design applications with security in mind.
- **Tools and techniques:** Use static analysis tools to scan for insecure design vulnerabilities.

### Q.5. Security Misconfiguration
- **Risks:** This vulnerability allows attackers to exploit misconfigurations in an application's security settings, such as leaving default passwords in place or not properly securing sensitive data.
- **Mitigation:** Implement and enforce security best practices.
- **Tools and techniques:** Use dynamic analysis tools to scan for security misconfiguration vulnerabilities.

### Q.6. Vulnerable and Outdated Components
- **Risks:** This vulnerability allows attackers to exploit vulnerabilities in third-party components that are used by an application.
- **Mitigation:** Keep all components up to date with the latest security patches.
- **Tools and techniques:** Use static analysis tools to scan for vulnerable components.

### Q.7. Identification and Authentication Failures
- **Risks:** This vulnerability allows attackers to gain unauthorized access to an application by bypassing or abusing the authentication process.
- **Mitigation:** Implement strong authentication mechanisms, such as multi-factor authentication (MFA).
- **Tools and techniques:** Use dynamic analysis tools to scan for identification and authentication vulnerabilities.

### Q.8. Software and Data Integrity Failures
- **Risks:** This vulnerability allows attackers to modify or delete sensitive data, such as financial records or medical records.
- **Mitigation:** Implement data integrity checks to ensure that data is not modified or deleted without authorization.
- **Tools and techniques:** Use static analysis tools to scan for software and data integrity vulnerabilities.

### Q.9. Security Logging and Monitoring Failures
- **Risks:** This vulnerability allows attackers to evade detection by disabling or tampering with security logs.
- **Mitigation:** Implement effective security logging and monitoring practices.
- **Tools and techniques:** Use security information and event management (SIEM) tools to collect and analyze security logs.

### Q.10. Server-Side Request Forgery (SSRF)
- **Risks:** This vulnerability allows attackers to force an application to make unauthorized requests to other servers.
- **Mitigation:** Implement proper input validation to prevent attackers from injecting malicious requests.
- **Tools and techniques:** Use static analysis tools to scan for SSRF vulnerabilities.

### Q. Web applications assessment and threat modeling approach:

For starting an assessment, if asked to do grey box testing, we first take a positive walkthrough of an application as per the developer's point of view. This gives us an idea of the architecture design or data flow of an application. We look for user roles if any and ask for at least 3 credentials for each user role. Then, according to the application, we create test cases for various functionalities:

- Authenticated
- Unauthenticated
- Privilege related
- Server related
- Session related
- Business flaw related
- Payment related

After creating test cases, we start with the threat modeling of an application, explaining the whole threat modeling process.

### Attack Scenarios and Test Cases:

#### Authenticated Related:
- Deep URL
- CSRF
- SQL Injection
- XSS
- Clickjacking
- Captcha Related cases
- Cookie Management

#### Unauthenticated Related:
- HTTPS/HTTP
- Login Bypass
- Password Autocomplete Enabled
- Server Page Error
- Application Host
- HTTP methods
- ... (continued list of test cases)

If any question is asked on threat modeling, mention STRIDE:

### Q. What is STRIDE?

STRIDE is an acronym for the threat modeling system, categorizing cyberattacks into the following techniques:
- Spoofing = Authentication
- Tampering = Integrity
- Repudiation = Non-Repudiation
- Information disclosure = Confidentiality
- Denial of service (DoS) = Availability
- Elevation of privilege = Authorization

For threat modeling practice, a tool like **Microsoft threat modeling tool** can be used.

### Security Control and Mitigation Techniques:

#### Spoofing Identity - Authentication:
- Appropriate authentication
- Protect secret data.
- Don’t store secrets

#### Tampering with data - Integrity:
- Appropriate authorization
- Hashes
- MACs
- Digital signatures
- Tamper-resistant protocols

#### Repudiation - Non-Repudiation:
- Digital signatures
- Timestamps
- Audit trails

#### Information Disclosure - Confidentiality:
- Authorization
- Privacy-enhanced protocols
- Encryption
- Protect secrets.
- Don’t store secrets

#### Denial of Service - Availability:
- Appropriate authentication
- Appropriate authorization
- Filtering
- Throttling
- Quality of service

### Q. Elevation of privilege	Authorization
- **Mitigation:** Run with least privilege.

### Server Identification:
The simplest and most basic form of identifying a web server is to look at the Server field in the HTTP response header. Some common servers include:
- Apache Web Server: Version 2.4.46
- IIS Web Server: Version 10.0.17763.1
- Nginx Web Server: Version 1.19
- LiteSpeed Web Server: Version 5.4.12
- Apache Tomcat: Version 10.0.7
- Node.js: Version 14.7.1
- Lighttpd: Version 1.4.59
- Jigsaw Server
- Sun Java System Web Server

### Insecure Deserialization:
Insecure Deserialization occurs when untrusted data is used to abuse the logic of an application, executing malicious code upon being deserialized.

**Example:**
An attacker changes the serialized object to give themselves admin privileges:
`a:4:{i:0;i:1;i:1;s:5:"Alice";i:2;s:5:"admin"; i:3;s:32:"b6a8b3bea87fe0e05022f8f3c88bc960";}`

### XXE (XML External Entity) Vulnerability:
XXE vulnerabilities occur when applications use XML to transmit data between the browser and the server, leading to arbitrary code execution.

### SQL Injection Bypassing WAF (Web Application Firewall):
I encountered a scenario while working on an e-commerce application where I had to bypass a WAF. Using payloads through SQL map, I discovered SQL injection in the cookie, obtaining user details.

### Blind SQL Injection:
Blind SQL injection asks the database true or false questions and determines the answer based on the application's response.

### SSRF (Server-Side Request Forgery):
SSRF vulnerabilities allow attackers to send crafted requests from the server of a vulnerable web application. For instance, an attacker may modify a request to specify a URL local to the server itself.

### Thick Client:
Thick clients are heavy applications that run on the client-side (user computer). Security for such applications is dependent on the local computer's resources.

### Q. Default Directories
- /usr/share/tomcat{X}
- \inetpub\wwwroot
- /var/www/html
- /usr/local/nginx/conf

### SANS Top 25 (Remember at least 5 of them)
- Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')
- Improper Input Validation
- Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')
- Cross-Site Request Forgery (CSRF)
- Improper Limitation of a Pathname to a Restricted Directory ('Path Traversal')

### Local File Inclusion (LFI) and File Traversal

#### Q.1. Local File Inclusion (LFI):
Local File Inclusion occurs when an attacker can include files from the local file system of the server hosting the web application. This vulnerability arises due to improper input handling, allowing traversal of the file system. Attackers can view sensitive files, execute code, or access configuration and log files.

#### Q.2. File Traversal (Path Traversal):
File Traversal allows an attacker to access files outside the intended directory. This vulnerability arises from inadequate input validation, enabling unauthorized access to files in different directories or parts of the file system. Attackers may view sensitive files, modify data, or execute commands based on file system permissions.

#### Q.3. Directory Listing:
Directory Listing, while not a vulnerability itself, occurs when a web server displays a directory's contents without a default file specified. If proper access controls are lacking, sensitive files or directories become exposed, allowing attackers insights into the application's structure and potential vulnerabilities.

### Mitigation Strategies:

1. Local File Inclusion (LFI):
   - Validate and sanitize user input.
   - Use whitelisting to define permitted file paths.
   - Employ secure coding practices to prevent path traversal vulnerabilities.

2. File Traversal (Path Traversal):
   - Apply input validation and filtering to restrict file paths.
   - Utilize path encryption or virtualized file systems.
   - Implement proper access controls to limit directory access.

3. Directory Listing:
   - Disable directory listing on the web server.
   - Ensure default documents are set to prevent directory browsing.
   - Apply strict access controls to limit directory exposure.

These strategies align with OWASP guidelines for mitigating vulnerabilities, emphasizing input validation, secure coding practices, and stringent access controls.

### Q. File Inclusion (LFI) Vulnerabilities - Mitigation Strategies:

1. **Input Validation and Whitelisting:**
   - Implement strong input validation and sanitization to prevent malicious input.
   - Use whitelisting to only allow known-safe characters, patterns, or file names in input.

2. **Secure File Access Mechanisms:**
   - Avoid using user-controlled input directly in file inclusion operations.
   - Utilize secure file access mechanisms provided by the programming language or framework.

3. **Restricted File System Access:**
   - Implement proper file system access controls and permissions.
   - Restrict access to sensitive files and directories by setting appropriate permissions.
   - Apply the principle of least privilege, ensuring that the application has only necessary access rights.

4. **Path Hardening:**
   - Use absolute file paths instead of relative paths whenever possible.
   - Avoid using user-supplied input as part of file paths.
   - Perform input validation and sanitization on any user-controlled input used in file paths.

5. **Secure Configuration:**
   - Review and secure the configuration of the web server and application framework.
   - Disable directory listing to prevent exposure of sensitive file and directory information.

6. **File Extension Validation:**
   - Validate and restrict file extensions to prevent malicious files from being included.
   - Implement a whitelist of allowed file extensions that can be included by the application.

7. **Web Application Firewall (WAF):**
   - Utilize a Web Application Firewall that includes LFI protection features.
   - Configure the WAF to detect and block potential LFI attacks.

8. **Secure Development Practices:**
   - Follow secure coding practices, such as input validation, output encoding, and proper error handling.
   - Conduct secure code reviews and security testing to identify and address LFI vulnerabilities.

### Q. File Traversal - Mitigation Strategies:

1. **Input Validation and Whitelisting:**
   - Implement strong input validation and sanitization to prevent malicious input.
   - Use whitelisting to only allow known-safe characters, patterns, or file names in input.

2. **Secure File Access Mechanisms:**
   - Avoid using user-controlled input directly in file access operations.
   - Utilize secure file access mechanisms provided by the programming language or framework.

3. **Path Normalization and Hardening:**
   - Normalize and sanitize file paths to remove any redundant or unnecessary elements.
   - Convert relative paths to absolute paths before accessing files.
   - Apply strict rules and filters to prevent traversal sequences from being used to bypass directory restrictions.

4. **Secure File System Access Controls:**
   - Implement proper file system access controls and permissions.
   - Restrict access to sensitive files and directories by setting appropriate permissions.

5. **Application-Specific Whitelists:**
   - Maintain application-specific whitelists of allowed files, directories, or paths.
   - Validate and compare user-supplied input against the whitelist to prevent unauthorized file access.

6. **Encrypted and Obfuscated File Names:**
   - Use encryption or obfuscation techniques to obscure file names and prevent predictable file access patterns.
   - Store sensitive files with non-predictable, randomly generated names.

7. **Web Application Firewall (WAF):**
   - Deploy a Web Application Firewall that includes File Traversal protection features.
   - Configure the WAF to detect and block potential File Traversal attacks.
  
8. Secure Development Practices:
   -	Follow secure coding practices, such as input validation, output encoding, and proper error handling.
   -	Conduct secure code reviews and security testing to identify and address LFI vulnerabilities.
  
### Q. File Traversal - Mitigation Strategies:

1. **Input Validation and Whitelisting:**
   - Implement strong input validation and sanitization to prevent malicious input.
   - Use whitelisting to allow known-safe characters, patterns, or file names in input.
   - Validate user-supplied input against predefined allowed values or expected patterns using regular expressions.

2. **Secure File Access Mechanisms:**
   - Avoid using user-controlled input directly in file access operations.
   - Utilize secure file access mechanisms provided by the programming language or framework.
   - Use platform-specific secure file operation methods or APIs, such as canonicalization functions.

3. **Path Normalization and Hardening:**
   - Normalize and sanitize file paths to remove redundant or unnecessary elements (e.g., "./", "../").
   - Convert relative paths to absolute paths before accessing files.
   - Apply strict rules and filters to prevent traversal sequences from bypassing directory restrictions.

4. **Secure File System Access Controls:**
   - Implement proper file system access controls and permissions.
   - Restrict access to sensitive files and directories by setting appropriate permissions.
   - Follow the principle of least privilege, granting necessary access rights only.

5. **Application-Specific Whitelists:**
   - Maintain application-specific whitelists of allowed files, directories, or paths.
   - Validate and compare user-supplied input against the whitelist to prevent unauthorized file access.

6. **Encrypted and Obfuscated File Names:**
   - Use encryption or obfuscation to obscure file names, preventing predictable file access patterns.
   - Store sensitive files with non-predictable, randomly generated names to deter attackers.

7. **Web Application Firewall (WAF):**
   - Deploy a Web Application Firewall with File Traversal protection.
   - Configure the WAF to detect and block potential File Traversal attacks.

8. **Secure Development Practices:**
   - Follow secure coding practices: input validation, output encoding, proper error handling.
   - Conduct secure code reviews and security testing to identify and address File Traversal vulnerabilities.

### Q. Directory Listing - Mitigation Strategies:

1. **Disable Directory Listing:**
   - Ensure directory listing is disabled in the web server configuration.
   - Review server settings and configuration files to confirm directory listing is turned off by default.

2. **Implement Default Documents:**
   - Configure the web server to use default documents (e.g., index.html, index.php) for each directory.
   - Set appropriate default files to prevent revealing directory contents when no file is specified.

3. **Secure File and Directory Permissions:**
   - Set proper file and directory permissions, limiting access to sensitive files and directories.
   - Apply least privilege, granting minimum necessary permissions based on use and access requirements.

4. **Secure Configuration:**
   - Review and secure the web server configuration, ensuring directory listing is disabled.
   - Regularly check configuration files to prevent inadvertent enabling of directory listing.

5. **Web Application Firewall (WAF):**
   - Utilize a WAF with directory listing protection features.
   - Configure the WAF to detect and block attempts to access directories without appropriate default documents or when directory listing is enabled.
  
6. Secure Development Practices:
   - Follow secure coding practices, such as properly validating and sanitizing user input.
   -	Avoid including user-supplied input directly in file paths or URLs without proper validation and encoding.
  
### Q. File Traversal - Mitigation Strategies:

1. **Input Validation and Whitelisting:**
   - Implement strong input validation and sanitization to prevent malicious input.
   - Use whitelisting to allow known-safe characters, patterns, or file names in input.
   - Validate user-supplied input against predefined allowed values or expected patterns using regular expressions.

2. **Secure File Access Mechanisms:**
   - Avoid using user-controlled input directly in file access operations.
   - Utilize secure file access mechanisms provided by the programming language or framework.
   - Use platform-specific secure file operation methods or APIs, such as canonicalization functions.

3. **Path Normalization and Hardening:**
   - Normalize and sanitize file paths to remove redundant or unnecessary elements (e.g., "./", "../").
   - Convert relative paths to absolute paths before accessing files.
   - Apply strict rules and filters to prevent traversal sequences from bypassing directory restrictions.

4. **Secure File System Access Controls:**
   - Implement proper file system access controls and permissions.
   - Restrict access to sensitive files and directories by setting appropriate permissions.
   - Follow the principle of least privilege, granting necessary access rights only.

5. **Application-Specific Whitelists:**
   - Maintain application-specific whitelists of allowed files, directories, or paths.
   - Validate and compare user-supplied input against the whitelist to prevent unauthorized file access.

6. **Encrypted and Obfuscated File Names:**
   - Use encryption or obfuscation to obscure file names, preventing predictable file access patterns.
   - Store sensitive files with non-predictable, randomly generated names to deter attackers.

7. **Web Application Firewall (WAF):**
   - Deploy a Web Application Firewall with File Traversal protection.
   - Configure the WAF to detect and block potential File Traversal attacks.

8. **Secure Development Practices:**
   - Follow secure coding practices: properly validating and sanitizing user input.
   - Avoid including user-supplied input directly in file paths or URLs without proper validation and encoding.

### RFI and SSRF difference.
Remote File Inclusion (RFI) is a vulnerability where an attacker can manipulate a web application to include and execute remote files hosted on external servers. This can lead to the execution of malicious code, unauthorized access to sensitive data, or even full control over the affected system. RFI occurs when the application does not properly validate or sanitize user-supplied input used to include files.

On the other hand, 
Server-Side Request Forgery (SSRF) is a vulnerability where an attacker tricks the server into making unintended requests to other internal or external resources. By manipulating the server's requests, an attacker may gain unauthorized access to internal systems, retrieve sensitive data, or exploit vulnerabilities in other services. SSRF typically occurs when an application allows the attacker to specify the target URL or the protocol for making requests.

RFI allows an attacker to include and execute remote files on the server, while SSRF allows an attacker to manipulate the server's requests and potentially access internal or external resources. Both vulnerabilities can lead to serious security risks if not properly addressed.
 
### Android Obfuscation Techniques?
Answer:
Android obfuscation is the process of making Android apps more difficult to reverse engineer. This is done by renaming classes, methods, and variables, and by obfuscating the code logic.

There are many different Android obfuscation techniques, but some of the most common include:
- Identifier renaming: This is the most basic form of obfuscation. It involves renaming classes, methods, and variables with meaningless names. This makes it more difficult for reverse engineers to understand the code logic.
- String encryption: This technique involves encrypting strings that contain sensitive information, such as API keys or passwords. This makes it more difficult for reverse engineers to extract this information from the app.
- Control flow obfuscation: This technique involves obfuscating the control flow of the code. This makes it more difficult for reverse engineers to understand how the code works.
- Code packing: This technique involves packing the app's code into a format that is difficult to decompile. This makes it more difficult for reverse engineers to access the app's source code.

Android obfuscation can be a valuable security tool. It can make it more difficult for attackers to reverse engineer your app and steal sensitive information. However, it is important to note that obfuscation is not a silver bullet. It can only make it more difficult for attackers to reverse engineer your app, but it cannot make it impossible.

Here are some of the benefits of using Android obfuscation:
- Increased security: Obfuscated apps are more difficult to reverse engineer, which can make it more difficult for attackers to steal sensitive information.
- Reduced size: Obfuscation can reduce the size of your app by removing unused code and resources. This can make your app load faster and use less memory.
- Improved performance: Obfuscation can improve the performance of your app by removing unused code and resources. This can make your app run faster and more efficiently.

Here are some of the drawbacks of using Android obfuscation:
- Can make debugging more difficult: Obfuscated apps can make debugging more difficult. This is because the code is more difficult to understand.
- Can impact app performance: Obfuscation can impact the performance of your app. This is because the code is more complex and takes longer to execute.
- Can be defeated: Obfuscation can be defeated by skilled reverse engineers. However, it can make it more difficult for them to do so.

Overall, Android obfuscation is a valuable security tool that can help to protect your app from reverse engineering. However, it is important to weigh the benefits and drawbacks before deciding whether or not to use it.


### Android WebView exploits
[Answer: Exploiting Android WebView Vulnerabilities](https://redfoxsec.com/blog/exploiting-android-webview-vulnerabilities/)

### Q. What is a WebView?  

The WebView class, which is an extension of the View class in Android, can be used to show a web page as part of your activity layout. It doesn’t have navigation buttons or an address bar, which are two important parts of a web browser. By default, WebView’s only job is to show a web page. 

Android applications use WebViews to load content and HTML pages inside the application. Due to this functionality, the WebView implementation must be secure to prevent potential risk to the application. 

Besides, WebView poses a serious security risk to both the device and the application. While conducting an Android assessment, mobile penetration testers should look at the following techniques and their current conditions to find any potential dangers. 

- setAllowContentAccess 
- setAllowFileAccess 
- setAllowFileAccessFromFileURLs 
- setAllowUniversalAccessFromFileURLs 
- SetJavaScriptEnabled 

The following are the WebView settings that are most commonly exploited by attackers:

- setAllowContentAccess: This setting controls whether the WebView can access content from the internet. If this setting is enabled, an attacker can trick the WebView into loading a malicious file from a remote server.
- setAllowFileAccess: This setting controls whether the WebView can access files on the device. If this setting is enabled, an attacker can trick the WebView into downloading a malicious file to the device.
- setAllowFileAccessFromFileURLs: This setting controls whether the WebView can access files that are hosted on the same domain as the WebView itself. If this setting is enabled, an attacker can trick the WebView into loading a malicious file from a local file.
- setAllowUniversalAccessFromFileURLs: This setting controls whether the WebView can access files from any domain. If this setting is enabled, an attacker can trick the WebView into loading a malicious file from any website.
- SetJavaScriptEnabled: This setting controls whether the WebView can execute JavaScript code. If this setting is enabled, an attacker can inject malicious JavaScript code into the WebView, which can then be executed by the victim's browser.

### Do you know Secure coding?
Answer:
Yes, I do, Secure coding is a set of principles and practices that software developers can follow to write code that is resistant to security vulnerabilities. There are many different secure coding practices, like:

1. **Input validation** is the process of ensuring that user input is valid and does not contain malicious code.
2. **Output encoding** is the process of converting data into a format that is safe to display or transmit.
3. **Authentication and password management** are the processes of verifying the identity of a user and managing their passwords.
4. **Session management** is the process of tracking the state of a user's session and ensuring that they are only able to access resources that they are authorized to access.
5. **Access control** is the process of restricting access to resources based on the user's permissions.
6. **Cryptographic practices** are the principles and practices of using cryptography to protect data.
7. **Error handling and logging** are the processes of handling errors and logging events that can be used to troubleshoot security incidents.
8. **Data protection** is the process of protecting data from unauthorized access, disclosure, modification, or destruction.
9. **Communication security** is the process of securing communication channels to prevent unauthorized interception or modification of data.
10. **System configuration** is the process of configuring systems to be secure.
11. **Database security** is the process of securing databases from unauthorized access, disclosure, modification, or destruction.
12. **File management** is the process of managing files to prevent unauthorized access, disclosure, modification, or destruction.
13. **Memory management** is the process of managing memory to prevent unauthorized access, disclosure, modification, or destruction.

Secure coding is an important part of software development, and following these principles can help to prevent security vulnerabilities.

### Have you ever tried to break encryption? Which tool? How will you get the key?
Answer:
Weak hash/encryption algorithms:

- **Symmetric-key encryption:** DES, RC4, Triple DES, Blowfish, 80/112-bit 2TDEA (two key triple DES)
- **Asymmetric-key encryption:** 1024-bit RSA or DSA, 160-bit ECDSA (elliptic curves)
- **Hashing:** MD5, SHA1, SHA-2, SHA-3

Minimum Key length requirements:

- **Key exchange:** Diffie–Hellman key exchange with a minimum of 2048 bits
- **Message Integrity:** HMAC-SHA2
- **Message Hash:** SHA2 256 bits
- **Asymmetric encryption:** RSA 2048 bits
- **Symmetric-key algorithm:** AES 128 bits
- **Password Hashing:** PBKDF2, Scrypt, Bcrypt
- **ECDH, ECDSA:** 256 bits

### Have you worked on a payment gateway? How was the flow of that?

### How does a payment gateway work?
Answer:
**What is a Payment gateway?**

A payment gateway is an online service that allows businesses and individuals to accept payments from customers through their websites or mobile applications.

It acts as a secure bridge between the customer’s payment method (such as a credit card or digital wallet) and the merchant’s bank account, facilitating the authorization and processing of transactions.

**Types of Payment Gateways**

1. Hosted Payment Gateways
2. Self-Hosted Payment Gateways
3. API Payment Gateways
4. Mobile Payment Gateways
5. Local bank integration

**How does a Payment gateway work?**

A payment gateway works by securely transmitting payment information between a customer, a merchant, and the respective financial institutions involved. Here’s a clear breakdown of how it typically works:

1. **Customer places an order and submits it on the website.**
2. **Website directs the customer to the payment gateway where they enter bank/card details. The payment gateway then redirects to the bank’s authorization page.**
3. **The payment gateway verifies the customer’s account balance.**
4. **The payment gateway informs the merchant based on the bank’s response. If declined, the merchant notifies the customer of card/bank issues. If approved, the merchant requests a transaction from the bank.**
5. **The bank settles payment with the payment gateway, which then settles with the merchant.**

Once this process is completed, the customer gets a confirmation message of the order being placed.

**How does a Payment gateway keep information secure?**

A Payment gateway ensures the security of the information you put in by encrypting the data. Now that you have a pretty good idea of what is a payment gateway and how it works, let us look at a list of things that a PG does to keep your data safe:

- Firstly, the payment gateway transaction flow occurs via an HTTPS web address, ensuring security.
- A hash function is used to validate the transaction request, utilizing a secret word known only to the merchant and payment gateway.
- The IP of the requesting server is verified to detect any potential malicious activity, securing the payment page result.
- Virtual Payer Authentication (VPA) is supported by acquirers, issuers, and payment gateways to enhance security. VPA, part of the 3-D secure protocol, adds an extra layer of authentication for online buyers and sellers.

### How to do threat modelling using a tool

Threat modeling is a process of identifying and mitigating potential security threats to an asset or system. It can be done manually or using a tool.

**Here are the steps on how to do threat modeling using a tool:**

1. **Choose a tool.** There are many different threat modeling tools available, such as the `Microsoft Threat Modeling Tool`, the `OWASP Threat Dragon`, and the `ThreatModeler`. Each tool has its own strengths and weaknesses, so it is important to choose one that is right for your needs.
2. **Define your assets.** The first step in threat modeling is to identify the assets that you need to protect. This could include data, systems, applications, or even people.
3. **Create a threat model.** Once you have identified your assets, you can start creating a threat model. This model will document the threats that could be posed to your assets, as well as the potential impact of those threats.
4. **Identify mitigations.** For each threat, you need to identify mitigations that can be put in place to reduce the risk. Mitigations can include technical controls, such as firewalls and intrusion detection systems, as well as administrative controls, such as user training and password policies.
5. **Validate your threat model.** Once you have created your threat model, you need to validate it to make sure that it is accurate and complete. This can be done by reviewing the model with security experts or by conducting penetration testing.

**Here are some additional tips for threat modeling using a tool:**

- Use a template. Many threat modeling tools come with templates that can help you get started.
- Involve stakeholders. It is important to involve stakeholders in the threat modeling process, such as developers, security engineers, and business owners.
- Keep it up to date. Threat models should be kept up to date as your system or application changes.

### How will you attack 'Inner HTML' and 'Inner Text'?
Answer:

### How will you exploit DOM XSS? 
Answer:

### How will you implement OAuth 2.0? How will you tell the developer?
Answer:

### How you can find CSRF in API
Answer:

### If a UAT web application has self-signed certificate, what attack can you perform?
Answer:

### If the application has implemented proper anti-CSRF token which changes in every request, how will you perform CSRF?
Answer:

### If same-site cookie is set, and HTTP only and Secure flags are set, how will you exploit XSS?
Answer:

### Sihub report explanation-Authentication bypass explain.
Answer:

### What is SSL? How is the data in transit encrypted? Are there any keys involved? What can you do in case of MITM? Can you decrypt?
Answer:

### Difference between prepared statement and stored procedure
**Prepared Statement:**
A prepared statement is a type of SQL statement that is pre-compiled by the database. It helps in performance optimization and prevents SQL injection by using placeholders for parameterized queries.

**Stored Procedure:**
A stored procedure is a set of SQL statements grouped together and stored in a database. It's used for various tasks like data manipulation, calculations, validation, and security enforcement. Stored procedures offer reusability, performance benefits, and centralized security control.

### API Authentication techniques?
Answer:

### Application testing approach
Answer:

### Blind SQL injection
Answer:

### Can you do CSRF without Burp professional?
Answer:

### Difference between SOP, CORS and CSP which one is implemented in the application.
Answer:

### Explain XSS with exploit.
Answer:

### How do you decrypt encryptions?
Answer:

### How does Encryption work and its types?
Answer:

### How to bypass WAF?
Answer:

### How to detect WAF in an application and what are the techniques of WAF bypass?
Answer:

### How to find Cloudflare IP?
Answer:

### How to find which WAF is implemented?
Answer:

### How to perform authentication based on the JWT token
Answer:

### How you exploit clickjacking or phishing
Answer:

### If the application is accepting third-party image which attacks you perform
Answer:

### If the application is behind the reverse proxy, then how you perform no rate limit attack if token is not expiring.
Answer:

### If the application is vulnerable to clickjacking, how will you do phishing.
Answer:

### In API how you perform Authentication Bypass
Answer:

### latest zero-day vulnerability
Answer:

### Log4j
Answer:

### Methodologies of web application security
Answer:

### OAuth is secure or not.
Answer:

### OAuth working and attacks.
Answer:

### SAML working and attacks.
Answer: SAML SSO works by transferring the user’s identity from one place (the identity provider) to another (the service provider). This is done through an exchange of digitally signed XML documents.

Consider the following scenario: A user is logged into a system that acts as an identity provider. The user wants to log in to a remote application, such as a support or accounting application (the service provider). The following happens:
![SAML image](https://developers.onelogin.com/assets/img/pages/saml/sso-diagram.svg)
1. The user accesses the remote application using a link on an intranet, a bookmark, or similar and the application loads.
2. The application identifies the user’s origin (by application subdomain, user IP address, or similar) and redirects the user back to the identity provider, asking for authentication. This is the authentication request.
3. The user either has an existing active browser session with the identity provider or establishes one by logging into the identity provider.
4. The identity provider builds the authentication response in the form of an XML-document containing the user’s username or email address, signs it using an X.509 certificate, and posts this information to the service provider.
5. The service provider, which already knows the identity provider and has a certificate fingerprint, retrieves the authentication response and validates it using the certificate fingerprint.
6. The identity of the user is established and the user is provided with app access.

### Web Application (AppSec) Approach
Answer:
First we need to understand what type of testing is required. It can be a Black Box or Grey Box.

For Grey Box we first take walkthrough from client to understand the application and discuss in scope items.

During the walkthrough from the client, we ask regarding user roles.

If there are multiple users, we request credentials of each user role.

Once we receive all data, we perform a walkthrough from our side to check everything is working fine.

After checking the application, we identify the positive test cases that can be performed.

**Test Cases Include**

1. Authenticated related
2. Unauthenticated related
3. Privilege Related
4. Business Related
5. Session Related
6. Application Infrastructure
7. Input Validation

### What are the authentication techniques?
Answer:
Authentication is the process of verifying the identity of a user or device. There are many different authentication techniques available, each with its own strengths and weaknesses.

Some of the most common authentication techniques include:

- **Passwords**: They are the most common form of authentication but can be easily guessed or cracked.
- **Single-factor authentication (SFA)**: Requires only one factor, typically a password.
- **Two-factor authentication (2FA)**: Requires two factors, usually a password and a one-time code.
- **Multi-factor authentication (MFA)**: Requires more than two factors, such as passwords, one-time codes, biometrics, or hardware tokens.
- **Biometric authentication**: Uses physical characteristics like fingerprints, facial recognition, or voiceprints.
- **Knowledge-based authentication**: Requires users to answer personal questions.
- **Challenge-response authentication**: Requires a user response to a challenge, like a CAPTCHA or a mathematical problem.

The best technique depends on the specific security requirements of an application.

### What is CSRF?
Answer:
CSRF (Cross-Site Request Forgery) is a web security vulnerability that tricks a web browser into executing unwanted actions. It occurs when a website sends a data request to another website on behalf of a user along with the user's session cookie.

CSRF Mitigation Techniques:
1. Using CSRF tokens
2. Double-Submitting Cookies
3. Same-Site Cookies
4. Enabling User Interaction
5. Custom Headers for Requests

### What is different between encryption and encoding?
Answer:

### What are different types of encryptions?
Answer:

### What is Front end Encryption? JS Encryption? How will you decrypt?
Answer:

### What is JWT token and attacks?
Answer:

### What is OAuth?
Answer:
OAuth (Open Authorization) is an open standard for authorization that enables users to grant third-party applications access to their resources without sharing their passwords. It is supported by many popular websites and applications.

OAuth workflow:
1. User visits a website or app requesting access.
2. Redirected to OAuth authorization server.
3. Prompted to grant or deny access.
4. Authorization server issues a token.
5. Website or app uses the token to access user's resources.

### What is PCIDSS?
Answer:

### What is RACE Condition?
Answer:
Race condition attacks (also called Time of Check to Time of Use, or TOCTTOU attacks) take advantage of the need that computing systems must execute some tasks in a specific sequence. In any such sequence, there is a small period of time when the system has carried out the first task but not started on the second.

### What is SAML?
Answer: SAML (Security Assertion Markup Language) is an XML-based open standard for exchanging authentication and authorization data between parties, in particular, between an identity provider and a service provider. It enables single sign-on (SSO) across different domains, allowing a user to access multiple services using a single set of credentials.

### What is SSTI?
Answer: **Server-side template injection** (SSTI) is a type of security vulnerability that can occur in web applications that use template engines. Template engines are used to generate dynamic web pages by combining static templates with user-supplied data. If user-supplied data is not properly sanitized, an attacker can inject malicious code into the template engine, which can then be executed on the server.

### What tool have you used for threat modeling? What standard it follows?
Answer:

### When to use Stride and when to use Dread model?
Answer:
**DREAD** methodology is used to rate, compare and prioritize the severity of risk presented by each threat that is classified using STRIDE.

DREAD Risk = (Damage + Reproducibility + Exploitability + Affected Users + Discoverability) / 5.

Custom mathematical approach to implement DREAD methodology:
- **Damage Potential**: The extent of damage if the threat exploit occurs.
- **Reproducible**: The ease of reproducing the threat exploit.
- **Exploit-ability**: What is needed to exploit this threat.

### Q. Affected Users

How many users will be affected?

    0 = None
    2.5 = Individual/employer that is already compromised.
    6 = Some users of individual or employer privileges, but not all.
    8 = Administrative users
    10 = All users

### Q. Discoverability

How easy is it to discover this threat?

    0 = Very hard, requires source code or administrative access.
    5 = Can be figured out by monitoring and manipulating HTTP requests.
    8 = Details of faults like this are already in the public domain and can be easily discovered using a search engine.
    10 = The information is visible in the web browser address bar or in a form.

DREAD methodology can be customized to cater to the needs of your application. During consultancy engagements, it should be approved by the client before starting the security assessment, so that the results produced by DREAD couldn’t be challenged.

### Which WAF is implemented on billdesk?
Answer:

BIG-IP Local Traffic Manager (F5 Networks)

### You logged into the application, you just changed your name using JWT token and logged out. JWT token expiry is 15 mins, what attack will you perform?
Answer:
If I logged into an application, changed my name using a JWT token, and then logged out, I could perform a JWT token expiry attack. This attack would involve stealing the JWT token before it expires, and then using it to access the application as the victim.
The JWT token would contain the victim's name, as well as other information, such as their expiration time. If I could steal the token before it expired, I could use it to access the application as the victim for up to 15 minutes. This would allow me to do things like change the victim's name, view their private data, or even make unauthorized payments on their behalf.
To prevent this attack, the application should implement a mechanism to revoke JWT tokens after they have expired. This could be done by storing the tokens in a database and then deleting them after they have expired. Alternatively, the application could use a blacklist to keep track of expired tokens.
Here are some additional steps that could be taken to prevent JWT token expiry attacks:
- Use short expiration times for JWT tokens. This will make it more difficult for attackers to steal tokens before they expire.
- Use a strong cryptographic algorithm to sign JWT tokens. This will make it more difficult for attackers to forge tokens.
- Validate the JWT token before it is accepted. This will help to ensure that the token is not tampered with.
- Use a WAF to filter malicious traffic. This will help to prevent attackers from injecting malicious code into the application.
By following these steps, applications can help to protect themselves from JWT token expiry attacks.
