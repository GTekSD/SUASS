# Basics & Important Command$ u need to Kn0w RN!

- [Linux Commands](#linux-commands)
- [Windows Commands](#windows-commands)
----------------
# Linux Commands
#### cd - chdir (Change Directory).
```zsh
$ cd /				: to come to root
$ cd 				: come to default path
$ cd /usr/bin 			: particular path
$ .. 				: come one directory back
$ ../../ 			: come 2 times back 
```

#### pwd - print working directory.
```zsh
$ pwd				: used to print working directory.
```

#### touch - change file timestamps
```zsh
$ touch textfile.txt						: create a file
$ touch file1 file2 file3 					: create more than one file.
$ touch docfile{1..10} 						: will create 10 file named docfile
$ touch -d tomorrow willcreatefileonnextday.txt 
```

#### mousepad — simple text editor for Xfce
```zsh 
$ mousepad textfile.txt				: used to open text editor
```

#### nano Nano's ANOther editor. 
```zsh
$ nano filename.txt
$ CTRL + X > Y > FILENAME > ENTER 			: to save 
```

#### vim - Vi IMproved, a programmer's text editor
```zsh
$ hit i to start typing
$ hit ESC > SHIFT + : > wq 				: to save file
```

#### ls - list directory contents
```zsh
$ ls 						: lists the directory contents of files and directories
$ ls -l or ll 					: use a long listing format
$ ls -a or la 					: show hidden entries starting with .
$ ls -al 					: show hidden entries in long listing format.
```

#### echo - display a line of text
```zsh
$ echo Hello me! 							: used to print the content.
$ echo “save this txt in a file” > new.txt
$ echo “this txt will be saved on next line” >> new.txt
```

#### cat - concatenate files and print on the standard output
```zsh
$ cat filename.txt 					: display the content of a file.
```

#### shred - overwrite a file to hide its contents, and optionally delete it
```zsh
$ shred filename.txt 					: no one can read this file
```

#### mkdir - make directories
```zsh
$ mkdir newfolder 					: used to create directories.
```

#### cp - copy files and directories 
```zsh
$ cp textfile.txt /newfolder 				: used to copy file to directories
```

#### mv - move (rename) files
```zsh
$ mv textfile.txt /newfolder/textfile.txt 		: used to move files and directories
$ mv filename.txt file.txt 				: used to renames files and directories
```

#### rm - remove files or directories
```zsh
$ rm file.txt 						: used to delete files.
$ rmdir newfolder/ 					: used to delete directory.
$ rm -r or rm -rf newfolder/ 				: delete not empty directory.
```

#### ln - make links between files
```zsh
$ ln -s text.txt newlinkfilelikeshortcut 		: used to link a file to new file.
```

#### whoami - print effective user name
```zsh
$ whoami 			: print the user ID
```

#### users
```zsh
$ users				: display the login names
```

#### sudo , sudoedit — execute a command as another user.
```zsh
$ sudo su 						: to become a root user
$ su 							: also can become root
$ sudo <anycmd> 					: execute cmd with root privileges. 
$ su username 						: to become that user.
$ exit 							: to go back
```

#### adduser, useradd - add or manipulate users
```zsh
$ useradd username 					: will add user quickly without asking anything.
$ adduser username2 					: will ask information to give new user.
```

#### passwd - change user password
```zsh
$ sudo passwd username 				: to change password of username
```

#### apt - command-line interface (Debian based)
```zsh
$ apt update 						: Download package information from all configured sources.
$ apt-get install update 				: Download package information from all configured sources.
$ apt upgrade 						: Install available upgrades of all packages currently installed on the system
$ apt-get install upgrade 				: Install available upgrades of all packages currently installed on the system
$ apt install <pakagename> 				: Install software 
$ apt-get install <pakagename> 				: Install software 
```

#### man - an interface to the system reference manuals
```zsh
$ man <any cmd/tool> 				: show manual
```

#### whatis - display one-line manual page descriptions
```zsh
$ whatis <any cmd/tool> 				: show one line description
```

#### which - locate a command
```zsh
$ which <cmd/tool> 					: pathname of the files (or links)
```

#### whereis - locate the binary, source, and manual page files for a command
```zsh
$ whereis <cmd/tool> 					: show all pathnames of the files (or links)
```

#### diff, cmp - compare two files
```zsh
$ cmp file1.txt file1mod.txt 				: compare two files byte by byte
$ diff file1.txt file2mod.txt 				: compare two files line by line
```

#### find, locate  - search for files
```zsh
$ find / -name “filename*” 				: search for files in a directory hierarchy
$ find . -type f -name “.*” 				: also find hidden files
$ find . -type f -empty 				: also find empty directory 
$ file . -perm /a=x 					: find executable files.
$ locate filename 					: find files by name, quickly.
```

#### Simple Math
```zsh
$ echo "3+4" | bc 					: simple math, u will get result
$ echo "3-4" | bc 					: bc will give u the answer
$ echo "3*4" | bc
$ echo "3/4" | bc
```

#### Package and Compress (archive) files
```zsh
$ zip document 							: compress files in .zip format
$ unzip document.zip 						: extract .zip files.

$ gzip document 						: compress files in .gz format
$ gunzip document.gz 						: extract .gz files

$ tar -czvf newzipname.tar /anydir files
$ tar -xzvf document.tar 					: extract .tar files
	|-c : Create an archive.
	|-x : Extract an archive.
	|-z : Compress the archive with gzip.
	|-v : Display progress in the terminal while creating the archive, also known as “verbose” mode. The v is always optional in these commands, but it’s helpful.
	|-f : Allows you to specify the filename of the archive.
$ tar -czvf archive.tar.gz /home/ubuntu/Downloads /usr/local/stuff /home/ubuntu/Documents
```

#### Network Tools - configure a network interface
```zsh
$ sudo apt install net-tools 					: If not install
$ ifconfig 							: show network info
$ ip address 							: show ip address
$ ip address | grep eth0 | grep inet | awk '{print $2}' 	: just show ip
$ cat /etc/resolv.conf 						: show the DNS
$ resolvectl status 						: show DNS status.
```

```zsh
$ ping website.com 				: to check is it up or not
$ ping -c 4 website.com 			: send only 4 packets to check
$ ping -c 4 -s 500 website.com 			: send 500bytes 4 packets
```

netstat - Print network stuff
```zsh
$ netstat 					: show network stat
$ netstat -tulpn 				: show open ports in our sys
$ ss 						: short and better cmd for netstat
$ ss -tulpn 					: short cmd for netstat -tulpn
```

ufw - program for managing a netfilter firewall
```zsh
$ ufw allow 80 					: it allows port 80
$ ufw app list 					: show available apps
$ ufw status 					: show firewall active apps status
$ ufw enable 					: enable or disable ufw 
```

#### System Information
```zsh
$ uname 					: displays the current system's information.
$ uname -a 					: print all information
$ apt install neofetch 				: must install
$ neofetch 					: show sys all info in pretty 
$ free 						: Display amount of free and used memory in the system
$ df or df -H 					: report file system space usage
```

#### System Processes
```zsh
$ ps 						: show the current processes.
$ ps -aux 					: show more processes.
$ top 						: display all processes eating ur stuff
$ htop 						: same but pretty good to see.
$ kill -9 <psid> 				: will kill the particular processes.
$ pkill -f <psname> 				: will kill the process u mentioned.
```

#### System Control the systemd system and service manager
```zsh
$ systemctl start apache2 			: start the particular service
$ systemctl stop apache2 			: stop the particular service
$ systemctl restart apache2 			: restart the particular service
$ systemctl status apache2 			: show status of the particular service
$ history 					: show all executed commands
$ sudo reboot					: will reboot the system
$ sudo shutdown 				: it will shutdown the system in a minute
$ sudo shutdown -h 				: it will shutdown the system right now.
```

------------

# LINUX Permissions
```zsh
root@kali:~ ls –l or ll
total 20
drwxr-xr-x 2 kali root 4096 Aug  7 15:06 Desktop
drwxr-xr-x 2 kali root 4096 May 12 12:19 Documents
drwxr-xr-x 2 kali root 4096 Aug 12 06:54 Downloads
-rw-r—-r-- 1 kali root  621 Jan 25 20:25 file.php
```
**d rwx r-x r-x  2  kali  root  4096  Aug 7 15:06  Desktop**

| d | rwx | r-x | r-x | 2 | kali | root | 4096 | Aug 7 15:06 | Desktop |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| file type | user permissions | group permissions | other (everyone) permissions | number of hard links | user (owner) name | group name | size | date/time last modified | filename/directory name |


	r = 4 = read 	 
	w = 2 = write	
	x = 1 = execute 

Example:
```zsh
$ chmod +x file.txt		: + (add) r / w / x || - (remove) r / w / x 
$ chmod 726 file.txt		: rwx to user, r to group, rw to others
$ chmod u+rwx file.txt		: all permissions to user
$ chmod g+rwx file.txt		: all permissions to group
$ chmod o-rwx file.txt		: remove all permissions from other
```
```zsh
002	-rw-rw-r--	drwxrwxr-x
007	-rw-rw----	drwxrwx---
022	-rw-r--r--	drwxr-xr-x
027	-rw-r-----	drwxr-x---
077	-rw-------	drwx------
```
------------
 
# Windows Commands

#### RmDir - Remove Files and Directories
```powershell
rd /s /q Directory_and_files					: To remove directory and inside files
```

#### Windows Package Manager
```powershell
$ winget search <appname>					: To search for a tool/ Find and show basic info of packages
$ winget install <package>					: Install a package.
$ winget uninstall <package>					: Remove a package.
$ winget upgrade						: Update a software package.
$ winget upgrade all						: Updates all available packages to the latest application.
$ winget list							: List all installed apps on Windows.

$ Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force	: Set execution policy to allow running downloaded scripts (run once)
$ Install-Module -Name PSWindowsUpdate -Force			: Install the PSWindowsUpdate module from PowerShell Gallery (run once)
$ Import-Module -Name PSWindowsUpdate				: Import the module into your current PowerShell session (run in each new session)
$ Get-WindowsUpdate						: Check for available Windows updates
$ Install-WindowsUpdate						: Install all available Windows updates (use -AcceptAll and -AutoReboot for unattended installation)
								: Example for unattended installation:
								: Install-WindowsUpdate -AcceptAll -AutoReboot
```


#### Networking
```powershell
$ ipconfig							: display IP information
$ ipconfig /all							: show all addresses including MAC and DNS
$ ipconfig /all | findstr DNS					: filter DNS with findstr
$ ipconfig /release						: release current IP address
$ ipconfig /renew						: renew IP address
$ ipconfig /displaydns						: display DNS with IP addresses
$ ipconfig /displaydns | clip					: copy the output on clipboard
$ ipconfig /flushdns						: remove old DNS entries

$ nslookup target.com						: display IP and DNS
$ nslookup target.com 8.8.8.8					: check DNS from Google
$ nslookup -type=ptr target.com					: display more details

$ netsh interface show interface				: show network interface
$ netsh wlan show wlanreport					: give wireless report
$ netsh interface ip show address | findstr "IP Add"		: show all IP addresses

$ ping target.com						: check host is up or not
$ ping -t target.com						: ping continuously

$ tracert target.com						: trace route to target.com
$ tracert -d target.com						: speed up tracert

$ netstat							: show ports
$ netstat -af							: show more
$ netstat -o							: show with address
$ netstat -e -t 5						
```

#### File and System Management
```powershell
$ assoc						: view file association
$ assoc .mp4=VLC.vlc				: assign file type
$ chkdsk /f					: fix errors on the disk
$ chkdsk /r					: locate bad sectors and recover readable information
$ sfc /scnnow					: scan integrity of all protected system files and repair files with problems when possible
```

#### DISM: Deployment Image Servicing and Management
```powershell
$ DISM /Online /Cleanup-Image /ScanHealth
$ DISM /Online /Cleanup-Image /RestorHealth

$ tasklist							: show all running processes
$ tasklist | findstr <prc_name>
$ taskkill /f /pid 11232					: kill a process

$ shutdown /r /fw /f /t /0					: restart computer into BIOS

Display
$ cls								: clear screen
$ getmac /v							: view all MAC addresses
```

#### Power Management
```powershell
$ powercfg /energy						: show issues with power.
$ powercfg /battryreport					: show battery report.
```

#### Firewall
```powershell
$ netsh advfirewall set allprofiles state off			: turn off firewall.
$ netsh advfirewall set allprofiles state on			: turn on firewall
```

#### Routing
```powershell
$ route print							: show route table.
$ route add 192.168.40.0 mask 255.255.255.0 10.7.1.44		: custom route.
$ route delete 192.168.40.0					: delete custom route.
```
