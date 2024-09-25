# API Checklist

### API1:2019 Broken Object Level Authorization 		
1.	Application is vulnerable to Directory Traversal Attack	
1.	Insecure Direct Object References	
1.	Insecure Deserialization	
		
### API2:2019 Broken User Authentication		
1.	Broken Authentication 	
1.	Improper Token Management	
1.	Valid user's details can be enumerated	
1.	Valid account can be brute forced	
1.	Application does not have a strong password policy	
1.	NTLM Authentication is used in the Application	
1.	Weak OTP/PIN implementation	
1.	Secure attribute is not set in	
1.	Abuse of Send-Mail Functionality	
		
### API3:2019 Excessive Data Exposure		
1.	Sensitive Information Sent Over Unencrypted Channel	
1.	Internal IP Disclosure	
1.	Parameter Enumeration through error message	
1.	Programming language and version disclosure 	
1.	Application's Request/Response reveals sensitive information	
1.	Error message reveals sensitive information	
		
### API4:2019 Lack of Resources & Rate Limiting		
1.	HTTP Request Smuggling attack	
1.	Application is vulnerable to Email flooding attack	
1.	Application is vulnerable to OTP flooding attack	
1.	Application is vulnerable to Race Condition Attack	
1.	Missing Web API Rate Limiting	
		
### API5:2019 Broken function level authorization		
1.	Is it possible for all user to gain access to admininstrative endpoints?	
1.	Can a user perform sensitive actions by simply changing HTTP?	
		
### API6:2019 Mass Assignment		
1.	Mass Assignment Vulnerability	
1.	Object with sensitive fields has an empty constructor	
1.	Block-list the non-bindable, sensitive fields	
1.	Assess if it possible to modify fields never intended to be modified from outside	
		
### API7:2019 Security Misconfiguration		
1.	Application is vulnerable to Cross Origin Resource sharing	
1.	Oauth/JWT/SAML Misconfiguration	
1.	Using Known Vulnerable Components	
1.	Predictable Resource Location	
1.	Content type incorrectly stated	
1.	Content Security Policy Header not set properly	
1.	Malicious file can be uploaded on the server	
1.	Internal IP Dsiclosure	
1.	Internal Path Disclosure 	
1.	Arbitrary Methods Enabled on Server	
1.	Web Service Dsiclosed	
		
### API8:2019 - Injection		
1.	Application is vulnerable to OS Command Injection attack	
1.	Application is vulnerable to Remote Code Execution attack	
1.	Application is vulnerable to Remote file inclusion attack	
1.	Application is vulnerable to Log Injection Attack	
1.	Server side validation not in place	
1.	Application is vulnerable to SQL Injection Attack	
1.	Application is vulnerable to XML External Entity (XXE) Injection	
1.	Application is vulnerable to Xpath Injection Attack	
1.	Application is vulnerable to XML Injection Attack	
1.	Application is vulnerable to CRLF/Response Spilliting Attack	
1.	Application is vulnerable to URL Redirection Attack	
1.	XML-RPC is publicly available	
1.	Application accepts special character as user input	
1.	Application throws ODBC/SQL error message	
1.	Application is vulnerable to JSON Injection Attack	
		
### API9:2019 Improper Assets Management		
1.	Older version of programming language found	
1.	Older version of SSL supported	
1.	Unwanted ports and services	
		
### API10:2019 Insufficient logging monitoring		
1.	Having sensitive data in logs	
1.	Auditable events, such as logins, failed logins,, and high-value transactions, are not logged	
1.	Appropriate alerting thresholds/response escalation processes are not in place	
