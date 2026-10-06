<img width="1856" height="576" alt="bg_logo" src="https://github.com/user-attachments/assets/547801e7-0ca5-4b0a-87c6-eb6093bd3e0a" />

# Offensive Security Core Competencies & Interview Reference

## Table of Contents

1. [Web Application Security & Vulnerabilities (#1 – #20)](#1-web-application-security--vulnerabilities)
2. [Browser Security, Same-Origin Policy & Security Headers (#21 – #29)](#2-browser-security-same-origin-policy--security-headers)
3. [Authentication, Session Management & Access Control (#30 – #36)](#3-authentication-session-management--access-control)
4. [Active Directory & Identity Security (#37 – #54)](#4-active-directory--identity-security)
5. [Network, Protocols & Infrastructure Security (#55 – #72)](#5-network-protocols--infrastructure-security)
6. [Mobile Application Security (#73 – #78)](#6-mobile-application-security)
7. [Thick Client Application Security (#79 – #83)](#7-thick-client-application-security)
8. [Wireless Security (#84 – #86)](#8-wireless-security)
9. [Functional & Business Logic Test Cases (#87 – #91)](#9-functional--business-logic-test-cases)
10. [Secure Architecture, API & Data Protection (#92 – #94)](#10-secure-architecture-api--data-protection)
11. [Pentesting Methodology, Governance & Experience-Based Questions (#95 – #107)](#11-pentesting-methodology-governance--experience-based-questions)

---

## 1. Web Application Security & Vulnerabilities

1. What is CSRF Attack? How to exploit it?
2. What is the mitigation of CSRF Attack?
3. Different types of XSS Attacks. How an attacker uses XSS attack to steal the credentials or cookies of the users. What is the mitigation of XSS?
4. Explain the difference between IDOR and Privilege Escalation.
5. What are the different types of Privilege Escalation? How to exploit it? And its mitigation?
6. Suppose you are able to only view the details of any user just by changing the values, what type of attack is this? And what is the mitigation of that attack.
7. In order to patch or fix Clickjacking vulnerability what are the recommendation you will provide to the application or developer team.
8. What is Tabnabbing Attack?
9. What is Reverse Tabnabbing Attack?
10. Explain LFI, RFI and Path Traversal Attack.
11. Types of HTTP Request Smuggling that you can perform?
12. Explain HHI or Host Header Injection with a scenario.
13. Can you explain what is HTTP Request Smuggling Attack ? How is it exploited ? What are the different test cases that you will perform for CL:TE (Content Length : Transfer Encoding).
14. What are the different types of SQL Injection Attacks ? What is OOB SQL Injection (Explain in details).
15. What is XXE Attack ?
16. What is XPath Injection ?
17. Explain Hibernate in SQL Injection.
18. Explain Improper Neutralization of Data within XQuery Expression.
19. Explain Expression Language Injection.
20. Explain Server Side Includes.

---

## 2. Browser Security, Same-Origin Policy & Security Headers

21. What happens if unsafe-inline, default-src is implemented in **Content-Security-Policy** Header?
22. Explain SOP (Same Origin Policy). Why is it used ?
23. Explain the difference between Same Origin Policy and CORS.
24. If a Domain A for example (facebook.com) wants to access the resources from Domain B for example (pinterest.com) using SOP, will it be possible ?
25. How will Domain A facebook.com access the resources of Domain B pinterest.com using CORS method ?
26. If in an application, let’s say evil.com has an Origin Header set to evil.com and Access-Control-Allow-Credentials is set to true, what will happen ?
27. Explain the difference between HTTPOnly and CSP.
28. What are the different types of Security Headers ? Explain its purpose.
29. Your application must support CORS for hundreds of vendor domains. You cannot use `*` and you also don’t want to manually whitelist every new vendor domain in the configuration each time. How would you design a scalable and secure CORS architecture to handle this ?

---

## 3. Authentication, Session Management & Access Control

30. Explain the difference between Authorization and Authentication?
31. Suppose JWT token is implemented, what are the recommendation you will suggest making sure the JWT is secure.
32. List down different types of attacks on MFAs.
33. Explain the difference between Session Fixation and Session Hijacking?
34. Explain cookie-based application and cookie-less application. If the application uses cookie less application where are the information stored or handled when the user logs in till he logs out.
35. Is it possible to perform CSRF Attack on Login Page? If yes, how ?
36. Suppose JWT Token is leaked. How do you prevent the token from being used ?

---

## 4. Active Directory & Identity Security

37. What is Golden Ticket, Silver Ticket, Diamond Ticket and Sapphire Ticket Attack?
38. What is Delegations?
39. What are the different types of delegations?
40. Explain ACL, DACL and SACL
41. What all different types of attacks you can try in the internal AD environment ?
42. What are the pre-requisites for Golden Ticket ?
43. What are the pre-requisites for Silver Ticket ?
44. Which version of SMB(v1 or v2) should be disabled for NTLM v2 Relay Attack ?
45. What is Kerberos and Explain Kerberoasting ?
46. Can you access CIFS using MACHINE TGT on that particular machine ?
47. Explain AES REP Roasting.
48. What are the stealthy way to enumerate Local Admin on any target machine ?
49. What will you do if the user Kerberos Account are GMSA ?
50. Are Group Managed Service Account (GMSA) crackable ? If yes, how can we attack GMSA ?
51. Explain Constrained Delegation.
52. What is Resource based Constrained Delegation ?
53. How do you perform enumeration on the AD. Explain the methodology, LDAP Queries and LDAP Tools that you will use ?
54. Lets say you have a hash and that hash is common in all the servers. Whose hash is that ?

---

## 5. Network, Protocols & Infrastructure Security

55. If any application is using weak ciphers, how will you check what are the ciphers being used?
56. Suppose weak ciphers are detected, is it to be mitigated on application’s end or server’s end?
57. What is QUIC Protocol? Why is it used?
58. Have you ever deployed Reverse Proxy ? If yes, why and explain the process?
59. Have you ever performed EDR Evasion. If yes, explain.
60. How do you perform a phishing exercise?
61. Have you ever performed NAC Bypass? If yes, how ?
62. What are the parameters you can do for NAC Bypass ?
63. If you have port 21 and 22 open, what would you do ?
64. Explain Local RPC and Remote RPC.
65. Suppose you are in the guest lobby and you connect yourself in the guest lobby and there are no NAC implemented or in place. How will you attack the network ?
66. Suppose you connect your laptop in LAN and there is no NAC implemented but still the IP is not assigned to the laptop, what might be the reason ?
67. How do you pentest an internal network ?
68. What is TTL ?
69. How do you perform Infra PT ?
70. What will you do if you find a printer in an internal network ?
71. What is BGP Hijacking Attack and how will you mitigate it?
72. Attackers are using 1000 different IP Addresses to bypass Rate Limiting. How do you stop it ?

---

## 6. Mobile Application Security

73. Have you perform mobile security assessment ? If yes, how you perform testing ? Tools used, etc. Explain in detail.
74. During the mobile security assessment, you will have to look at the code part as well, how will you look into it ?
75. Suppose you have been given a mobile security assessment, what are the vulnerabilities that you look into ?
76. How to bypass SSL Pinning ?
77. A mobile application doesn’t have SSL Pinning implemented and still you are not able to intercept the traffic. What might be the reason behind it ?
78. What is SSL Pinning ? How do you bypass it ?

---

## 7. Thick Client Application Security

79. Suppose you have been given a thick client application. How will you look for dll hijacking steps ?
80. How to perform Static Testing on Thick Client Applications ?
81. If two executables are getting executed from a single path, how will you ensure confidentiality of these programs ?
82. How do you intercept thick client traffic in BurpSuite ?
83. What if the thick client supports only TLS traffic, how will performing the testing ?

---

## 8. Wireless Security

84. Difference between WPA2 and WPA3.
85. Have you performed Wi-Fi Pentesting ? If yes,  what are the tools used in Wi-Fi Pentesting ?
86. What are the different types of WPA2 Enterprise EACL encryption attacks ?

---

## 9. Functional & Business Logic Test Cases

87. What are the different types of test cases you will conduct on Forgot Password functionality?
88. Suppose you are given an application which has a login panel, what are the test cases you will perform?
89. While testing an application, you encounter the payment functionality, what are the test cases you will be conducting on that functionality?
90. Suppose a web application has OTP implemented, what are the test cases that you will conduct on it? with recommendation.
91. Suppose an application has an upload functionality implemented, what are the test cases that you will perform on it ?

---

## 10. Secure Architecture, API & Data Protection

92. How do you ensure the API used by the internal application is secure?
93. Suppose you are registering some sensitive data of the customer, then the data gets stored in the backend i.e. database. What are the recommendations you will give so that the data is secure in the database?
94. How will you make sure that there is cleartext Storage in File or Disk (CWE-313) ?

---

## 11. Pentesting Methodology, Governance & Experience-Based Questions

95. Suppose you have been given an application and you have been told to test the application based on BlackBox assessment, what will be your approach?
96. Suppose you have been told to conduct the GreyBox assessment, what are the pre-requisites you will ask the application team before conducting the assessment.
97. If you want to rate yourself out of 5 based on your experience how much will you rate?
* a. Web AppSec
* b. API Testing
* c. Mobile Testing
98. Have you performed Source Code Review? If yes, which technology have worked with?(Checkmarx, Fortify) How do you make sure the findings are true positives or false positives?
99. Will post login functionality be considered in-scope while conducting BlackBox Testing?
100. How many web applications have you tested so far and what are the critical vulnerabilities you have reported till date. Among all these vulnerabilities, what were your favorite vulnerabilities that you have reported?
101. Suppose you reported a vulnerability, and now the developer or the application team is refusing to fix the vulnerability, how do you make sure the risk is mitigated? Have you encountered the same issue in your current engagement or role?
102. What is the closure timeline that you follow for the criticality of the vulnerabilities you reported? ex: [**Critical, High, Medium, Low, Info**]
103. How you make sure you keep yourself updated with the latest attacks, attack techniques?
104. How do you proceed with the BlackBox testing ?
105. During your testing career, did you find any RCE via File Upload Functionality ? If yes, explain in detail the steps and how you managed to gain the reverse shell.
106. Explain any critical vulnerability found so far. In detail.
107. Any interesting vulnerabilities reported during the mobile security assessment ?
