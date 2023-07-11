# Introduction as you’re an experienced application security consultant.

I'll start by introducing myself. I'm working as an Application Security Consultant in Anzen technologies for the past 3 years. With 3 years of experience in Application Security, I've done many security assessments of web applications and mobile applications, and that making me specialized in web and mobile security.
I've handled many projects for various clients of different sectors like e-commerce, health care, finance, telecom etc.
Currently I am working remotely with an e-commerce client handling their web and mobile applications and working on the closure of the reported vulnerabilities.

# What are the top 10 OWASP vulnerabilities?
## What are the risks associated with each vulnerability?
## How can these vulnerabilities be mitigated?
## What tools and techniques can be used to identify and prevent these vulnerabilities?
Answer:
here are the top 10 OWASP vulnerabilities, the risks associated with each vulnerability, how they can be mitigated, and the tools and techniques that can be used to identify and prevent them:
#### 1. Broken Access Control
-	**Risks:** This vulnerability allows attackers to gain unauthorized access to sensitive data or resources.
-	**Mitigation:** Implement proper access control mechanisms, such as role-based access control (RBAC).
-	**Tools and techniques:** Use static analysis tools to scan for access control vulnerabilities.
-	Path Traversal, CSRF, IDOR, Forced Browsing.
#### 2. Cryptographic Failures
-	**Risks:** This vulnerability allows attackers to steal sensitive data, such as passwords or credit card numbers, by decrypting it.
-	**Mitigation:** Use strong cryptographic algorithms and properly implement cryptographic libraries.
-	**Tools and techniques:** Use dynamic analysis tools to scan for cryptographic vulnerabilities.
-	Cleartext Transmission of Sensitive Information, Weak Encoding for Password
#### 3. Injection
-	**Risks:** This vulnerability allows attackers to inject malicious code into an application, which can then be executed by other users.
-	**Mitigation:** Sanitize all user input before it is processed by the application.
-	**Tools and techniques:** Use static analysis tools to scan for injection vulnerabilities.
#### 4. Insecure Design
-	**Risks:** This vulnerability allows attackers to exploit design flaws in an application, such as using hard-coded passwords or not properly validating user input.
-	**Mitigation:** Design applications with security in mind.
-	**Tools and techniques:** Use static analysis tools to scan for insecure design vulnerabilities.
#### 5. Security Misconfiguration
-	**Risks:** This vulnerability allows attackers to exploit misconfigurations in an application's security settings, such as leaving default passwords in place or not properly securing sensitive data.
-	**Mitigation:** Implement and enforce security best practices.
-	**Tools and techniques:** Use dynamic analysis tools to scan for security misconfiguration vulnerabilities.
#### 6. Vulnerable and Outdated Components
-	**Risks:** This vulnerability allows attackers to exploit vulnerabilities in third-party components that are used by an application.
-	**Mitigation:** Keep all components up to date with the latest security patches.
-	**Tools and techniques:** Use static analysis tools to scan for vulnerable components.
#### 7. Identification and Authentication Failures
-	**Risks:** This vulnerability allows attackers to gain unauthorized access to an application by bypassing or abusing the authentication process.
-	**Mitigation:** Implement strong authentication mechanisms, such as multi-factor authentication (MFA).
-	**Tools and techniques:** Use dynamic analysis tools to scan for identification and authentication vulnerabilities.
#### 8. Software and Data Integrity Failures
-	**Risks:** This vulnerability allows attackers to modify or delete sensitive data, such as financial records or medical records.
-	**Mitigation:** Implement data integrity checks to ensure that data is not modified or deleted without authorization.
-	**Tools and techniques:** Use static analysis tools to scan for software and data integrity vulnerabilities.
#### 9. Security Logging and Monitoring Failures
-	**Risks:** This vulnerability allows attackers to evade detection by disabling or tampering with security logs.
-	**Mitigation:** Implement effective security logging and monitoring practices.
-	**Tools and techniques:** Use security information and event management (SIEM) tools to collect and analyze security logs.
#### 10. Server-Side Request Forgery (SSRF)
-	**Risks:** This vulnerability allows attackers to force an application to make unauthorized requests to other servers.
-	**Mitigation:** Implement proper input validation to prevent attackers from injecting malicious requests.
-	**Tools and techniques:** Use static analysis tools to scan for SSRF vulnerabilities.


