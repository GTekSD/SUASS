# Pickle Rick - A Rick and Morty CTF. Help turn Rick back into a human!
[![Pickle Rick](https://github.com/GTekSD/SUASS/assets/55411358/315ffe46-8d9e-4b49-9325-db534565ba82)](https://tryhackme.com/room/picklerick)

This Rick and Morty-themed challenge requires you to exploit a web server and find three ingredients to help Rick make his potion and transform himself back into a human from a pickle.

Deploy the virtual machine on this task and explore the web application: MACHINE_IP

Answer the questions below:
1. What is the first ingredient that Rick needs?
   ```
   mr. meeseek hair
   ```
3. What is the second ingredient in Rick’s potion?
   ```
   1 jerry tear
   ```
5. What is the last and final ingredient?
   ```
   fleeb juice
   ```

------------------

## Let's Start

let's open this MACHINE_IP into the browser
`view-source:http://10.10.13.219/`
```
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Rick is sup4r cool</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="assets/bootstrap.min.css">
  <script src="assets/jquery.min.js"></script>
  <script src="assets/bootstrap.min.js"></script>
  <style>
  .jumbotron {
    background-image: url("assets/rickandmorty.jpeg");
    background-size: cover;
    height: 340px;
  }
  </style>
</head>
<body>

  <div class="container">
    <div class="jumbotron"></div>
    <h1>Help Morty!</h1></br>
    <p>Listen Morty... I need your help, I've turned myself into a pickle again and this time I can't change back!</p></br>
    <p>I need you to <b>*BURRRP*</b>....Morty, logon to my computer and find the last three secret ingredients to finish my pickle-reverse potion. The only problem is,
    I have no idea what the <b>*BURRRRRRRRP*</b>, password was! Help Morty, Help!</p></br>
  </div>

  <!--

    Note to self, remember username!

    Username: R1ckRul3s

  -->

</body>
</html>
```
Here we found `Username: R1ckRul3s`

Let's Fuzz some dir
```
                                                                                                                                                                                                                  
┌──(root㉿gteksd)-[/home/gteksd]
└─# ffuf -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -u http://10.10.13.219/FUZZ -c 

        /'___\  /'___\           /'___\       
       /\ \__/ /\ \__/  __  __  /\ \__/       
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\      
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/      
         \ \_\   \ \_\  \ \____/  \ \_\       
          \/_/    \/_/   \/___/    \/_/       

       v2.0.0-dev
________________________________________________

 :: Method           : GET
 :: URL              : http://10.10.13.219/FUZZ
 :: Wordlist         : FUZZ: /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
 :: Follow redirects : false
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 40
 :: Matcher          : Response status: 200,204,301,302,307,401,403,405,500
________________________________________________

[Status: 301, Size: 313, Words: 20, Lines: 10, Duration: 126ms]
    * FUZZ: assets
[Status: 200, Size: 17, Words: 17, Lines: 1, Duration: 98ms]
    * FUZZ: robots.txt
[Status: 403, Size: 299, Words: 54, Lines: 4, Duration: 102ms]
    * FUZZ: server-status
```
lets open `http://10.10.239.74/robots.txt` and we found something `Wubbalubbadubdub`

now lets open up assets `http://10.10.239.74/assets`
```
Index of /assets
[ICO]	Name	Last modified	Size	Description
[PARENTDIR]	Parent Directory	 	- 	 
[TXT]	bootstrap.min.css	2019-02-10 16:37 	119K	 
[ ]	bootstrap.min.js	2019-02-10 16:37 	37K	 
[IMG]	fail.gif	2019-02-10 16:37 	49K	 
[ ]	jquery.min.js	2019-02-10 16:37 	85K	 
[IMG]	picklerick.gif	2019-02-10 16:37 	222K	 
[IMG]	portal.jpg	2019-02-10 16:37 	50K	 
[IMG]	rickandmorty.jpeg	2019-02-10 16:37 	488K	 
Apache/2.4.18 (Ubuntu) Server at 10.10.239.74 Port 80
```
here is something portal.jpg, portal seems like login page, lets tey this one
`http://10.10.239.74/portal.php`
intresting it redirects to `http://10.10.239.74/login.php`

As I found Username: `R1ckRul3s` and found something `Wubbalubbadubdub` it could be password, lets use it.

Woah! it works.
