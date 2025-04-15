![webapp](https://static.javatpoint.com/blog/images/web-application.png)

# Web Application Penetration Testing
Web application penetration testing is one of the processes of security assessment to find any security weaknesses, technical flaws, or vulnerabilities that may exist in the web application. It involves performing active analysis of the application by simulating every possible attack on the target web application. The Pen tester should perform a web application penetration test in addition to regular network penetration testing to ensure the security of organization’s web application. During web application pen testing, the pen tester tries to find and exploit web application vulnerabilities to determine what information and access they can gain.


Each application and environment is unique, however, we have developed a unified methodology that addresses the requirements of web application security testing.

Our approach is based on the latest version of the leading web security industry standard OWASP Testing Guide complemented by our own proprietary security testing process.

Based on the knowledge of the target application and access to its resources, the web application penetration testing is of three types—Black-box, White-box, and Gray-box. Look at the perspective of these three types of testing:

#### Black-box testing

Black-box testing is the toughest web application testing methodology, as the pen tester has no access to the resources of an organization and no knowledge or information about the web application and its technologies. The pen tester must perform the test right from information gathering, reconnaissance, and finding flaws using various tools and techniques. This type of testing takes more time. The black-box testing reveals the behavior of a web application from the users’ point of view.

#### White-box testing

White-box testing is quite opposite to black-box testing as the client organization provides the tester with knowledge of the web application and access to all its resources. It is easier and takes lesser time compared to the black-box testing. It reveals the behavior of a web application from application developer’s point of view. The organization may provide you with the following information about the web application in advance:

- Application design and architecture
- Information through Interviews with developers/analysts
- Software requirements
- Risk analysis Document

#### Gray-box testing 

Gray-box testing refers to a mixed type of testing, wherein the testers will have partial knowledge about the target and behavior of the web application.

Below are detailed web application security control areas that we check as part of a complete web application security testing, unless otherwise agreed with the client:

## Information gathering

Web applications may inadvertently disclose information that is useful to the attacker by means of verbose response headers, error messages etc . or by using common conventions, such as an admin interface being located in “/admin/”. Furthermore, some of these error messages may be cached by search engines long after the message has been remedied in the application. The first phase in a security assessment is focused on collecting as much  information as possible about a target application.

## Configuration management testing

A secure web application must be deployed on a secure infrastructure. In this control area, the immediately supporting infrastructure is analysed for various misconfigurations that can give an advantage to the attacker. For example, if application is deployed on top of a web server, does it use file extensions (.php, .aspx, .jsp, .pl) to handle dynamic programming? If so, then possibly by uploading a file with such extensions, could allow attackers to take over the web server and circumvent the application security.

## Authentication testing

Almost every web application requires some form of user authentication (establishing identity of the user) to provide additional functionality. For example, to alter content in a content management system, administrators must authenticate themselves. Authentication mechanisms are inspected in detail to examine the possibility of altering or intercepting authentication data to gain additional access to the system. For example, common usernames and passwords are checked, such as admin/admin.

## Session management

HTTP is a stateless protocol and does not have a concept of a user’s session built-in. In order to avoid continuous authentication for each page of a website or service, web applications implement various mechanisms to store and validate credentials for a pre-determined timespan. These session mechanisms are subject to common risks and flaws that may lead to unauthorised access to additional functionality or can be abused to force users to unwillingly and unknowingly execute an action in the system using social engineering tricks. For example, a common error is to rely on usernames stored in a browser cookie in a way that can be easily manipulated by the attacker.

## Business logic testing

Each purpose-built web application will have a specific set of requirements and restrictions specific to the business environment it operates, for example, a junior employee may not authorize transactions over a specific sum or may not authorize transactions where he/she is the initiating party to preserve segregation of duties. To conduct business logic testing, the analyst first builds an understanding of what specific business rules and restrictions must be in place and then attempts to bypass these restrictions using a variety of tests, such as form field tampering, forced browsing etc.

## Data validation testing

Web applications must accept only valid data, e.g. only valid dates, no spaces in e-mail, only plain text in comments areas. If such checks are not enforced, attackers may hijack the execution flow of the program, for example by inserting a portion of a SQL statement in a lookup query that uses user-supplied input. In such a scenario, instead of specifying first name like “John”, attackers may input “John’ OR 1=1;–’ and possibly obtain output of all users in a directory that may be otherwise unavailable or use this to extract data from other tables or gain a foothold in the underlying operating system. In this control area, we check if correct user input syntax is enforced and if not, what can be gained from abusing weak data validation functionality.

## Denial of service testing

A denial of service is a condition when an application cannot answer valid user requests within acceptable time frames. This may be caused by overload in infrastructure resources, for example, caused by excessive queries to the database. This type of attack is common when the attacker’s goal is to obtain “protection money” or as a political “hacktivism” when
opponent’s information resources are overloaded to prevent dissemination of information. Common errors include improper syntax validation in search fields, allowing wildcard characters, such as “%” in SQL queries to be included which may cause the database server to retrieve all rows from a table. If the table is large, then effectively all other users might not be able to use its functionality as it will be busy serving the computationally-expensive request issued by the attacker.