# Web applications assessment and threat modelling approach:
Sir, for starting an assessment, 
if it is asked to do a grey box testing. 
we first take a positive walkthrough of an application as per developer point of view. This gives us an idea of architecture design or data flow of an application. 
We look for the user roles if any and ask for at least 3 credentials. For each user roles. 
According to the application, we create test cases according to the functionality of an application. Various test cases can be made for an application.
1. Authenticated
2. Unauthenticated
3. Privilege related
4. Server related
5. Session related
6. Business flaw related
7. Payment related

Then we start with the threat modelling of an application, 
Explain whole threat modelling.

_Find the attack scenario regarding the topics below and create test cases with 1 example along with Remediation._

- 1. Authenticated related
- 2. Unauthenticated related
- 3. Privilege related
- 4. Server related
- 5. Session related
- 6. Business related
- 7. Payment related

#### Authenticated Related
-	Deep URL
-	CSRF
-	SQL Injection
-	XSS
-	Clickjacking
-	Captcha Related cases
-	Cookie Management

#### Unauthenticated Related
-	HTTPS/HTTP
-	Login Bypass
-	Password Autocomplete Enabled
-	Server Page Error
-	Application Host
-	HTTP methods
-	XSS
-	CSRF
-	Clickjacking
-	User Enumeration
-	Brute Force
-	User ID not case sensitive
-	Password Related Cases
-	Email Flooding
-	File Upload
-	Response Splitting
-	Sensitive Info URL
-	Weak Password Policy
-	Improper Error Handling
-	IDOR
-	Directory Listing

If any question is asked on threat modelling, make sure to mention STRIDE

### What is STRIDE?
Ans: STRIDE is an acronym for the threat modeling system. It helps in categorizing all cyberattacks into the below techniques:
-	Spoofing = Authentication
-	Tampering = Integrity
-	Repudiation = Non-Repudiation
-	Information disclosure = Confidentiality
-	Denial of service (DoS) = Availability
-	Elevation of privilege = Authorization

For threat modelling practice a tool like **Microsoft threat modelling tool** can be used.

#### Threat Type	Security Control	Mitigation Techniques
##### Spoofing Identity	Authentication	-	Appropriate authentication
-	Protect secret data.
-	Don’t store secrets

##### Tampering with data	Integrity	-	Appropriate authorization
-	Hashes
-	MACs
-	Digital signatures
-	Tamper resistant protocols

##### Repudiation	Non-Repudiation	-	Digital signatures
-	Timestamps
-	Audit trails

##### Information Disclosure	Confidentiality	-	Authorization
-	Privacy-enhanced protocols
-	Encryption
-	Protect secrets.
-	Don’t store secrets

##### Denial of Service	Availability	-	Appropriate authentication
-	Appropriate authorization
-	Filtering
-	Throttling
-	Quality of service

##### Elevation of privilege	Authorization	-	Run with least privilege


The simplest and most basic form of identifying a web server is to look at the Server field in the HTTP response header.
Servers:
-	Apache Web Server: Version 2.4.46
-	IIS Web Server: Version 10.0.17763.1
-	Nginx Web Server: Version 1.19
-	LiteSpeed Web Server: Version 5.4.12
-	Apache Tomcat: Version 10.0.7
-	Node. Js: Version 14.7.1
-	Lighttpd: Version 1.4.59
-	Jigsaw Server
-	Sun Java System Web Server


