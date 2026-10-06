# Offensive Security Core Competencies & Interview Reference

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

8. What happens if unsafe-inline, default-src is implemented in **Content-Security-Policy** Header?
9. Explain SOP (Same Origin Policy). Why is it used ?
10. Explain the difference between Same Origin Policy and CORS.
11. If a Domain A for example (facebook.com) wants to access the resources from Domain B for example (pinterest.com) using SOP, will it be possible ?
12. How will Domain A facebook.com access the resources of Domain B pinterest.com using CORS method ?
13. If in an application, let’s say evil.com has an Origin Header set to evil.com and Access-Control-Allow-Credentials is set to true, what will happen ?
14. Explain the difference between HTTPOnly and CSP.
15. What are the different types of Security Headers ? Explain its purpose.
16. Your application must support CORS for hundreds of vendor domains. You cannot use `*` and you also don’t want to manually whitelist every new vendor domain in the configuration each time. How would you design a scalable and secure CORS architecture to handle this ?

---

## 3. Authentication, Session Management & Access Control

9. Explain the difference between Authorization and Authentication?
10. Suppose JWT token is implemented, what are the recommendation you will suggest making sure the JWT is secure.
11. List down different types of attacks on MFAs.
12. Explain the difference between Session Fixation and Session Hijacking?
13. Explain cookie-based application and cookie-less application. If the application uses cookie less application where are the information stored or handled when the user logs in till he logs out.
14. Is it possible to perform CSRF Attack on Login Page? If yes, how ?
15. Suppose JWT Token is leaked. How do you prevent the token from being used ?

---

## 4. Active Directory & Identity Security

35. What is Golden Ticket, Silver Ticket, Diamond Ticket and Sapphire Ticket Attack?
36. What is Delegations?
37. What are the different types of delegations?
38. Explain ACL, DACL and SACL
39. What all different types of attacks you can try in the internal AD environment ?
40. What are the pre-requisites for Golden Ticket ?
41. What are the pre-requisites for Silver Ticket ?
42. Which version of SMB(v1 or v2) should be disabled for NTLM v2 Relay Attack ?
43. What is Kerberos and Explain Kerberoasting ?
44. Can you access CIFS using MACHINE TGT on that particular machine ?
45. Explain AES REP Roasting.
46. What are the stealthy way to enumerate Local Admin on any target machine ?
47. What will you do if the user Kerberos Account are GMSA ?
48. Are Group Managed Service Account (GMSA) crackable ? If yes, how can we attack GMSA ?
49. Explain Constrained Delegation.
50. What is Resource based Constrained Delegation ?
51. How do you perform enumeration on the AD. Explain the methodology, LDAP Queries and LDAP Tools that you will use ?
52. Lets say you have a hash and that hash is common in all the servers. Whose hash is that ?

---

## 5. Network, Protocols & Infrastructure Security

20. If any application is using weak ciphers, how will you check what are the ciphers being used?
21. Suppose weak ciphers are detected, is it to be mitigated on application’s end or server’s end?
22. What is QUIC Protocol? Why is it used?
23. Have you ever deployed Reverse Proxy ? If yes, why and explain the process?
24. Have you ever performed EDR Evasion. If yes, explain.
25. How do you perform a phishing exercise?
26. Have you ever performed NAC Bypass? If yes, how ?
27. What are the parameters you can do for NAC Bypass ?
28. If you have port 21 and 22 open, what would you do ?
29. Explain Local RPC and Remote RPC.
30. Suppose you are in the guest lobby and you connect yourself in the guest lobby and there are no NAC implemented or in place. How will you attack the network ?
31. Suppose you connect your laptop in LAN and there is no NAC implemented but still the IP is not assigned to the laptop, what might be the reason ?
32. How do you pentest an internal network ?
33. What is TTL ?
34. How do you perform Infra PT ?
35. What will you do if you find a printer in an internal network ?
36. What is BGP Hijacking Attack and how will you mitigate it?
37. Attackers are using 1000 different IP Addresses to bypass Rate Limiting. How do you stop it ?

---

## 6. Mobile Application Security

66. Have you perform mobile security assessment ? If yes, how you perform testing ? Tools used, etc. Explain in detail.
67. During the mobile security assessment, you will have to look at the code part as well, how will you look into it ?
68. Suppose you have been given a mobile security assessment, what are the vulnerabilities that you look into ?
69. How to bypass SSL Pinning ?
70. A mobile application doesn’t have SSL Pinning implemented and still you are not able to intercept the traffic. What might be the reason behind it ?
71. What is SSL Pinning ? How do you bypass it ?

---

## 7. Thick Client Application Security

74. Suppose you have been given a thick client application. How will you look for dll hijacking steps ?
75. How to perform Static Testing on Thick Client Applications ?
76. If two executables are getting executed from a single path, how will you ensure confidentiality of these programs ?
77. How do you intercept thick client traffic in BurpSuite ?
78. What if the thick client supports only TLS traffic, how will performing the testing ?

---

## 8. Wireless Security

38. Difference between WPA2 and WPA3.
39. Have you performed Wi-Fi Pentesting ? If yes,  what are the tools used in Wi-Fi Pentesting ?
40. What are the different types of WPA2 Enterprise EACL encryption attacks ?

---

## 9. Functional & Business Logic Test Cases

14. What are the different types of test cases you will conduct on Forgot Password functionality?
15. Suppose you are given an application which has a login panel, what are the test cases you will perform?
16. While testing an application, you encounter the payment functionality, what are the test cases you will be conducting on that functionality?
17. Suppose a web application has OTP implemented, what are the test cases that you will conduct on it? with recommendation.
18. Suppose an application has an upload functionality implemented, what are the test cases that you will perform on it ?

---

## 10. Secure Architecture, API & Data Protection

16. How do you ensure the API used by the internal application is secure?
17. Suppose you are registering some sensitive data of the customer, then the data gets stored in the backend i.e. database. What are the recommendations you will give so that the data is secure in the database?
18. How will you make sure that there is cleartext Storage in File or Disk (CWE-313) ?

---

## 11. Pentesting Methodology, Governance & Experience-Based Questions

12. Suppose you have been given an application and you have been told to test the application based on BlackBox assessment, what will be your approach?
13. Suppose you have been told to conduct the GreyBox assessment, what are the pre-requisites you will ask the application team before conducting the assessment.
14. If you want to rate yourself out of 5 based on your experience how much will you rate?
  - a. Web AppSec
  - b. API Testing
  - c. Mobile Testing
15. Have you performed Source Code Review? If yes, which technology have worked with?(Checkmarx, Fortify) How do you make sure the findings are true positives or false positives?
16. Will post login functionality be considered in-scope while conducting BlackBox Testing?
17. How many web applications have you tested so far and what are the critical vulnerabilities you have reported till date. Among all these vulnerabilities, what were your favorite vulnerabilities that you have reported?
18. Suppose you reported a vulnerability, and now the developer or the application team is refusing to fix the vulnerability, how do you make sure the risk is mitigated? Have you encountered the same issue in your current engagement or role?
19. What is the closure timeline that you follow for the criticality of the vulnerabilities you reported? ex: [**Critical, High, Medium, Low, Info**]
20. How you make sure you keep yourself updated with the latest attacks, attack techniques?
21. How do you proceed with the BlackBox testing ?
22. During your testing career, did you find any RCE via File Upload Functionality ? If yes, explain in detail the steps and how you managed to gain the reverse shell.
23. Explain any critical vulnerability found so far. In detail.
24. Any interesting vulnerabilities reported during the mobile security assessment ?
