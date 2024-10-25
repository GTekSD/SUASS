arp -a in windows to see all connected devise to the network like arp-scan -l


# Web App Sec Frame
The Web appsec relies on its security frame.
Typical web application security frame is broadly classified into the following areas:
- Input Validation
- Authentication and Authorization
- Session Management
- Cryptography
- Configuration Management
- Exception Management

As a pentester, you should focus and try to exploite vulnerabilities in all the areas of web security frame in order to confirm that they are secured, robust and inevasible.

# Security Frame vs Vulnerabilities Vs Attacks
Area 			| Vulnerabilities | Attacks
------------------------|-----------------|--------
Input Validation	| Injection Attacks | Sql injection, XXS, etc.
Authentication and Authorization | Broken Authentication and Authorization | Authentication Bypass, Brute Force, Privilege Escalation, Unauthorization URL access, etc.
Session Management	| Broken Session Management | Session Hijacking, Session Replay, etc
Cryptography		| Weak Cryptography | Insecure cryptographic storage
Configuration Management| Misconfiguration | Debug enabled, trace enabled, etc
Exception Management	| Improper Exception Handling | Information Disclosure


Examine the core functionality of the application and check for each function it is designed to perform

check for key security mechanisms employed by the application.

# Perform Basic Website Footprinting using Netcraft

Use netcraft to footprint your target website before actually browsing it. It acts as a one stop for all the information about the target website.
It helpsyou to find out the following type of information:

* Background Information
Site Title
Site Rank
Date First seen
Primary Language

* Hosting History
web server IP address
Web Server version
Web Server OS

* Network Information
IP address
IPv6 address
Domain register
Organization Address
Host Country
Netblock Owner
Nameserver
DNS admin
Reverse DNS
Nameserver Organization
Host Company

* Site Technology
Server-side
Client-side
Client-side Scripting Frameworks
Content Delivery Network
Character Encoding
HTTP Compression

Collect information using Whatweb
Type of Information:
Platform
CMS platform
Type of Script
Google Analytics
Webserver Platform
IP address, Country
Plugins and their libraries used
Server Headers, Cookies and Lot more.


# Analyze the HTML Source Code
1. Take a close look at the HTML source code of the web page of the target website.
2. Observe the comments written in the HTML code. These may provide useful hints and contact details of the web admin or developer
3. Carefully look for the links and image tags in the HTML code. These may help in mapping the file system and directory structure inside the web application
4. Look for the destination of the 'action' attributes.

Check the HTTP and HTML Processing by the Browser.
Install HTTP and HTML Analyzer Browser Extension/ Plugin software to analyze HTTP and HTTPS request headers and the HTML source code.

Analyze HTTP Requests: The header and any page returned form HEAD or OPTIONS request usually contain a SERVER: string or similar output detailing the web server software version and possibly the scripting environment or operating system in use.
Tools:
Telnet
Tamper Data
IEWatch
Paros
Burp Suite
Firebug

# Identify server-side technology: Analyze details of the HTTP headers
https://www.example.com/customers.aspx?name-existing%20clientsisActive=0&startDate=20%2F2021&endDate=20%2F2024&showBy=name
HERE:
https = SSL
.aspx? = ASPX Platform
startDate=, endDate=, showBy= Database Column

Technology | Extension | Server Platform
-----------|-----------|----------------
Perl CGI Script | .pl | Generic; usually web servers running on Unix
Active Server | .asp | Microsoft IIS
ASP+ | aspx | Microsoft .NET
PHP Script | .php | Generic; usually interfaced with Apache
ColdFusion | .cfm | Generic; usually interfaced with
Lotus Domino | .nsf | Lotus Domino Server
Java Server Page | .jsp | Various Platforms
Java Struts | .do | Various Platforms

# Examine the Cookies
# Examine the error page messages

Identify the Technology used to Build Target Website
use web site profiler tool on builtwith.com


# Discover Web App Hidden Content
Examine the site map using burp suite tool for any interesting or sensitive content that was hidden during normal use.
(Target>Site map)

- Most of the websites have sitemaps to facilitate search engine optimization.
- An .xml file contains the list of all the publicly accessible pages.
- If it is not configured properly, the sitemap can reveal sensitive locations and files.
- Check for a sitemap.xml file on target website.
- Append /sitemap.xml or /sitemap.xml.gz to the target URL.
- For example: www.targetsite.com/sitemap.xml

Perform Web Spidering

1:21:47 watching time