### Insecure Deserialization.
Insecure Deserialization is a vulnerability which occurs when untrusted data is used to abuse the logic of an application, execute malicious code upon it being deserialized.

**Example:**

A bank website uses object serialization to store a cookie containing user details, password, role, hash etc. 

`a:4:{i:0;i:132;i:1;s:7:"Mallory";i:2;s:4:"user"; i:3;s:32:"b6a8b3bea87fe0e05022f8f3c88bc960";}`

An attacker changes the serialized object to give themselves admin privileges: 

`a:4:{i:0;i:1;i:1;s:5:"Alice";i:2;s:5:"admin"; i:3;s:32:"b6a8b3bea87fe0e05022f8f3c88bc960";}`


### XXE with Example:
Some applications use the XML format to transmit data between the browser and the server. Applications that do this virtually always use a standard library or platform API to process the XML data on the server.
XML and HTML-- XML focus on transfer of data while HTML focus on presentation of data
XML is an extensible markup language used to store and transport data between browser and server. XML parsers are used to process the data, if not properly configured could lead to arbitrary code execution.
Some applications allow users to upload files which are then processed server-side. Some common file formats use XML or contain XML subcomponents. Examples of XML-based formats are office document formats like DOCX and image formats like SVG.
Even if the application expects to receive a format like PNG or JPEG, the image processing library that is being used might support SVG images. Since the SVG format uses XML, an attacker can submit a malicious SVG image and so reach hidden attack surface for XXE vulnerabilities.

### SQL injection example bypassing WAF:
I was working on an ecommerce application where I had to bypass WAF. I had observed that whichever input I was trying had integrity checks but it was bypassing certain queries, so I thought it has WAF installed. I started using payloads through SQL map. To bypass WAF we have a payload called tamper. I wrote different scripts with Tamper payload and finally noticed that SQL injection was present in the cookie. I used SQL map on cookie and retrieved the database. I found user details with their address and numbers.

### What is blind SQL?
Blind SQL (Structured Query Language) injection is a type of SQL Injection attack that asks the database true or false questions and determines the answer based on the applications response.

### What is SSRF?
Server-side request forgery (SSRF) vulnerabilities let an attacker send crafted requests from the back-end server of a vulnerable web application. Criminals usually use SSRF attacks to target internal systems that are behind firewalls and are not accessible from the external network.
Server-Side Request Forgery Example:
I was working on an ecommerce application. I checked for product in stock and observed the URL passing. The URL was to retrieve the stock status and return this to the user. I modified the request to specify a URL local to the server itself. I added localhost/admin which fetched the contents of the /admin URL and returned it back.

### Thick Client:
The thick clients are heavy applications which normally involve the installation of application on the client side (user computer). These applications take up memory and run completely on the computer’s resources. This means that the security of the application is dependent on the local computer.

##### Default Directories
- /usr/share/tomcat{X}
- \inetpub\wwwroot
- /var/www/html
- /usr/local/nginx/conf

### Sans top 25 (Remember at least 5 of them)
•	Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')
•	Improper Input Validation
•	Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')
•	Cross-Site Request Forgery (CSRF)
•	Improper Limitation of a Pathname to a Restricted Directory ('Path Traversal')
•	Improper Authentication
•	Unrestricted Upload of File with Dangerous Type
•	Deserialization of Untrusted Data
•	Improper Privilege Management
•	Improper Certificate Validation


### LFI/File traversal/Directory Listing

Local File Inclusion (LFI) and File Traversal (also known as Path Traversal) are both vulnerabilities that can be exploited in web applications to gain unauthorized access to files on a server. However, they differ in their nature and the way they exploit the application's file handling mechanisms.

#### 1. Local File Inclusion (LFI):
Local File Inclusion occurs when an attacker is able to include (i.e., load or execute) files from the local file system of the server hosting the web application.
The vulnerability typically arises when the application allows user-supplied input to be directly included or referenced in a file path without proper sanitization or validation.
By manipulating the input, an attacker can traverse the file system and include sensitive files that are accessible by the application.
The attacker can view the content of files, such as configuration files, log files, or even execute arbitrary code if the application allows the inclusion of executable files.

