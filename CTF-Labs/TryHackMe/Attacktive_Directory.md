# Attacktive Directory - 99% of Corporate networks run off of AD. But can you exploit a vulnerable Domain Controller?

[![image](https://github.com/GTekSD/SUASS/assets/55411358/f397c8c6-ca99-4d0a-87fb-8df8655da5ff)](https://tryhackme.com/room/attacktivedirectory)


### Task 1 Intro Deploy The Machine
Accessing Attacktive Directory

To access the Virtual Machine, you will need to first connect to our network using OpenVPN. Here is a mini walkthrough of getting connected.

(Please note the browser-based machine will be able to access this machine, you will not need to connect to the VPN.)

Answer the questions below

Go to your access page. Select your VPN server of choice and download your configuration file.

Return to your access page. You can verify you are connected by looking on your access page. Refresh the page. You should see a green tick next to Connected. It will also show you your internal IP address.

You're now ready to start hacking! 

Alternatively, you can deploy the In-Browser Kali or Attack Box and automatically be connected to the TryHackMe Network.

Once connected to the VPN, deploy the machine and get hacking!


### Task 2 Intro Setup

Installing Impacket:

Whether you're on the Kali 2019.3 or Kali 2021.1, Impacket can be a pain to install  correctly. Here's some instructions that may help you install it correctly!

Note: All of the tools mentioned in this task are installed on the AttackBox already. These steps are only required if you are setting up on your own VM. Impacket may also need you to use a python version >=3.7. In the AttackBox you can do this by running your command with python3.9 <your command>.

First, you will need to clone the Impacket Github repo onto your box. The following command will clone Impacket into /opt/impacket:

git clone https://github.com/SecureAuthCorp/impacket.git /opt/impacket

After the repo is cloned, you will notice several install related files, requirements.txt, and setup.py. A commonly skipped file during the installation is setup.py, this actually installs Impacket onto your system so you can use it and not have to worry about any dependencies.

To install the Python requirements for Impacket:

pip3 install -r /opt/impacket/requirements.txt

Once the requirements have finished installing, we can then run the python setup install script:

cd /opt/impacket/ && python3 ./setup.py install

After that, Impacket should be correctly installed now and it should be ready to use!


If you are still having issues, you can try the following script and see if this works:
sudo git clone https://github.com/SecureAuthCorp/impacket.git /opt/impacket
sudo pip3 install -r /opt/impacket/requirements.txt
cd /opt/impacket/ 
sudo pip3 install .
sudo python3 setup.py install

Credit for proper Impacket install instructions goes to Dragonar#0923 in the THM Discord <3


Installing Bloodhound and Neo4j

Bloodhound is another tool that we'll be utilizing while attacking Attacktive Directory. We'll cover specifcs of the tool later, but for now, we need to install two packages with Apt, those being bloodhound and neo4j. You can install it with the following command:

apt install bloodhound neo4j

 Now that it's done, you're ready to go!


Troubleshooting

If you are having issues installing Bloodhound and Neo4j, try issuing the following command:

apt update && apt upgrade

If you are having issues with Impacket, reach out to the TryHackMe Discord for help!
Answer the questions below

Install Impacket, Bloodhound and Neo4j



### Task 3 Enumeration Welcome to Attacktive Directory

Welcome to Attacktive Directory

Welcome Dear User!

Thank you for doing my first room. I originally created this room for my final project in my Cyber Security degree program back in 2019. Since then, I've gone on to make several other rooms, even a Network for THM. In May 2021, I made the decision to renovate this room and make it more guided and less challenge based so there are more learning opportunities for others. I hope you enjoy it.

Love,

Spooks


Enumeration

Basic enumeration starts out with an nmap scan. Nmap is a relatively complex utility that has been refined over the years to detect what ports are open on a device, what services are running, and even detect what operating system is running. It's important to note that not all services may be deteted correctly and not enumerated to it's fullest potential. Despite nmap being an overly complex utility, it cannot enumerate everything. Therefore after an initial nmap scan we'll be using other utilities to help us enumerate the services running on the device.

For more information on nmap, check out the nmap room.


Notes: Flags for each user account are available for submission. You can retrieve the flags for user accounts via RDP (Note: the login format is spookysec.local\User at the Window's login prompt) and Administrator via Evil-WinRM.
Answer the questions below

What tool will allow us to enumerate port 139/445?

What is the NetBIOS-Domain Name of the machine?
What invalid TLD do people commonly use for their Active Directory Domain?



### Task 4 Enumeration Enumerating Users via Kerberos

Introduction:

A whole host of other services are running, including Kerberos. Kerberos is a key authentication service within Active Directory. With this port open, we can use a tool called Kerbrute (by Ronnie Flathers @ropnop) to brute force discovery of users, passwords and even password spray!

Note: Several users have informed me that the latest version of Kerbrute does not contain the UserEnum flag in Kerbrute, if that is the case with the version you have selected, try a older version!

Enumeration:

For this box, a modified User List and Password List will be used to cut down on time of enumeration of users and password hash cracking. It is NOT recommended to brute force credentials due to account lockout policies that we cannot enumerate on the domain controller.
Answer the questions below

What command within Kerbrute will allow us to enumerate valid usernames?

What notable account is discovered? (These should jump out at you)

What is the other notable account is discovered? (These should jump out at you)


### Task 5 Exploitation Abusing Kerberos

Introduction

After the enumeration of user accounts is finished, we can attempt to abuse a feature within Kerberos with an attack method called ASREPRoasting. ASReproasting occurs when a user account has the privilege "Does not require Pre-Authentication" set. This means that the account does not need to provide valid identification before requesting a Kerberos Ticket on the specified user account.

Retrieving Kerberos Tickets

Impacket has a tool called "GetNPUsers.py" (located in impacket/examples/GetNPUsers.py) that will allow us to query ASReproastable accounts from the Key Distribution Center. The only thing that's necessary to query accounts is a valid set of usernames which we enumerated previously via Kerbrute.

Remember:  Impacket may also need you to use a python version >=3.7. In the AttackBox you can do this by running your command with python3.9 /opt/impacket/examples/GetNPUsers.py.
Answer the questions below

We have two user accounts that we could potentially query a ticket from. Which user account can you query a ticket from with no password?

Looking at the Hashcat Examples Wiki page, what type of Kerberos hash did we retrieve from the KDC? (Specify the full name)

What mode is the hash?

Now crack the hash with the modified password list provided, what is the user accounts password?


### Task 6 Enumeration Back to the Basics

Enumeration:

With a user's account credentials we now have significantly more access within the domain. We can now attempt to enumerate any shares that the domain controller may be giving out.
Answer the questions below

What utility can we use to map remote SMB shares?

Which option will list shares?

How many remote shares is the server listing?

There is one particular share that we have access to that contains a text file. Which share is it?

What is the content of the file?

Decoding the contents of the file, what is the full contents?


### Task 7 Domain Privilege Escalation Elevating Privileges within the Domain

Let's Sync Up!

Now that we have new user account credentials, we may have more privileges on the system than before. The username of the account "backup" gets us thinking. What is this the backup account to?

Well, it is the backup account for the Domain Controller. This account has a unique permission that allows all Active Directory changes to be synced with this user account. This includes password hashes

![image](https://github.com/GTekSD/SUASS/assets/55411358/797d07da-ba5a-4578-8552-60c068f8c1d4)


Knowing this, we can use another tool within Impacket called "secretsdump.py". This will allow us to retrieve all of the password hashes that this user account (that is synced with the domain controller) has to offer. Exploiting this, we will effectively have full control over the AD Domain.
Answer the questions below

What method allowed us to dump NTDS.DIT?

What is the Administrators NTLM hash?

What method of attack could allow us to authenticate as the user without the password?

Using a tool called Evil-WinRM what option will allow us to use a hash?


### Task 8 Flag Submission Flag Submission Panel

Flag Submission Panel

Submit the flags for each user account. They can be located on each user's desktop.

If you enjoyed this box, you may also enjoy my blog post!
Answer the questions below
svc-admin

backup

Administrator