#### 2. File Traversal (Path Traversal):
File Traversal, also known as Directory Traversal, refers to an attack technique where an attacker can access files located outside of the intended directory.
The vulnerability arises when the application does not properly validate and sanitize user-supplied input used to construct file paths.
By manipulating the input, an attacker can traverse directories and access files located in other directories or even on different parts of the file system.
The attacker can potentially view sensitive files, modify files, or execute arbitrary commands depending on the application's permissions and the files accessible.

#### 3. Directory Listing:
Directory Listing is not a vulnerability itself, but rather a feature or misconfiguration of a web server that allows the server to display the contents of a directory when there is no default file specified.
When directory listing is enabled and proper access controls are not in place, it can expose the directory's contents, including sensitive files or directories that were not intended to be publicly accessible.
If an attacker identifies a directory with directory listing enabled, they can easily navigate through the files and gain insights into the application's structure and potentially find vulnerabilities or sensitive information.

_In summary, Local File Inclusion (LFI) and File Traversal (Path Traversal) are both file-based vulnerabilities that allow unauthorized access to files. LFI._

### Mitigation for the 3 different vulnerabilities:
Make sure to answer all the mitigation questions with regards to OWASP:

#### File Inclusion (LFI) vulnerabilities.

1. Input Validation and Whitelisting:
-	Implement strong input validation and sanitization to prevent malicious input.
-	Use whitelisting to only allow known-safe characters, patterns, or file names in input.

2. Secure File Access Mechanisms:
-	Avoid using user-controlled input directly in file inclusion operations.
-	Instead, use secure file access mechanisms provided by the programming language or framework.

3. Restricted File System Access:
-	Implement proper file system access controls and permissions.
-	Restrict access to sensitive files and directories by setting appropriate permissions.
-	Apply the principle of least privilege, ensuring that the application has only the necessary access rights.

4. Path Hardening:
-	Use absolute file paths instead of relative paths whenever possible.
-	Avoid using user-supplied input as part of file paths.
-	Perform input validation and sanitization on any user-controlled input used in file paths.

5. Secure Configuration:
-	Review and secure the configuration of the web server and application framework.
-	Disable directory listing to prevent exposure of sensitive file and directory information.

6. File Extension Validation:
-	Validate and restrict file extensions to prevent malicious files from being included.
-	Implement a whitelist of allowed file extensions that can be included by the application.

7. Web Application Firewall (WAF):
-	Utilize a Web Application Firewall that includes LFI protection features.
-	Configure the WAF to detect and block potential LFI attacks.

8. Secure Development Practices:
-	Follow secure coding practices, such as input validation, output encoding, and proper error handling.
-	Conduct secure code reviews and security testing to identify and address LFI vulnerabilities.


#### For file traversal the following mitigations have to be followed:

1. Input Validation and Whitelisting:
-	Implement strong input validation and sanitization to prevent malicious input.
-	Use whitelisting to only allow known-safe characters, patterns, or file names in input.
-	Validate user-supplied input against a predefined set of allowed values or use regular expressions to ensure input adheres to expected patterns.

2. Secure File Access Mechanisms:
-	Avoid using user-controlled input directly in file access operations.
-	Utilize secure file access mechanisms provided by the programming language or framework.
-	Use platform-specific methods or APIs that handle file operations securely, such as canonicalization functions.

3. Path Normalization and Hardening:
-	Normalize and sanitize file paths to remove any redundant or unnecessary elements (e.g., "./", "../").
-	Convert relative paths to absolute paths before accessing files.
-	Apply strict rules and filters to prevent traversal sequences (e.g., "../", "%2e%2e/") from being used to bypass directory restrictions.

4. Secure File System Access Controls:
-	Implement proper file system access controls and permissions.
-	Restrict access to sensitive files and directories by setting appropriate permissions.
-	Apply the principle of least privilege, ensuring that the application has only the necessary access rights.

5. Application-Specific Whitelists:
-	Maintain application-specific whitelists of allowed files, directories, or paths.
-	Validate and compare user-supplied input against the whitelist to prevent unauthorized file access.

6. Encrypted and Obfuscated File Names:
-	Use encryption or obfuscation techniques to obscure file names and prevent predictable file access patterns.
-	Store sensitive files with non-predictable, randomly generated names that are difficult for an attacker to guess.

7. Web Application Firewall (WAF):
-	Deploy a Web Application Firewall that includes File Traversal protection features.
-	Configure the WAF to detect and block potential File Traversal attacks.

8. Secure Development Practices:
-	Follow secure coding practices, such as input validation, output encoding, and proper error handling.
-	Conduct secure code reviews and security testing to identify and address File Traversal vulnerabilities.


#### For directory listing mitigations:

1. Disable Directory Listing:
-	Ensure that directory listing is disabled on the web server configuration.
-	Check the server settings and configuration files to make sure that directory listing is turned off by default.
-	This prevents the server from displaying the contents of a directory when there is no default file specified.

2. Implement Default Documents:
-	Configure the web server to use default documents (e.g., index.html, index.php) for each directory.
-	Set up appropriate default files that are displayed when a user accesses a directory without specifying a file name.
-	This helps to prevent the server from revealing the directory contents to users.

3. Secure File and Directory Permissions:
-	Set appropriate file and directory permissions to restrict access to sensitive files and directories.
-	Ensure that files and directories have the minimum necessary permissions based on their intended use and access requirements.
-	Apply the principle of least privilege, allowing only the necessary permissions for files and directories.

4. Secure Configuration:
-	Review and secure the configuration of the web server, ensuring that directory listing is disabled.
-	Regularly check the web server configuration files to ensure that they have not been modified or inadvertently enabled directory listing.

5. Web Application Firewall (WAF):
-	Utilize a Web Application Firewall that includes directory listing protection features.
-	Configure the WAF to detect and block attempts to access directories without appropriate default documents or when directory listing is enabled.

6. Secure Development Practices:
-	Follow secure coding practices, such as properly validating and sanitizing user input.
-	Avoid including user-supplied input directly in file paths or URLs without proper validation and encoding.


### RFI and SSRF difference.
Remote File Inclusion (RFI) is a vulnerability where an attacker can manipulate a web application to include and execute remote files hosted on external servers. This can lead to the execution of malicious code, unauthorized access to sensitive data, or even full control over the affected system. RFI occurs when the application does not properly validate or sanitize user-supplied input used to include files.

On the other hand, 
Server-Side Request Forgery (SSRF) is a vulnerability where an attacker tricks the server into making unintended requests to other internal or external resources. By manipulating the server's requests, an attacker may gain unauthorized access to internal systems, retrieve sensitive data, or exploit vulnerabilities in other services. SSRF typically occurs when an application allows the attacker to specify the target URL or the protocol for making requests.

RFI allows an attacker to include and execute remote files on the server, while SSRF allows an attacker to manipulate the server's requests and potentially access internal or external resources. Both vulnerabilities can lead to serious security risks if not properly addressed.
 
### Android Obfuscation Techniques?
Answer:
Android obfuscation is the process of making Android apps more difficult to reverse engineer. This is done by renaming classes, methods, and variables, and by obfuscating the code logic.

There are many different Android obfuscation techniques, but some of the most common include:
-	Identifier renaming: This is the most basic form of obfuscation. It involves renaming classes, methods, and variables with meaningless names. This makes it more difficult for reverse engineers to understand the code logic.
-	String encryption: This technique involves encrypting strings that contain sensitive information, such as API keys or passwords. This makes it more difficult for reverse engineers to extract this information from the app.
-	Control flow obfuscation: This technique involves obfuscating the control flow of the code. This makes it more difficult for reverse engineers to understand how the code works.
-	Code packing: This technique involves packing the app's code into a format that is difficult to decompile. This makes it more difficult for reverse engineers to access the app's source code.

Android obfuscation can be a valuable security tool. It can make it more difficult for attackers to reverse engineer your app and steal sensitive information. However, it is important to note that obfuscation is not a silver bullet. It can only make it more difficult for attackers to reverse engineer your app, but it cannot make it impossible.

Here are some of the benefits of using Android obfuscation:
-	Increased security: Obfuscated apps are more difficult to reverse engineer, which can make it more difficult for attackers to steal sensitive information.
-	Reduced size: Obfuscation can reduce the size of your app by removing unused code and resources. This can make your app load faster and use less memory.
-	Improved performance: Obfuscation can improve the performance of your app by removing unused code and resources. This can make your app run faster and more efficiently.

Here are some of the drawbacks of using Android obfuscation:
-	Can make debugging more difficult: Obfuscated apps can make debugging more difficult. This is because the code is more difficult to understand.
-	Can impact app performance: Obfuscation can impact the performance of your app. This is because the code is more complex and takes longer to execute.
-	Can be defeated: Obfuscation can be defeated by skilled reverse engineers. However, it can make it more difficult for them to do so.
Overall, Android obfuscation is a valuable security tool that can help to protect your app from reverse engineering. However, it is important to weigh the benefits and drawbacks before deciding whether or not to use it.

### Android WebView exploits
Answer:

### Do you know Secure coding?
Answer:
Yes, I do, Secure coding is a set of principles and practices that software developers can follow to write code that is resistant to security vulnerabilities. There are many different secure coding practices, like:

- 1. **Input validation** is the process of ensuring that user input is valid and does not contain malicious code.
- 2. **Output encoding** is the process of converting data into a format that is safe to display or transmit.
- 3. **Authentication and password management** are the processes of verifying the identity of a user and managing their passwords.
- 4. **Session management** is the process of tracking the state of a user's session and ensuring that they are only able to access resources that they are authorized to access.
- 5. **Access control** is the process of restricting access to resources based on the user's permissions.
- 6. **Cryptographic practices** are the principles and practices of using cryptography to protect data.
- 7. **Error handling and logging** are the processes of handling errors and logging events that can be used to troubleshoot security incidents.
- 8. **Data protection** is the process of protecting data from unauthorized access, disclosure, modification, or destruction.
- 9. **Communication security** is the process of securing communication channels to prevent unauthorized interception or modification of data.
- 10. **System configuration** is the process of configuring systems to be secure.
- 11. **Database security** is the process of securing databases from unauthorized access, disclosure, modification, or destruction.
- 12. **File management** is the process of managing files to prevent unauthorized access, disclosure, modification, or destruction.
- 13. **Memory management** is the process of managing memory to prevent unauthorized access, disclosure, modification, or destruction.

Secure coding is an important part of software development, and following these principles can help to prevent security vulnerabilities.

### Have you ever tried to break encryption? Which tool? How will you get key?
Answer:
Weak hash/encryption algorithms:
```
Symmetric-key encryption: DES, RC4, Triple DES, Blowfish, 80/112-bit 2TDEA (two key triple DES)
Asymmetric-key encryption: 1024-bit RSA or DSA, 160-bit ECDSA (elliptic curves)
Hashing: MD5, SHA1, SHA-2 , SHA-3
```

Minimum Key length requirements:
```
  Key exchange: Diffie–Hellman key exchange with minimum 2048 bits
  Message Integrity: HMAC-SHA2
  Message Hash: SHA2 256 bits
  Asymmetric encryption: RSA 2048 bits
  Symmetric-key algorithm: AES 128 bits
  Password Hashing: PBKDF2, Scrypt, Bcrypt
  ECDH, ECDSA: 256 bits
```

### Have you worked on payment gateway? How was the flow of that?
Answer:

### How to do threat modelling using tool
Answer:

### How will you attack 'Inner HTML' and 'Inner Text'?
Answer:

### How will you exploit DOM XSS? 
Answer:

### How will you implement OAUTH 2.0? How will you tell the developer?
Answer:

### How you can find CSRF in API
Answer:

### If a UAT web application has self-signed certificate, what attack can you perform?
Answer:

### If application has implemented proper anti CSRF token which changes in every request, how will you perform CSRF?
Answer:

### If same site cookie is set, and, HTTP only and Secure flags are set, how will you exploit XSS?
Answer:

### Sihub report explanation-Authentication bypass explain.
Answer:

### What is SSL? How is the data in transit encrypted? Are there any keys involved? What can you do in case of MITM? Can you decrypt?
Answer:

### Difference between prepared statement and stored procedure
Answer:

### API Authentication techniques?
Answer:

### Application testing approach
Answer:

### Blind SQL injection
Answer:

### Can you do CSRF without Burp professional.
Answer:

### Difference between SOP, CORS and CSP which one is implement in application.
Answer:

### Explain XSS with exploit.
Answer:

### How do you decrypt encryptions 
Answer:

### How does a payment gateway work?
Answer:

### How does Encryption work and its types?
Answer:

### How payment gateway works
Answer:

### How to bypass WAF
Answer:

### How to detect WAF in application and what are the techniques of WAF bypass
Answer:

### How to find Cloudflare IP
Answer:

### How to find which WAF is implemented. 
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
Answer:

### Web Application (AppSec) Approach
Answer:

### What are the authentication techniques?
Answer:

### What is CSRF? 
Answer:

### ### What is different between encryption and encoding?
Answer:

### What are different types of encryptions?
Answer:

### What is Front end Encryption? JS Encryption? How will you decrypt?
Answer:

### What is JWT token and attacks?
Answer:

### What is OAuth?
Answer:

### What is PCIDSS?
Answer:

### What is RACE Condition?
Answer:
Race condition attacks (also called Time of Check to Time of Use, or TOCTTOU attacks) take advantage of the need that computing systems must execute some tasks in a specific sequence. In any such sequence, there is a small period of time when the system has carried out the first task but not started on the second.

### What is SAML?
Answer:

### What is SSTI?
Answer:

### What tool have you used for threat modelling? What standard it follows? 
Answer:

### When to use Stride and when to use Dread model?
Answer:

### Which WAF is implemented on billdesk?
Answer:

### You logged into the application, you just changed your name using JWT token and logged out. JWT token expiry is 15 mins, what attack will you perform?
Answer:
If I logged into an application, changed my name using a JWT token, and then logged out, I could perform a JWT token expiry attack. This attack would involve stealing the JWT token before it expires, and then using it to access the application as the victim.
The JWT token would contain the victim's name, as well as other information, such as their expiration time. If I could steal the token before it expired, I could use it to access the application as the victim for up to 15 minutes. This would allow me to do things like change the victim's name, view their private data, or even make unauthorized payments on their behalf.
To prevent this attack, the application should implement a mechanism to revoke JWT tokens after they have expired. This could be done by storing the tokens in a database and then deleting them after they have expired. Alternatively, the application could use a blacklist to keep track of expired tokens.
Here are some additional steps that could be taken to prevent JWT token expiry attacks:
•	Use short expiration times for JWT tokens. This will make it more difficult for attackers to steal tokens before they expire.
•	Use a strong cryptographic algorithm to sign JWT tokens. This will make it more difficult for attackers to forge tokens.
•	Validate the JWT token before it is accepted. This will help to ensure that the token is not tampered with.
•	Use a WAF to filter malicious traffic. This will help to prevent attackers from injecting malicious code into the application.
By following these steps, applications can help to protect themselves from JWT token expiry attacks.

