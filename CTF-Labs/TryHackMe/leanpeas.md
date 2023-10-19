```
jan@basic2:/dev/shm$ ./linpeas.sh 


                            ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
                    ▄▄▄▄▄▄▄             ▄▄▄▄▄▄▄▄
             ▄▄▄▄▄▄▄      ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄
         ▄▄▄▄     ▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄
         ▄    ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄       ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄          ▄▄▄▄▄▄               ▄▄▄▄▄▄ ▄
         ▄▄▄▄▄▄              ▄▄▄▄▄▄▄▄                 ▄▄▄▄ 
         ▄▄                  ▄▄▄ ▄▄▄▄▄                  ▄▄▄
         ▄▄                ▄▄▄▄▄▄▄▄▄▄▄▄                  ▄▄
         ▄            ▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄   ▄▄
         ▄      ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄                                ▄▄▄▄
         ▄▄▄▄▄  ▄▄▄▄▄                       ▄▄▄▄▄▄     ▄▄▄▄
         ▄▄▄▄   ▄▄▄▄▄                       ▄▄▄▄▄      ▄ ▄▄
         ▄▄▄▄▄  ▄▄▄▄▄        ▄▄▄▄▄▄▄        ▄▄▄▄▄     ▄▄▄▄▄
         ▄▄▄▄▄▄  ▄▄▄▄▄▄▄      ▄▄▄▄▄▄▄      ▄▄▄▄▄▄▄   ▄▄▄▄▄ 
          ▄▄▄▄▄▄▄▄▄▄▄▄▄▄        ▄          ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 
         ▄▄▄▄▄▄▄▄▄▄▄▄▄                       ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄                         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄            ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
          ▀▀▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▀▀▀▀▀▀
               ▀▀▀▄▄▄▄▄      ▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▀▀
                     ▀▀▀▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▀▀▀

    /---------------------------------------------------------------------------------\
    |                             Do you like PEASS?                                  |                                                              
    |---------------------------------------------------------------------------------|                                                              
    |         Get the latest version    :     https://github.com/sponsors/carlospolop |                                                              
    |         Follow on Twitter         :     @hacktricks_live                        |                                                              
    |         Respect on HTB            :     SirBroccoli                             |                                                              
    |---------------------------------------------------------------------------------|                                                              
    |                                 Thank you!                                      |                                                              
    \---------------------------------------------------------------------------------/                                                              
          linpeas-ng by carlospolop                                                                                                                  
                                                                                                                                                     
ADVISORY: This script should be used for authorized penetration testing and/or educational purposes only. Any misuse of this software will not be the responsibility of the author or of any other collaborator. Use it at your own computers and/or with the computer owner's permission.                
                                                                                                                                                     
Linux Privesc Checklist: https://book.hacktricks.xyz/linux-hardening/linux-privilege-escalation-checklist
 LEGEND:                                                                                                                                             
  RED/YELLOW: 95% a PE vector
  RED: You should take a look to it
  LightCyan: Users with console
  Blue: Users without console & mounted devs
  Green: Common things (users, groups, SUID/SGID, mounts, .sh scripts, cronjobs) 
  LightMagenta: Your username

 Starting linpeas. Caching Writable Folders...

                               ╔═══════════════════╗
═══════════════════════════════╣ Basic information ╠═══════════════════════════════                                                                  
                               ╚═══════════════════╝                                                                                                 
OS: Linux version 4.4.0-119-generic (buildd@lcy01-amd64-013) (gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.9) ) #143-Ubuntu SMP Mon Apr 2 16:08:24 UTC 2018
User & Groups: uid=1001(jan) gid=1001(jan) groups=1001(jan)
Hostname: basic2
Writable folder: /dev/shm
[+] /bin/ping is available for network discovery (linpeas can discover hosts, learn more with -h)
[+] /bin/bash is available for network discovery, port scanning and port forwarding (linpeas can discover hosts, scan ports, and forward ports. Learn more with -h)                                                                                                                                       
[+] /bin/nc is available for network discovery & port scanning (linpeas can discover hosts and scan ports, learn more with -h)                       
                                                                                                                                                     
                                                                                                                                                     

Caching directories . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . DONE
                                                                                                                                                     
                              ╔════════════════════╗
══════════════════════════════╣ System Information ╠══════════════════════════════                                                                   
                              ╚════════════════════╝                                                                                                 
╔══════════╣ Operative system
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#kernel-exploits                                                                   
Linux version 4.4.0-119-generic (buildd@lcy01-amd64-013) (gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.9) ) #143-Ubuntu SMP Mon Apr 2 16:08:24 UTC 2018
Distributor ID: Ubuntu
Description:    Ubuntu 16.04.4 LTS
Release:        16.04
Codename:       xenial

╔══════════╣ Sudo version
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-version                                                                      
Sudo version 1.8.16                                                                                                                                  


╔══════════╣ PATH
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-path-abuses                                                              
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin                                                   

╔══════════╣ Date & uptime
Thu Oct 19 08:11:30 EDT 2023                                                                                                                         
 08:11:30 up 36 min,  1 user,  load average: 0.86, 0.22, 0.14

╔══════════╣ Any sd*/disk* disk in /dev? (limit 20)
disk                                                                                                                                                 

╔══════════╣ Unmounted file-system?
╚ Check if you can mount umounted devices                                                                                                            
UUID=cdbcec40-cb66-49dd-ad6b-be757c8140cf       /       ext4    errors=remount-ro       0 1                                                          
UUID=db3bdca8-5517-4600-b896-e8479e05e44a       none    swap    sw      0 0

╔══════════╣ Environment
╚ Any private information inside environment variables?                                                                                              
HISTFILESIZE=0                                                                                                                                       
MAIL=/var/mail/jan
SSH_CLIENT=10.17.73.130 36102 22
USER=jan
SHLVL=1
HOME=/home/jan
OLDPWD=/home/jan
SSH_TTY=/dev/pts/0
LOGNAME=jan
_=./linpeas.sh
XDG_SESSION_ID=1
TERM=xterm-256color
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
XDG_RUNTIME_DIR=/run/user/1001
LANG=en_US.UTF-8
HISTSIZE=0
SHELL=/bin/bash
PWD=/dev/shm
XDG_DATA_DIRS=/usr/local/share:/usr/share:/var/lib/snapd/desktop
SSH_CONNECTION=10.17.73.130 36102 10.10.161.232 22
HISTFILE=/dev/null

╔══════════╣ Searching Signature verification failed in dmesg
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#dmesg-signature-verification-failed                                               
dmesg Not Found                                                                                                                                      
                                                                                                                                                     
╔══════════╣ Executing Linux Exploit Suggester
╚ https://github.com/mzet-/linux-exploit-suggester                                                                                                   
[+] [CVE-2017-16995] eBPF_verifier                                                                                                                   

   Details: https://ricklarabee.blogspot.com/2018/07/ebpf-and-analysis-of-get-rekt-linux.html
   Exposure: highly probable
   Tags: debian=9.0{kernel:4.9.0-3-amd64},fedora=25|26|27,ubuntu=14.04{kernel:4.4.0-89-generic},[ ubuntu=(16.04|17.04) ]{kernel:4.(8|10).0-(19|28|45)-generic}
   Download URL: https://www.exploit-db.com/download/45010
   Comments: CONFIG_BPF_SYSCALL needs to be set && kernel.unprivileged_bpf_disabled != 1

[+] [CVE-2016-5195] dirtycow

   Details: https://github.com/dirtycow/dirtycow.github.io/wiki/VulnerabilityDetails
   Exposure: highly probable
   Tags: debian=7|8,RHEL=5{kernel:2.6.(18|24|33)-*},RHEL=6{kernel:2.6.32-*|3.(0|2|6|8|10).*|2.6.33.9-rt31},RHEL=7{kernel:3.10.0-*|4.2.0-0.21.el7},[ ubuntu=16.04|14.04|12.04 ]
   Download URL: https://www.exploit-db.com/download/40611
   Comments: For RHEL/CentOS see exact vulnerable versions here: https://access.redhat.com/sites/default/files/rh-cve-2016-5195_5.sh

[+] [CVE-2016-5195] dirtycow 2

   Details: https://github.com/dirtycow/dirtycow.github.io/wiki/VulnerabilityDetails
   Exposure: highly probable
   Tags: debian=7|8,RHEL=5|6|7,ubuntu=14.04|12.04,ubuntu=10.04{kernel:2.6.32-21-generic},[ ubuntu=16.04 ]{kernel:4.4.0-21-generic}
   Download URL: https://www.exploit-db.com/download/40839
   ext-url: https://www.exploit-db.com/download/40847
   Comments: For RHEL/CentOS see exact vulnerable versions here: https://access.redhat.com/sites/default/files/rh-cve-2016-5195_5.sh

[+] [CVE-2021-4034] PwnKit

   Details: https://www.qualys.com/2022/01/25/cve-2021-4034/pwnkit.txt
   Exposure: probable
   Tags: [ ubuntu=10|11|12|13|14|15|16|17|18|19|20|21 ],debian=7|8|9|10|11,fedora,manjaro
   Download URL: https://codeload.github.com/berdav/CVE-2021-4034/zip/main

[+] [CVE-2021-3156] sudo Baron Samedit 2

   Details: https://www.qualys.com/2021/01/26/cve-2021-3156/baron-samedit-heap-based-overflow-sudo.txt
   Exposure: probable
   Tags: centos=6|7|8,[ ubuntu=14|16|17|18|19|20 ], debian=9|10
   Download URL: https://codeload.github.com/worawit/CVE-2021-3156/zip/main

[+] [CVE-2017-7308] af_packet

   Details: https://googleprojectzero.blogspot.com/2017/05/exploiting-linux-kernel-via-packet.html
   Exposure: probable
   Tags: [ ubuntu=16.04 ]{kernel:4.8.0-(34|36|39|41|42|44|45)-generic}
   Download URL: https://raw.githubusercontent.com/xairy/kernel-exploits/master/CVE-2017-7308/poc.c
   ext-url: https://raw.githubusercontent.com/bcoles/kernel-exploits/master/CVE-2017-7308/poc.c
   Comments: CAP_NET_RAW cap or CONFIG_USER_NS=y needed. Modified version at 'ext-url' adds support for additional kernels

[+] [CVE-2017-6074] dccp

   Details: http://www.openwall.com/lists/oss-security/2017/02/22/3
   Exposure: probable
   Tags: [ ubuntu=(14.04|16.04) ]{kernel:4.4.0-62-generic}
   Download URL: https://www.exploit-db.com/download/41458
   Comments: Requires Kernel be built with CONFIG_IP_DCCP enabled. Includes partial SMEP/SMAP bypass

[+] [CVE-2017-1000112] NETIF_F_UFO

   Details: http://www.openwall.com/lists/oss-security/2017/08/13/1
   Exposure: probable
   Tags: ubuntu=14.04{kernel:4.4.0-*},[ ubuntu=16.04 ]{kernel:4.8.0-*}
   Download URL: https://raw.githubusercontent.com/xairy/kernel-exploits/master/CVE-2017-1000112/poc.c
   ext-url: https://raw.githubusercontent.com/bcoles/kernel-exploits/master/CVE-2017-1000112/poc.c
   Comments: CAP_NET_ADMIN cap or CONFIG_USER_NS=y needed. SMEP/KASLR bypass included. Modified version at 'ext-url' adds support for additional distros/kernels

[+] [CVE-2016-8655] chocobo_root

   Details: http://www.openwall.com/lists/oss-security/2016/12/06/1
   Exposure: probable
   Tags: [ ubuntu=(14.04|16.04) ]{kernel:4.4.0-(21|22|24|28|31|34|36|38|42|43|45|47|51)-generic}
   Download URL: https://www.exploit-db.com/download/40871
   Comments: CAP_NET_RAW capability is needed OR CONFIG_USER_NS=y needs to be enabled

[+] [CVE-2016-4557] double-fdput()

   Details: https://bugs.chromium.org/p/project-zero/issues/detail?id=808
   Exposure: probable
   Tags: [ ubuntu=16.04 ]{kernel:4.4.0-21-generic}
   Download URL: https://github.com/offensive-security/exploit-database-bin-sploits/raw/master/bin-sploits/39772.zip
   Comments: CONFIG_BPF_SYSCALL needs to be set && kernel.unprivileged_bpf_disabled != 1

[+] [CVE-2022-32250] nft_object UAF (NFT_MSG_NEWSET)

   Details: https://research.nccgroup.com/2022/09/01/settlers-of-netlink-exploiting-a-limited-uaf-in-nf_tables-cve-2022-32250/
https://blog.theori.io/research/CVE-2022-32250-linux-kernel-lpe-2022/
   Exposure: less probable
   Tags: ubuntu=(22.04){kernel:5.15.0-27-generic}
   Download URL: https://raw.githubusercontent.com/theori-io/CVE-2022-32250-exploit/main/exp.c
   Comments: kernel.unprivileged_userns_clone=1 required (to obtain CAP_NET_ADMIN)

[+] [CVE-2022-2586] nft_object UAF

   Details: https://www.openwall.com/lists/oss-security/2022/08/29/5
   Exposure: less probable
   Tags: ubuntu=(20.04){kernel:5.12.13}
   Download URL: https://www.openwall.com/lists/oss-security/2022/08/29/5/1
   Comments: kernel.unprivileged_userns_clone=1 required (to obtain CAP_NET_ADMIN)

[+] [CVE-2021-3156] sudo Baron Samedit

   Details: https://www.qualys.com/2021/01/26/cve-2021-3156/baron-samedit-heap-based-overflow-sudo.txt
   Exposure: less probable
   Tags: mint=19,ubuntu=18|20, debian=10
   Download URL: https://codeload.github.com/blasty/CVE-2021-3156/zip/main

[+] [CVE-2021-22555] Netfilter heap out-of-bounds write

   Details: https://google.github.io/security-research/pocs/linux/cve-2021-22555/writeup.html
   Exposure: less probable
   Tags: ubuntu=20.04{kernel:5.8.0-*}
   Download URL: https://raw.githubusercontent.com/google/security-research/master/pocs/linux/cve-2021-22555/exploit.c
   ext-url: https://raw.githubusercontent.com/bcoles/kernel-exploits/master/CVE-2021-22555/exploit.c
   Comments: ip_tables kernel module must be loaded

[+] [CVE-2019-18634] sudo pwfeedback

   Details: https://dylankatz.com/Analysis-of-CVE-2019-18634/
   Exposure: less probable
   Tags: mint=19
   Download URL: https://github.com/saleemrashid/sudo-cve-2019-18634/raw/master/exploit.c
   Comments: sudo configuration requires pwfeedback to be enabled.

[+] [CVE-2019-15666] XFRM_UAF

   Details: https://duasynt.com/blog/ubuntu-centos-redhat-privesc
   Exposure: less probable
   Download URL: 
   Comments: CONFIG_USER_NS needs to be enabled; CONFIG_XFRM needs to be enabled

[+] [CVE-2018-1000001] RationalLove

   Details: https://www.halfdog.net/Security/2017/LibcRealpathBufferUnderflow/
   Exposure: less probable
   Tags: debian=9{libc6:2.24-11+deb9u1},ubuntu=16.04.3{libc6:2.23-0ubuntu9}
   Download URL: https://www.halfdog.net/Security/2017/LibcRealpathBufferUnderflow/RationalLove.c
   Comments: kernel.unprivileged_userns_clone=1 required

[+] [CVE-2017-5618] setuid screen v4.5.0 LPE

   Details: https://seclists.org/oss-sec/2017/q1/184
   Exposure: less probable
   Download URL: https://www.exploit-db.com/download/https://www.exploit-db.com/exploits/41154

[+] [CVE-2017-1000366,CVE-2017-1000379] linux_ldso_hwcap_64

   Details: https://www.qualys.com/2017/06/19/stack-clash/stack-clash.txt
   Exposure: less probable
   Tags: debian=7.7|8.5|9.0,ubuntu=14.04.2|16.04.2|17.04,fedora=22|25,centos=7.3.1611
   Download URL: https://www.qualys.com/2017/06/19/stack-clash/linux_ldso_hwcap_64.c
   Comments: Uses "Stack Clash" technique, works against most SUID-root binaries

[+] [CVE-2017-1000253] PIE_stack_corruption

   Details: https://www.qualys.com/2017/09/26/linux-pie-cve-2017-1000253/cve-2017-1000253.txt
   Exposure: less probable
   Tags: RHEL=6,RHEL=7{kernel:3.10.0-514.21.2|3.10.0-514.26.1}
   Download URL: https://www.qualys.com/2017/09/26/linux-pie-cve-2017-1000253/cve-2017-1000253.c

[+] [CVE-2016-9793] SO_{SND|RCV}BUFFORCE

   Details: https://github.com/xairy/kernel-exploits/tree/master/CVE-2016-9793
   Exposure: less probable
   Download URL: https://raw.githubusercontent.com/xairy/kernel-exploits/master/CVE-2016-9793/poc.c
   Comments: CAP_NET_ADMIN caps OR CONFIG_USER_NS=y needed. No SMEP/SMAP/KASLR bypass included. Tested in QEMU only

[+] [CVE-2016-2384] usb-midi

   Details: https://xairy.github.io/blog/2016/cve-2016-2384
   Exposure: less probable
   Tags: ubuntu=14.04,fedora=22
   Download URL: https://raw.githubusercontent.com/xairy/kernel-exploits/master/CVE-2016-2384/poc.c
   Comments: Requires ability to plug in a malicious USB device and to execute a malicious binary as a non-privileged user

[+] [CVE-2016-0728] keyring

   Details: http://perception-point.io/2016/01/14/analysis-and-exploitation-of-a-linux-kernel-vulnerability-cve-2016-0728/
   Exposure: less probable
   Download URL: https://www.exploit-db.com/download/40003
   Comments: Exploit takes about ~30 minutes to run. Exploit is not reliable, see: https://cyseclabs.com/blog/cve-2016-0728-poc-not-working


╔══════════╣ Executing Linux Exploit Suggester 2
╚ https://github.com/jondonas/linux-exploit-suggester-2                                                                                              
  [1] af_packet                                                                                                                                      
      CVE-2016-8655
      Source: http://www.exploit-db.com/exploits/40871
  [2] exploit_x
      CVE-2018-14665
      Source: http://www.exploit-db.com/exploits/45697
  [3] get_rekt
      CVE-2017-16695
      Source: http://www.exploit-db.com/exploits/45010


╔══════════╣ Protections
═╣ AppArmor enabled? .............. You do not have enough privilege to read the profile set.                                                        
apparmor module is loaded.
═╣ AppArmor profile? .............. unconfined
═╣ is linuxONE? ................... s390x Not Found
═╣ grsecurity present? ............ grsecurity Not Found                                                                                             
═╣ PaX bins present? .............. PaX Not Found                                                                                                    
═╣ Execshield enabled? ............ Execshield Not Found                                                                                             
═╣ SELinux enabled? ............... sestatus Not Found                                                                                               
═╣ Seccomp enabled? ............... disabled                                                                                                         
═╣ User namespace? ................ enabled
═╣ Cgroup2 enabled? ............... disabled
═╣ Is ASLR enabled? ............... Yes
═╣ Printer? ....................... No
═╣ Is this a virtual machine? ..... Yes (xen)                                                                                                        

                                   ╔═══════════╗
═══════════════════════════════════╣ Container ╠═══════════════════════════════════                                                                  
                                   ╚═══════════╝                                                                                                     
╔══════════╣ Container related tools present (if any):
/usr/bin/lxc                                                                                                                                         
╔══════════╣ Am I Containered?
╔══════════╣ Container details                                                                                                                       
═╣ Is this a container? ........... No                                                                                                               
═╣ Any running containers? ........ No                                                                                                               
                                                                                                                                                     

                                     ╔═══════╗
═════════════════════════════════════╣ Cloud ╠═════════════════════════════════════                                                                  
                                     ╚═══════╝                                                                                                       
═╣ Google Cloud Platform? ............... No
═╣ AWS ECS? ............................. No
grep: /etc/motd: No such file or directory
═╣ AWS EC2? ............................. Yes
═╣ AWS EC2 Beanstalk? ................... No
═╣ AWS Lambda? .......................... No
═╣ AWS Codebuild? ....................... No
═╣ DO Droplet? .......................... No
═╣ IBM Cloud VM? ........................ No
═╣ Azure VM? ............................ No
═╣ Azure APP? ........................... No

╔══════════╣ AWS EC2 Enumeration
ami-id: ami-08b2580b11e7c69e0                                                                                                                        
instance-action: none
instance-id: i-004e6c87dc74a9158
instance-life-cycle: on-demand
instance-type: t2.nano
region: eu-west-1

══╣ Account Info
{                                                                                                                                                    
  "Code" : "Success",
  "LastUpdated" : "2023-10-19T11:34:00Z",
  "AccountId" : "739930428441"
}

══╣ Network Info
Mac: 02:e3:39:92:7c:21/                                                                                                                              
Owner ID: 739930428441
Public Hostname: 
Security Groups: AllowEverything
Private IPv4s:

Subnet IPv4: 10.10.0.0/16
PrivateIPv6s:

Subnet IPv6: 
Public IPv4s:



══╣ IAM Role
                                                                                                                                                     

══╣ User Data
                                                                                                                                                     

EC2 Security Credentials
{
  "Code" : "Success",
  "LastUpdated" : "2023-10-19T11:34:19Z",
  "Type" : "AWS-HMAC",
  "AccessKeyId" : "ASIA2YR2KKQMT4TZBPW4",
  "SecretAccessKey" : "DR7i28MonmMS3UHM4OeyYUi4DYXv3crZyISZ5t8+",
  "Token" : "IQoJb3JpZ2luX2VjEKT//////////wEaCWV1LXdlc3QtMSJHMEUCIC41ehB67DWJCvABR4tocnYHzDHZtJ7aX6qg4tiLsRKOAiEAo5g6tololxAHfuSXRnBsnyBqGF+QUcM6XQfU/zFuuLUqzwQIvf//////////ARADGgw3Mzk5MzA0Mjg0NDEiDOHHsDwlW5Ezs/+ipCqjBLg4mMMA5YIRi//98pDjoA81XEcL3I1d/g0Exsuiy59CoZ+HEyrgeq9hncKnPjOVJf4bvYfuVTDYKlJUiu3fXm5eDzT5DTj/El8oQVpwCDUHpzTo/90S1W0YWC7qoToYAxNRUalO9lf56JqtpMeHDVVI9/gOsGhf+t49qiVILjd6j2OncPF5GijFx40feTCED4GXTAo44M76obB5tUYaVOuVSbjEgpfNTPF4ijItOchbN/5XDCTsPwnPAmVbZN2GZTsQmm3wjvZnBJ/MtryvDvMcFNxmbdIrL31o8gVLKF7+tensAY6zOZLOjuSXLowjVDmBvcc44lPKPv3zBDlxiK7VIqm8eP+MMKup+azqX7XRxBziZJNfWoJe75ZH2dUEI0lKVxSUKUDbh0f5897p8BlwIL5kww68Md5KgzZv8LBsMBsiBZ/UcOVwnj3eqVltbBE9LDl5WIq32OmLCcWtC7WBjLs0oFWbe0cA4WxeH4rwlXDhdw0sUtvd35Ta7emUg1c988StErGkVxnkCJBmuJPj3fcq8NFwEcTh6pniGfwA7pA48H4zs2YvaScbjEhaVJ3x0tAd39lwtOuooy2zVU6l53wdP+ENwx1b54rCWaf5U5Faeu1wX7nfZBOol3R2EtkQdPRcnkmHELU6gkQAT61Fax+Wm+tchmaJ9M6gIMrFN5qKnh8GoYCJ+dU5/A7ktUnH+/QP+zrkNHtrm1SmwqOG8zYw0ajEqQY6kwKMwvWy+xRrpLLYwHY0M2sPcsxrhVgCy9EagJMjVDeNYgaPc7WtjAhqa48yq1S3MIvENAe7NyQu9jnDMDfxdvXkAX3SQQBfAjg0laWgAMPMldiiSRFgTEnXPr1GgcxwGqEw9I6FKM7zytpmGXNOdUd2KRaEdai9DU8RSr1+BYKyaBVl+bypq775uoU69k8fBrJjT9M5Cmu9BEDgONroCJMpvufShc/VJHJP034/3GBS5C2koS5MpbgW5G1oepWiGv0prRunGyLIaFIsUYdXSZla0B2KcMsVCgLorHJTHssV9sOz546Jii+DrXMskyM+qvqEN4Ha2FbCYR4psiSUVwPFZXLhWojXSJOp0A+5aePGQuPVKg==",
  "Expiration" : "2023-10-19T17:53:08Z"
}
══╣ SSM Runnig
jan       6111  0.0  0.2  16304  1008 pts/0    S+   08:11   0:00 sed s,ssm-agent,?[1;31m&?[0m,                                                       


                ╔════════════════════════════════════════════════╗
════════════════╣ Processes, Crons, Timers, Services and Sockets ╠════════════════                                                                   
                ╚════════════════════════════════════════════════╝                                                                                   
╔══════════╣ Cleaned processes
╚ Check weird & unexpected proceses run by root: https://book.hacktricks.xyz/linux-hardening/privilege-escalation#processes                          
root         1  1.4  1.2  38144  6092 ?        Ss   07:35   0:32 /sbin/init                                                                          
root       353  0.0  0.5  27704  2656 ?        Ss   07:35   0:00 /lib/systemd/systemd-journald
root       397  0.0  0.3  94772  1540 ?        Ss   07:35   0:00 /sbin/lvmetad -f
root       407  0.1  0.7  44708  3956 ?        Ss   07:35   0:02 /lib/systemd/systemd-udevd
systemd+   485  0.0  0.4 100324  2360 ?        Ssl  07:35   0:00 /lib/systemd/systemd-timesyncd
  └─(Caps) 0x0000000002000000=cap_sys_time
message+   810  0.0  0.7  42900  3668 ?        Ss   07:36   0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
  └─(Caps) 0x0000000020000000=cap_audit_write
syslog     818  0.0  0.6 256392  3160 ?        Ssl  07:36   0:00 /usr/sbin/rsyslogd -n
root       826  0.0  1.1 275900  5792 ?        Ssl  07:36   0:00 /usr/lib/accountsservice/accounts-daemon[0m
root       828  0.0  0.6  28544  3012 ?        Ss   07:36   0:00 /lib/systemd/systemd-logind
daemon[0m     832  0.0  0.4  26044  1996 ?        Ss   07:36   0:00 /usr/sbin/atd -f
root       838  0.0  0.2   4396  1228 ?        Ss   07:36   0:00 /usr/sbin/acpid
root       843  0.0  0.3 613392  1648 ?        Ssl  07:36   0:00 /usr/bin/lxcfs /var/lib/lxcfs/
root       846  0.0  2.7 276880 13608 ?        Ssl  07:36   0:00 /usr/lib/snapd/snapd
root       851  0.0  0.5  29008  2744 ?        Ss   07:36   0:00 /usr/sbin/cron -f
root       866  0.0  0.0  13372   140 ?        Ss   07:36   0:00 /sbin/mdadm --monitor --pid-file /run/mdadm/monitor.pid --daemonise --scan --syslog
root       869  0.0  1.1 277176  5572 ?        Ssl  07:36   0:00 /usr/lib/policykit-1/polkitd --no-debug
root       883  0.0  2.3 337920 11528 ?        Ss   07:36   0:00 /usr/sbin/smbd -D
root       892  0.0  1.0 329804  5240 ?        S    07:36   0:00  _ /usr/sbin/smbd -D
root       931  0.0  1.2 337920  6012 ?        S    07:36   0:00  _ /usr/sbin/smbd -D
root       914  0.0  0.5  16124  2668 ?        Ss   07:36   0:00 /sbin/dhclient -1 -v -pf /run/dhclient.eth0.pid -lf /var/lib/dhcp/dhclient.eth0.leases -I -df /var/lib/dhcp/dhclient6.eth0.leases eth0
tomcat9    985  3.8 39.5 2546296 196764 ?      Sl   07:36   1:21 /usr/lib/jvm/java-1.8.0-openjdk-amd64/bin/java -Djava.util.logging.config.file=/opt/tomcat-latest/conf/logging.properties -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager -Dfile.encoding=UTF-8 -Dnet.sf.ehcache.skipUpdateCheck=true -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:+UseParNewGC -Djdk.tls.ephemeralDHKeySize=2048 -Djava.protocol.handler.pkgs=org.apache.catalina.webresources -Dorg.apache.catalina.security.SecurityListener.UMASK=0027 -Xms512m -Xmx512m -Dignore.endorsed.dirs= -classpath /opt/tomcat-latest/bin/bootstrap.jar:/opt/tomcat-latest/bin/tomcat-juli.jar -Dcatalina.base=/opt/tomcat-latest -Dcatalina.home=/opt/tomcat-latest -Djava.io.tmpdir=/opt/tomcat-latest/temp org.apache.catalina.startup.Bootstrap start
root       992  0.0  1.0  65508  5252 ?        Ss   07:36   0:00 /usr/sbin/sshd -D
jan       1420  0.0  0.7  92832  3516 ?        S    08:00   0:00      _ sshd: jan@pts/0
jan       1422  0.0  0.8  22572  4188 pts/0    Ss   08:00   0:00          _ -bash
jan       1518  0.1  0.5   5444  2604 pts/0    S+   08:11   0:00              _ /bin/sh ./linpeas.sh
jan       6125  0.0  0.2   5444  1028 pts/0    S+   08:11   0:00                  _ /bin/sh ./linpeas.sh
jan       6129  0.0  0.6  37508  3372 pts/0    R+   08:11   0:00                  |   _ ps fauxwww
jan       6128  0.0  0.2   5444  1028 pts/0    S+   08:11   0:00                  _ /bin/sh ./linpeas.sh
root      1005  0.0  0.0   5220   148 ?        Ss   07:36   0:00 /sbin/iscsid
root      1006  0.0  0.7   5720  3520 ?        S<Ls 07:36   0:00 /sbin/iscsid
root      1105  0.0  0.3  15936  1552 tty1     Ss+  07:36   0:00 /sbin/agetty --noclear tty1 linux
root      1107  0.0  0.3  15752  1988 ttyS0    Ss+  07:36   0:00 /sbin/agetty --keep-baud 115200 38400 9600 ttyS0 vt220
root      1150  0.0  0.9  71584  4496 ?        Ss   07:36   0:00 /usr/sbin/apache2 -k start
www-data  1157  0.0  0.7 360740  3696 ?        Sl   07:36   0:00  _ /usr/sbin/apache2 -k start
www-data  1159  0.0  0.7 360740  3696 ?        Sl   07:36   0:00  _ /usr/sbin/apache2 -k start
root      1222  0.0  1.1 240008  5720 ?        Ss   07:36   0:00 /usr/sbin/nmbd -D
jan       1360  0.0  0.9  45276  4612 ?        Ss   08:00   0:00 /lib/systemd/systemd --user
jan       1363  0.0  0.4  61596  2024 ?        S    08:00   0:00  _ (sd-pam)

╔══════════╣ Binary processes permissions (non 'root root' and not belonging to current user)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#processes                                                                         
                                                                                                                                                     
╔══════════╣ Processes whose PPID belongs to a different user (not root)
╚ You will know if a user can somehow spawn processes as a different user                                                                            
Proc 485 with ppid 1 is run by user systemd-timesync but the ppid user is root                                                                       
Proc 810 with ppid 1 is run by user messagebus but the ppid user is root
Proc 818 with ppid 1 is run by user syslog but the ppid user is root
Proc 832 with ppid 1 is run by user daemon but the ppid user is root
Proc 985 with ppid 1 is run by user tomcat9 but the ppid user is root
Proc 1157 with ppid 1150 is run by user www-data but the ppid user is root
Proc 1159 with ppid 1150 is run by user www-data but the ppid user is root
Proc 1360 with ppid 1 is run by user jan but the ppid user is root
Proc 1420 with ppid 1358 is run by user jan but the ppid user is root

╔══════════╣ Files opened by processes belonging to other users
╚ This is usually empty because of the lack of privileges to read other user processes information                                                   
COMMAND    PID  TID             USER   FD      TYPE             DEVICE SIZE/OFF       NODE NAME                                                      

╔══════════╣ Processes with credentials in memory (root req)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#credentials-from-process-memory                                                   
gdm-password Not Found                                                                                                                               
gnome-keyring-daemon Not Found                                                                                                                       
lightdm Not Found                                                                                                                                    
vsftpd Not Found                                                                                                                                     
apache2 process found (dump creds from memory as root)                                                                                               
sshd: process found (dump creds from memory as root)

╔══════════╣ Cron jobs
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#scheduled-cron-jobs                                                               
/usr/bin/crontab                                                                                                                                     
incrontab Not Found
-rw-r--r-- 1 root root     722 Apr  5  2016 /etc/crontab                                                                                             

/etc/cron.d:
total 20
drwxr-xr-x  2 root root 4096 Apr 17  2018 .
drwxr-xr-x 99 root root 4096 Nov 15  2018 ..
-rw-r--r--  1 root root  589 Jul 16  2014 mdadm
-rw-r--r--  1 root root  102 Apr  5  2016 .placeholder
-rw-r--r--  1 root root  190 Apr 17  2018 popularity-contest

/etc/cron.daily:
total 64
drwxr-xr-x  2 root root 4096 Apr 19  2018 .
drwxr-xr-x 99 root root 4096 Nov 15  2018 ..
-rwxr-xr-x  1 root root  539 Apr  5  2016 apache2
-rwxr-xr-x  1 root root  376 Mar 31  2016 apport
-rwxr-xr-x  1 root root 1474 Jun 19  2017 apt-compat
-rwxr-xr-x  1 root root  355 May 22  2012 bsdmainutils
-rwxr-xr-x  1 root root 1597 Nov 26  2015 dpkg
-rwxr-xr-x  1 root root  372 May  6  2015 logrotate
-rwxr-xr-x  1 root root 1293 Nov  6  2015 man-db
-rwxr-xr-x  1 root root  539 Jul 16  2014 mdadm
-rwxr-xr-x  1 root root  435 Nov 18  2014 mlocate
-rwxr-xr-x  1 root root  249 Nov 12  2015 passwd
-rw-r--r--  1 root root  102 Apr  5  2016 .placeholder
-rwxr-xr-x  1 root root 3449 Feb 26  2016 popularity-contest
-rwxr-xr-x  1 root root  383 Mar  7  2016 samba
-rwxr-xr-x  1 root root  214 May 24  2016 update-notifier-common

/etc/cron.hourly:
total 12
drwxr-xr-x  2 root root 4096 Apr 17  2018 .
drwxr-xr-x 99 root root 4096 Nov 15  2018 ..
-rw-r--r--  1 root root  102 Apr  5  2016 .placeholder

/etc/cron.monthly:
total 12
drwxr-xr-x  2 root root 4096 Apr 17  2018 .
drwxr-xr-x 99 root root 4096 Nov 15  2018 ..
-rw-r--r--  1 root root  102 Apr  5  2016 .placeholder

/etc/cron.weekly:
total 24
drwxr-xr-x  2 root root 4096 Apr 17  2018 .
drwxr-xr-x 99 root root 4096 Nov 15  2018 ..
-rwxr-xr-x  1 root root   86 Apr 13  2016 fstrim
-rwxr-xr-x  1 root root  771 Nov  6  2015 man-db
-rw-r--r--  1 root root  102 Apr  5  2016 .placeholder
-rwxr-xr-x  1 root root  211 May 24  2016 update-notifier-common

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )

╔══════════╣ Systemd PATH
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#systemd-path-relative-paths                                                       
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin                                                                                    

╔══════════╣ Analyzing .service files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#services                                                                          
/etc/systemd/system/final.target.wants/snapd.system-shutdown.service could be executing some relative path                                           
/etc/systemd/system/multi-user.target.wants/networking.service could be executing some relative path
/etc/systemd/system/network-online.target.wants/networking.service could be executing some relative path
/etc/systemd/system/sysinit.target.wants/friendly-recovery.service could be executing some relative path
/lib/systemd/system/emergency.service could be executing some relative path
/lib/systemd/system/friendly-recovery.service could be executing some relative path
/lib/systemd/system/ifup@.service could be executing some relative path
You can't write on systemd PATH

╔══════════╣ System timers
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#timers                                                                            
NEXT                         LEFT         LAST                         PASSED    UNIT                         ACTIVATES                              
Thu 2023-10-19 12:12:34 EDT  4h 0min left Thu 2023-10-19 07:36:14 EDT  35min ago snapd.refresh.timer          snapd.refresh.service
Fri 2023-10-20 05:10:56 EDT  20h left     Thu 2023-10-19 07:36:15 EDT  35min ago apt-daily.timer              apt-daily.service
Fri 2023-10-20 06:04:48 EDT  21h left     Thu 2023-10-19 07:36:15 EDT  35min ago apt-daily-upgrade.timer      apt-daily-upgrade.service
Fri 2023-10-20 07:50:51 EDT  23h left     Thu 2023-10-19 07:50:51 EDT  20min ago systemd-tmpfiles-clean.timer systemd-tmpfiles-clean.service
n/a                          n/a          n/a                          n/a       snapd.snap-repair.timer      snapd.snap-repair.service
n/a                          n/a          n/a                          n/a       ureadahead-stop.timer        ureadahead-stop.service

╔══════════╣ Analyzing .timer files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#timers                                                                            
                                                                                                                                                     
╔══════════╣ Analyzing .socket files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sockets                                                                           
/etc/systemd/system/sockets.target.wants/uuidd.socket is calling this writable listener: /run/uuidd/request                                          
/lib/systemd/system/dbus.socket is calling this writable listener: /var/run/dbus/system_bus_socket
/lib/systemd/system/sockets.target.wants/dbus.socket is calling this writable listener: /var/run/dbus/system_bus_socket
/lib/systemd/system/sockets.target.wants/systemd-journald-dev-log.socket is calling this writable listener: /run/systemd/journal/dev-log
/lib/systemd/system/sockets.target.wants/systemd-journald.socket is calling this writable listener: /run/systemd/journal/stdout
/lib/systemd/system/sockets.target.wants/systemd-journald.socket is calling this writable listener: /run/systemd/journal/socket
/lib/systemd/system/syslog.socket is calling this writable listener: /run/systemd/journal/syslog
/lib/systemd/system/systemd-bus-proxyd.socket is calling this writable listener: /var/run/dbus/system_bus_socket
/lib/systemd/system/systemd-journald-dev-log.socket is calling this writable listener: /run/systemd/journal/dev-log
/lib/systemd/system/systemd-journald.socket is calling this writable listener: /run/systemd/journal/stdout
/lib/systemd/system/systemd-journald.socket is calling this writable listener: /run/systemd/journal/socket
/lib/systemd/system/uuidd.socket is calling this writable listener: /run/uuidd/request

╔══════════╣ Unix Sockets Listening
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sockets                                                                           
/run/acpid.socket                                                                                                                                    
  └─(Read Write)
/run/dbus/system_bus_socket
  └─(Read Write)
/run/lvm/lvmetad.socket
/run/lvm/lvmpolld.socket
/run/samba/nmbd/unexpected
  └─(Read Write)
/run/snapd-snap.socket
  └─(Read Write)
/run/snapd.socket
  └─(Read Write)
/run/systemd/fsck.progress
/run/systemd/journal/dev-log
  └─(Read Write)
/run/systemd/journal/socket
  └─(Read Write)
/run/systemd/journal/stdout
  └─(Read Write)
/run/systemd/journal/syslog
  └─(Read Write)
/run/systemd/notify
  └─(Read Write)
/run/systemd/private
  └─(Read Write)
/run/udev/control
/run/user/1001/systemd/notify
  └─(Read Write)
/run/user/1001/systemd/private
  └─(Read Write)
/run/uuidd/request
  └─(Read Write)
/var/lib/lxd/unix.socket
/var/run/dbus/system_bus_socket
  └─(Read Write)
/var/run/samba/nmbd/unexpected
  └─(Read Write)

╔══════════╣ D-Bus config files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#d-bus                                                                             
Possible weak user policy found on /etc/dbus-1/system.d/dnsmasq.conf (        <policy user="dnsmasq">)                                               
Possible weak user policy found on /etc/dbus-1/system.d/org.freedesktop.network1.conf (        <policy user="systemd-network">)
Possible weak user policy found on /etc/dbus-1/system.d/org.freedesktop.resolve1.conf (        <policy user="systemd-resolve">)

╔══════════╣ D-Bus Service Objects list
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#d-bus                                                                             
NAME                                 PID PROCESS         USER             CONNECTION    UNIT                      SESSION    DESCRIPTION             
:1.0                                   1 systemd         root             :1.0          init.scope                -          -                  
:1.1                                 828 systemd-logind  root             :1.1          systemd-logind.service    -          -                  
:1.13                               9101 busctl          jan              :1.13         session-1.scope           1          -                  
:1.2                                 826 accounts-daemon[0m root             :1.2          accounts-daemon.service   -          -                  
:1.3                                 869 polkitd         root             :1.3          polkitd.service           -          -                  
com.ubuntu.LanguageSelector            - -               -                (activatable) -                         -         
com.ubuntu.SoftwareProperties          - -               -                (activatable) -                         -         
org.freedesktop.Accounts             826 accounts-daemon[0m root             :1.2          accounts-daemon.service   -          -                  
org.freedesktop.DBus                 810 dbus-daemon[0m     messagebus       org.freedesktop.DBus dbus.service              -          -                  
org.freedesktop.PolicyKit1           869 polkitd         root             :1.3          polkitd.service           -          -                  
org.freedesktop.hostname1              - -               -                (activatable) -                         -         
org.freedesktop.locale1                - -               -                (activatable) -                         -         
org.freedesktop.login1               828 systemd-logind  root             :1.1          systemd-logind.service    -          -                  
org.freedesktop.network1               - -               -                (activatable) -                         -         
org.freedesktop.resolve1               - -               -                (activatable) -                         -         
org.freedesktop.systemd1               1 systemd         root             :1.0          init.scope                -          -                  
org.freedesktop.timedate1              - -               -                (activatable) -                         -         


                              ╔═════════════════════╗
══════════════════════════════╣ Network Information ╠══════════════════════════════                                                                  
                              ╚═════════════════════╝                                                                                                
╔══════════╣ Hostname, hosts and DNS
basic2                                                                                                                                               
127.0.0.1       localhost
127.0.1.1       basic2

::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
nameserver 10.0.0.2
search eu-west-1.compute.internal

╔══════════╣ Interfaces
# symbolic names for networks, see networks(5) for more information                                                                                  
link-local 169.254.0.0
eth0      Link encap:Ethernet  HWaddr 02:e3:39:92:7c:21  
          inet addr:10.10.161.232  Bcast:10.10.255.255  Mask:255.255.0.0
          inet6 addr: fe80::e3:39ff:fe92:7c21/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:9001  Metric:1
          RX packets:1377 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1491 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:939754 (939.7 KB)  TX bytes:267040 (267.0 KB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:192 errors:0 dropped:0 overruns:0 frame:0
          TX packets:192 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1 
          RX bytes:14256 (14.2 KB)  TX bytes:14256 (14.2 KB)


╔══════════╣ Active Ports
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#open-ports                                                                        
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      -                                                                    
tcp        0      0 0.0.0.0:445             0.0.0.0:*               LISTEN      -               
tcp        0      0 0.0.0.0:139             0.0.0.0:*               LISTEN      -               
tcp6       0      0 :::22                   :::*                    LISTEN      -               
tcp6       0      0 :::445                  :::*                    LISTEN      -               
tcp6       0      0 127.0.0.1:8005          :::*                    LISTEN      -               
tcp6       0      0 :::8009                 :::*                    LISTEN      -               
tcp6       0      0 :::139                  :::*                    LISTEN      -               
tcp6       0      0 :::8080                 :::*                    LISTEN      -               
tcp6       0      0 :::80                   :::*                    LISTEN      -               

╔══════════╣ Can I sniff with tcpdump?
No                                                                                                                                                   
                                                                                                                                                     


                               ╔═══════════════════╗
═══════════════════════════════╣ Users Information ╠═══════════════════════════════                                                                  
                               ╚═══════════════════╝                                                                                                 
╔══════════╣ My user
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#users                                                                             
uid=1001(jan) gid=1001(jan) groups=1001(jan)                                                                                                         

╔══════════╣ Do I have PGP keys?
/usr/bin/gpg                                                                                                                                         
netpgpkeys Not Found
netpgp Not Found                                                                                                                                     
                                                                                                                                                     
╔══════════╣ Checking 'sudo -l', /etc/sudoers, and /etc/sudoers.d
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-and-suid                                                                     
                                                                                                                                                     
╔══════════╣ Checking sudo tokens
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#reusing-sudo-tokens                                                               
ptrace protection is enabled (1)                                                                                                                     

╔══════════╣ Checking Pkexec policy
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation/interesting-groups-linux-pe#pe-method-2                                           
                                                                                                                                                     
[Configuration]
AdminIdentities=unix-user:0
[Configuration]
AdminIdentities=unix-group:sudo;unix-group:admin

╔══════════╣ Superusers
root:x:0:0:root:/root:/bin/bash                                                                                                                      

╔══════════╣ Users with console
jan:x:1001:1001::/home/jan:/bin/bash                                                                                                                 
kay:x:1000:1000:Kay,,,:/home/kay:/bin/bash
root:x:0:0:root:/root:/bin/bash

╔══════════╣ All users & groups
uid=0(root) gid=0(root) groups=0(root)                                                                                                               
uid=1000(kay) gid=1000(kay) groups=1000(kay),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),110(lxd),115(lpadmin),116(sambashare)
uid=1001(jan) gid=1001(jan) groups=1001(jan)
uid=100(systemd-timesync) gid=102(systemd-timesync) groups=102(systemd-timesync)
uid=101(systemd-network) gid=103(systemd-network) groups=103(systemd-network)
uid=102(systemd-resolve) gid=104(systemd-resolve) groups=104(systemd-resolve)
uid=103(systemd-bus-proxy) gid=105(systemd-bus-proxy) groups=105(systemd-bus-proxy)
uid=104(syslog) gid=108(syslog) groups=108(syslog),4(adm)
uid=105(_apt) gid=65534(nogroup) groups=65534(nogroup)
uid=106(lxd) gid=65534(nogroup) groups=65534(nogroup)
uid=107(messagebus) gid=111(messagebus) groups=111(messagebus)
uid=108(uuidd) gid=112(uuidd) groups=112(uuidd)
uid=109(dnsmasq) gid=65534(nogroup) groups=65534(nogroup)
uid=10(uucp) gid=10(uucp) groups=10(uucp)
uid=110(sshd) gid=65534(nogroup) groups=65534(nogroup)
uid=13(proxy) gid=13(proxy) groups=13(proxy)
uid=1(daemon[0m) gid=1(daemon[0m) groups=1(daemon[0m)
uid=2(bin) gid=2(bin) groups=2(bin)
uid=33(www-data) gid=33(www-data) groups=33(www-data)
uid=34(backup) gid=34(backup) groups=34(backup)
uid=38(list) gid=38(list) groups=38(list)
uid=39(irc) gid=39(irc) groups=39(irc)
uid=3(sys) gid=3(sys) groups=3(sys)
uid=41(gnats) gid=41(gnats) groups=41(gnats)
uid=4(sync) gid=65534(nogroup) groups=65534(nogroup)
uid=5(games) gid=60(games) groups=60(games)
uid=65534(nobody) gid=65534(nogroup) groups=65534(nogroup)
uid=6(man) gid=12(man) groups=12(man)
uid=7(lp) gid=7(lp) groups=7(lp)
uid=8(mail) gid=8(mail) groups=8(mail)
uid=999(tomcat9) gid=999(tomcat9) groups=999(tomcat9)
uid=9(news) gid=9(news) groups=9(news)

╔══════════╣ Login now
 08:11:40 up 36 min,  1 user,  load average: 1.39, 0.36, 0.19                                                                                        
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
jan      pts/0    10.17.73.130     08:00   36.00s  0.07s  0.00s /bin/sh ./linpeas.sh

╔══════════╣ Last logons
kay      tty1         Wed Apr 18 09:20:23 2018 - down                      (00:05)     0.0.0.0                                                       
reboot   system boot  Tue Apr 17 13:45:54 2018 - Wed Apr 18 09:25:28 2018  (19:39)     0.0.0.0
kay      tty1         Wed Apr 18 09:02:11 2018 - crash                     (-19:-16)   0.0.0.0
reboot   system boot  Tue Apr 17 13:27:20 2018 - Wed Apr 18 09:25:28 2018  (19:58)     0.0.0.0
kay      tty1         Tue Apr 17 13:21:53 2018 - crash                     (00:05)     0.0.0.0
reboot   system boot  Tue Apr 17 13:14:40 2018 - Wed Apr 18 09:25:28 2018  (20:10)     0.0.0.0
kay      tty1         Tue Apr 17 13:05:36 2018 - down                      (00:08)     0.0.0.0
reboot   system boot  Tue Apr 17 13:00:02 2018 - Tue Apr 17 13:14:23 2018  (00:14)     0.0.0.0

wtmp begins Tue Apr 17 13:00:02 2018

╔══════════╣ Last time logon each user
Username         Port     From             Latest                                                                                                    
kay              pts/0    192.168.56.102   Mon Apr 23 16:04:07 -0400 2018
jan              pts/0    10.17.73.130     Thu Oct 19 08:00:43 -0400 2023

╔══════════╣ Do not forget to test 'su' as any other user with shell: without password and with their names as password (I don't do it in FAST mode...)                                                                                                                                                   
                                                                                                                                                     
╔══════════╣ Do not forget to execute 'sudo -l' without password or with valid password (if you know it)!!
                                                                                                                                                     


                             ╔══════════════════════╗
═════════════════════════════╣ Software Information ╠═════════════════════════════                                                                   
                             ╚══════════════════════╝                                                                                                
╔══════════╣ Useful software
/usr/bin/base64                                                                                                                                      
/usr/bin/curl
/usr/bin/lxc
/bin/nc
/bin/nc.traditional
/bin/netcat
/usr/bin/perl
/bin/ping
/usr/bin/python
/usr/bin/python2
/usr/bin/python2.7
/usr/bin/python3
/usr/bin/sudo
/usr/bin/wget

╔══════════╣ Installed Compilers
/usr/share/gcc-5                                                                                                                                     

╔══════════╣ Searching mysql credentials and exec
                                                                                                                                                     
╔══════════╣ Analyzing Apache-Nginx Files (limit 70)
Apache version: Server version: Apache/2.4.18 (Ubuntu)                                                                                               
Server built:   2017-09-18T15:09:02
httpd Not Found
                                                                                                                                                     
Nginx version: nginx Not Found
                                                                                                                                                     
══╣ PHP exec extensions
drwxr-xr-x 2 root root 4096 Apr 18  2018 /etc/apache2/sites-enabled                                                                                  
drwxr-xr-x 2 root root 4096 Apr 18  2018 /etc/apache2/sites-enabled
lrwxrwxrwx 1 root root 35 Apr 18  2018 /etc/apache2/sites-enabled/000-default.conf -> ../sites-available/000-default.conf
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>


-rw-r--r-- 1 root root 1332 Mar 19  2016 /etc/apache2/sites-available/000-default.conf
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
lrwxrwxrwx 1 root root 35 Apr 18  2018 /etc/apache2/sites-enabled/000-default.conf -> ../sites-available/000-default.conf
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>




╔══════════╣ Analyzing Rsync Files (limit 70)
-rw-r--r-- 1 root root 1044 Sep 30  2013 /usr/share/doc/rsync/examples/rsyncd.conf                                                                   
[ftp]
        comment = public archive
        path = /var/www/pub
        use chroot = yes
        lock file = /var/lock/rsyncd
        read only = yes
        list = yes
        uid = nobody
        gid = nogroup
        strict modes = yes
        ignore errors = no
        ignore nonreadable = yes
        transfer logging = no
        timeout = 600
        refuse options = checksum dry-run
        dont compress = *.gz *.tgz *.zip *.z *.rpm *.deb *.iso *.bz2 *.tbz


╔══════════╣ Analyzing Ldap Files (limit 70)
The password hash is from the {SSHA} to 'structural'                                                                                                 
drwxr-xr-x 2 root root 4096 Apr 17  2018 /etc/ldap


╔══════════╣ Searching ssl/ssh files
╔══════════╣ Analyzing SSH Files (limit 70)                                                                                                          
                                                                                                                                                     
-rw-r--r-- 1 kay kay 3326 Apr 19  2018 /home/kay/.ssh/id_rsa
-----BEGIN RSA PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
DEK-Info: AES-128-CBC,6ABA7DE35CDB65070B92C1F760E2FE75
IoNb/J0q2Pd56EZ23oAaJxLvhuSZ1crRr4ONGUAnKcRxg3+9vn6xcujpzUDuUtlZ
o9dyIEJB4wUZTueBPsmb487RdFVkTOVQrVHty1K2aLy2Lka2Cnfjz8Llv+FMadsN
XRvjw/HRiGcXPY8B7nsA1eiPYrPZHIH3QOFIYlSPMYv79RC65i6frkDSvxXzbdfX
AkAN+3T5FU49AEVKBJtZnLTEBw31mxjv0lLXAqIaX5QfeXMacIQOUWCHATlpVXmN
lG4BaG7cVXs1AmPieflx7uN4RuB9NZS4Zp0lplbCb4UEawX0Tt+VKd6kzh+Bk0aU
hWQJCdnb/U+dRasu3oxqyklKU2dPseU7rlvPAqa6y+ogK/woTbnTrkRngKqLQxMl
lIWZye4yrLETfc275hzVVYh6FkLgtOfaly0bMqGIrM+eWVoXOrZPBlv8iyNTDdDE
3jRjqbOGlPs01hAWKIRxUPaEr18lcZ+OlY00Vw2oNL2xKUgtQpV2jwH04yGdXbfJ
LYWlXxnJJpVMhKC6a75pe4ZVxfmMt0QcK4oKO1aRGMqLFNwaPxJYV6HauUoVExN7
bUpo+eLYVs5mo5tbpWDhi0NRfnGP1t6bn7Tvb77ACayGzHdLpIAqZmv/0hwRTnrb
RVhY1CUf7xGNmbmzYHzNEwMppE2i8mFSaVFCJEC3cDgn5TvQUXfh6CJJRVrhdxVy
VqVjsot+CzF7mbWm5nFsTPPlOnndC6JmrUEUjeIbLzBcW6bX5s+b95eFeceWMmVe
B0WhqnPtDtVtg3sFdjxp0hgGXqK4bAMBnM4chFcK7RpvCRjsKyWYVEDJMYvc87Z0
ysvOpVn9WnFOUdON+U4pYP6PmNU4Zd2QekNIWYEXZIZMyypuGCFdA0SARf6/kKwG
oHOACCK3ihAQKKbO+SflgXBaHXb6k0ocMQAWIOxYJunPKN8bzzlQLJs1JrZXibhl
VaPeV7X25NaUyu5u4bgtFhb/f8aBKbel4XlWR+4HxbotpJx6RVByEPZ/kViOq3S1
GpwHSRZon320xA4hOPkcG66JDyHlS6B328uViI6Da6frYiOnA4TEjJTPO5RpcSEK
QKIg65gICbpcWj1U4I9mEHZeHc0r2lyufZbnfYUr0qCVo8+mS8X75seeoNz8auQL
4DI4IXITq5saCHP4y/ntmz1A3Q0FNjZXAqdFK/hTAdhMQ5diGXnNw3tbmD8wGveG
VfNSaExXeZA39jOgm3VboN6cAXpz124Kj0bEwzxCBzWKi0CPHFLYuMoDeLqP/NIk
oSXloJc8aZemIl5RAH5gDCLT4k67wei9j/JQ6zLUT0vSmLono1IiFdsMO4nUnyJ3
z+3XTDtZoUl5NiY4JjCPLhTNNjAlqnpcOaqad7gV3RD/asml2L2kB0UT8PrTtt+S
baXKPFH0dHmownGmDatJP+eMrc6S896+HAXvcvPxlKNtI7+jsNTwuPBCNtSFvo19
l9+xxd55YTVo1Y8RMwjopzx7h8oRt7U+Y9N/BVtbt+XzmYLnu+3qOq4W2qOynM2P
nZjVPpeh+8DBoucB5bfXsiSkNxNYsCED4lspxUE4uMS3yXBpZ/44SyY8KEzrAzaI
fn2nnjwQ1U2FaJwNtMN5OIshONDEABf9Ilaq46LSGpMRahNNXwzozh+/LGFQmGjI
I/zN/2KspUeW/5mqWwvFiK8QU38m7M+mli5ZX76snfJE9suva3ehHP2AeN5hWDMw
X+CuDSIXPo10RDX+OmmoExMQn5xc3LVtZ1RKNqono7fA21CzuCmXI2j/LtmYwZEL
OScgwNTLqpB6SfLDj5cFA5cdZLaXL1t7XDRzWggSnCt+6CxszEndyUOlri9EZ8XX
oHhZ45rgACPHcdWcrKCBfOQS01hJq9nSJe2W403lJmsx/U3YLauUaVgrHkFoejnx
CNpUtuhHcVQssR9cUi5it5toZ+iiDfLoyb+f82Y0wN5Tb6PTd/onVDtskIlfE731
DwOy3Zfl0l1FL6ag0iVwTrPBl1GGQoXf4wMbwv9bDF0Zp/6uatViV1dHeqPD8Otj
Vxfx9bkDezp2Ql2yohUeKBDu+7dYU9k5Ng0SQAk7JJeokD7/m5i8cFwq/g5VQa8r
sGsOxQ5Mr3mKf1n/w6PnBWXYh7n2lL36ZNFacO1V6szMaa8/489apbbjpxhutQNu
Eu/lP8xQlxmmpvPsDACMtqA1IpoVl9m+a+sTRE2EyT8hZIRMiuaaoTZIV4CHuY6Q
3QP52kfZzjBt3ciN2AmYv205ENIJvrsacPi3PZRNlJsbGxmxOkVXdvPC5mR/pnIv
wrrVsgJQJoTpFRShHjQ3qSoJ/r/8/D1VCVtD4UsFZ+j1y9kXKLaT/oK491zK8nwG
URUvqvBhDS7cq8C5rFGJUYD79guGh3He5Y7bl+mdXKNZLMlzOnauC5bKV4i+Yuj7
AGIExXRIJXlwF4G0bsl5vbydM55XlnBRyof62ucYS9ecrAr4NGMggcXfYYncxMyK
AXDKwSwwwf/yHEwX8ggTESv5Ad+BxdeMoiAk8c1Yy1tzwdaMZSnOSyHXuVlB4Jn5
phQL3R8OrZETsuXxfDVKrPeaOKEE1vhEVZQXVSOHGCuiDYkCA6al6WYdI9i2+uNR
ogjvVVBVVZIBH+w5YJhYtrInQ7DMqAyX1YB2pmC+leRgF3yrP9a2kLAaDk9dBQcV
ev6cTcfzhBhyVqml1WqwDUZtROTwfl80jo8QDlq+HE0bvCB/o2FxQKYEtgfH4/UC
D5qrsHAK15DnhH4IXrIkPlA799CXrhWi7mF5Ji41F3O7iAEjwKh6Q/YjgPvgj8LG
OsCP/iugxt7u+91J7qov/RBTrO7GeyX5Lc/SW1j6T6sjKEga8m9fS10h4TErePkT
t/CCVLBkM22Ewao8glguHN5VtaNH0mTLnpjfNLVJCDHl0hKzi3zZmdrxhql+/WJQ
4eaCAHk1hUL3eseN3ZpQWRnDGAAPxH+LgPyE8Sz1it8aPuP8gZABUFjBbEFMwNYB
e5ofsDLuIOhCVzsw/DIUrF+4liQ3R36Bu2R5+kmPFIkkeW1tYWIY7CpfoJSd74VC
3Jt1/ZW3XCb76R75sG5h6Q4N8gu5c/M0cdq16H9MHwpdin9OZTqO2zNxFvpuXthY
-----END RSA PRIVATE KEY-----
-rw-r--r-- 1 kay kay 771 Apr 19  2018 /home/kay/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCzAsDwjb0ft4IO7Kyux8DWocNiS1aJqpdVEo+gfk8Ng624b9qOQp7LOWDMVIINfCuzkTA3ZugSyo1OehPc0iyD7SfJIMzsETFvlHB3DlLLeNFm11hNeUBCF4Lt6o9uH3lcTuPVyZAvbAt7xD66bKjyEUy3hrpSnruN+M0exdSjaV54PI9TBFkUmmqpXsrWzMj1QaxBxZMq3xaBxTsFvW2nEx0rPOrnltQM4bdAvmvSXtuxLw6e5iCaAy1eoTHw0N6IfeGvwcHXIlCT25gH1gRfS0/NdR9cs78ylxYTLDnNvkxL1J3cVzVHJ/ZfOOWOCK4iJ/K8PIbSnYsBkSnrIlDX27PM7DZCBu+xhIwV5z4hRwwZZG5VcU+nDZZYr4xtpPbQcIQWYjVwr5vF3vehk57ymIWLwNqU/rSnZ0wZH8MURhVFaNOdr/0184Z1dJZ34u3NbIBxEV9XsjAh/L52Dt7DNHWqUJKIL1/NV96LKDqHKCXCRFBOh9BgqJUIAXoDdWLtBunFKu/tgCz0n7SIPSZDxJDhF4StAhFbGCHP9NIMvB890FjJE/vys/PuY3efX1GjTdAijRa019M2f8d0OnJpktNwCIMxEjvKyGQKGPLtTS8o0UAgLfV50Zuhg7H5j6RAJoSgFOtlosnFzwNuxxU05ozHuJ59wsmn5LMK97sbow== I don't have to type a long password anymore!



-rw-rw-r-- 1 kay kay 771 Apr 23  2018 /home/kay/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCzAsDwjb0ft4IO7Kyux8DWocNiS1aJqpdVEo+gfk8Ng624b9qOQp7LOWDMVIINfCuzkTA3ZugSyo1OehPc0iyD7SfJIMzsETFvlHB3DlLLeNFm11hNeUBCF4Lt6o9uH3lcTuPVyZAvbAt7xD66bKjyEUy3hrpSnruN+M0exdSjaV54PI9TBFkUmmqpXsrWzMj1QaxBxZMq3xaBxTsFvW2nEx0rPOrnltQM4bdAvmvSXtuxLw6e5iCaAy1eoTHw0N6IfeGvwcHXIlCT25gH1gRfS0/NdR9cs78ylxYTLDnNvkxL1J3cVzVHJ/ZfOOWOCK4iJ/K8PIbSnYsBkSnrIlDX27PM7DZCBu+xhIwV5z4hRwwZZG5VcU+nDZZYr4xtpPbQcIQWYjVwr5vF3vehk57ymIWLwNqU/rSnZ0wZH8MURhVFaNOdr/0184Z1dJZ34u3NbIBxEV9XsjAh/L52Dt7DNHWqUJKIL1/NV96LKDqHKCXCRFBOh9BgqJUIAXoDdWLtBunFKu/tgCz0n7SIPSZDxJDhF4StAhFbGCHP9NIMvB890FjJE/vys/PuY3efX1GjTdAijRa019M2f8d0OnJpktNwCIMxEjvKyGQKGPLtTS8o0UAgLfV50Zuhg7H5j6RAJoSgFOtlosnFzwNuxxU05ozHuJ59wsmn5LMK97sbow== I don't have to type a long password anymore!

-rw-r--r-- 1 root root 601 Apr 17  2018 /etc/ssh/ssh_host_dsa_key.pub
-rw-r--r-- 1 root root 173 Apr 17  2018 /etc/ssh/ssh_host_ecdsa_key.pub
-rw-r--r-- 1 root root 93 Apr 17  2018 /etc/ssh/ssh_host_ed25519_key.pub
-rw-r--r-- 1 root root 393 Apr 17  2018 /etc/ssh/ssh_host_rsa_key.pub
-rw-r--r-- 1 kay kay 771 Apr 19  2018 /home/kay/.ssh/id_rsa.pub

Port 22
PermitRootLogin prohibit-password
PubkeyAuthentication yes
PermitEmptyPasswords no
ChallengeResponseAuthentication no
UsePAM yes

══╣ Possible private SSH keys were found!
/home/kay/.ssh/id_rsa

══╣ Some certificates were found (out limited):
/etc/ssl/certs/ACCVRAIZ1.pem                                                                                                                         
/etc/ssl/certs/ACEDICOM_Root.pem
/etc/ssl/certs/AC_RAIZ_FNMT-RCM.pem
/etc/ssl/certs/Actalis_Authentication_Root_CA.pem
/etc/ssl/certs/AddTrust_External_Root.pem
/etc/ssl/certs/AddTrust_Low-Value_Services_Root.pem
/etc/ssl/certs/AddTrust_Public_Services_Root.pem
/etc/ssl/certs/AddTrust_Qualified_Certificates_Root.pem
/etc/ssl/certs/AffirmTrust_Commercial.pem
/etc/ssl/certs/AffirmTrust_Networking.pem
/etc/ssl/certs/AffirmTrust_Premium_ECC.pem
/etc/ssl/certs/AffirmTrust_Premium.pem
/etc/ssl/certs/Amazon_Root_CA_1.pem
/etc/ssl/certs/Amazon_Root_CA_2.pem
/etc/ssl/certs/Amazon_Root_CA_3.pem
/etc/ssl/certs/Amazon_Root_CA_4.pem
/etc/ssl/certs/Atos_TrustedRoot_2011.pem
/etc/ssl/certs/Autoridad_de_Certificacion_Firmaprofesional_CIF_A62634068.pem
/etc/ssl/certs/Baltimore_CyberTrust_Root.pem
/etc/ssl/certs/Buypass_Class_2_Root_CA.pem
1518PSTORAGE_CERTSBIN

══╣ Some home ssh config file was found
/usr/share/doc/openssh-client/examples/sshd_config                                                                                                   
AuthorizedKeysFile      .ssh/authorized_keys
Subsystem       sftp    /usr/lib/openssh/sftp-server

══╣ /etc/hosts.allow file found, trying to read the rules:
/etc/hosts.allow                                                                                                                                     


Searching inside /etc/ssh/ssh_config for interesting info
Host *
    SendEnv LANG LC_*
    HashKnownHosts yes
    GSSAPIAuthentication yes
    GSSAPIDelegateCredentials no

╔══════════╣ Analyzing PAM Auth Files (limit 70)
drwxr-xr-x 2 root root 4096 Apr 19  2018 /etc/pam.d                                                                                                  
-rw-r--r-- 1 root root 2133 Jan 18  2018 /etc/pam.d/sshd
account    required     pam_nologin.so
session [success=ok ignore=ignore module_unknown=ignore default=bad]        pam_selinux.so close
session    required     pam_loginuid.so
session    optional     pam_keyinit.so force revoke
session    optional     pam_motd.so  motd=/run/motd.dynamic
session    optional     pam_motd.so noupdate
session    optional     pam_mail.so standard noenv # [1]
session    required     pam_limits.so
session    required     pam_env.so # [1]
session    required     pam_env.so user_readenv=1 envfile=/etc/default/locale
session [success=ok ignore=ignore module_unknown=ignore default=bad]        pam_selinux.so open


╔══════════╣ Searching kerberos conf files and tickets
╚ http://book.hacktricks.xyz/linux-hardening/privilege-escalation/linux-active-directory                                                             
ptrace protection is enabled (1), you need to disable it to search for tickets inside processes memory                                               
-rw-r--r-- 1 root root 89 Jul 21  2015 /usr/share/samba/setup/krb5.conf
[libdefaults]
        default_realm = ${REALM}
        dns_lookup_realm = false
        dns_lookup_kdc = true
tickets kerberos Not Found
klist Not Found                                                                                                                                      
                                                                                                                                                     


╔══════════╣ Searching AD cached hashes
-rw------- 1 root root 430080 Apr 19  2018 /var/lib/samba/private/secrets.tdb                                                                        

╔══════════╣ Searching tmux sessions
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#open-shell-sessions                                                               
tmux 2.1                                                                                                                                             


/tmp/tmux-1001
╔══════════╣ Analyzing Keyring Files (limit 70)
drwxr-xr-x 2 root root 4096 Apr 17  2018 /usr/share/keyrings                                                                                         
drwxr-xr-x 2 root root 4096 Apr 17  2018 /var/lib/apt/keyrings




╔══════════╣ Searching uncommon passwd files (splunk)
passwd file: /etc/pam.d/passwd                                                                                                                       
passwd file: /etc/passwd
passwd file: /usr/share/bash-completion/completions/passwd
passwd file: /usr/share/lintian/overrides/passwd

╔══════════╣ Analyzing PGP-GPG Files (limit 70)
/usr/bin/gpg                                                                                                                                         
gpg Not Found
netpgpkeys Not Found                                                                                                                                 
netpgp Not Found                                                                                                                                     
                                                                                                                                                     
-rw-r--r-- 1 root root 12255 Aug  1  2017 /etc/apt/trusted.gpg
-rw-r--r-- 1 root root 12335 May 18  2012 /usr/share/keyrings/ubuntu-archive-keyring.gpg
-rw-r--r-- 1 root root 0 May 18  2012 /usr/share/keyrings/ubuntu-archive-removed-keys.gpg
-rw-r--r-- 1 root root 2294 Nov 11  2013 /usr/share/keyrings/ubuntu-cloudimage-keyring.gpg
-rw-r--r-- 1 root root 0 Nov 11  2013 /usr/share/keyrings/ubuntu-cloudimage-keyring-removed.gpg
-rw-r--r-- 1 root root 1227 May 18  2012 /usr/share/keyrings/ubuntu-master-keyring.gpg
-rw-r--r-- 1 root root 2256 Feb 26  2016 /usr/share/popularity-contest/debian-popcon.gpg
-rw-r--r-- 1 root root 12335 Aug  1  2017 /var/lib/apt/keyrings/ubuntu-archive-keyring.gpg


╔══════════╣ Analyzing Cache Vi Files (limit 70)
                                                                                                                                                     
-rw------- 1 root kay 538 Apr 23  2018 /home/kay/.viminfo


╔══════════╣ Analyzing Postfix Files (limit 70)
-rw-r--r-- 1 root root 694 May 18  2016 /usr/share/bash-completion/completions/postfix                                                               


╔══════════╣ Analyzing Samba Files (limit 70)
smbstatus only works as root!                                                                                                                        
-rw-r--r-- 1 root root 278 Apr 19  2018 /etc/samba/smb.conf

guest ok = yes

-rw-r--r-- 1 root root 9542 Mar  7  2018 /usr/share/samba/smb.conf
;   logon script = logon.cmd
;   
;   
;   create mask = 0700
;   directory mask = 0700
;   guest ok = yes
;   
# The path below should be writable by all users so that their
;   
;   
;   create mask = 0600
;   directory mask = 0700
   
   
   
   create mask = 0700
   browseable = yes
   
   

╔══════════╣ Analyzing Other Interesting Files (limit 70)
-rw-r--r-- 1 root root 3771 Aug 31  2015 /etc/skel/.bashrc                                                                                           
-rw-r--r-- 1 kay kay 3771 Apr 17  2018 /home/kay/.bashrc



-rw------- 1 root jan 47 Apr 23  2018 /home/jan/.lesshst
-rw------- 1 root kay 119 Apr 23  2018 /home/kay/.lesshst


-rw-r--r-- 1 root root 655 May 16  2017 /etc/skel/.profile
-rw-r--r-- 1 kay kay 655 Apr 17  2018 /home/kay/.profile



-rw-r--r-- 1 kay kay 0 Apr 17  2018 /home/kay/.sudo_as_admin_successful



                      ╔════════════════════════════════════╗
══════════════════════╣ Files with Interesting Permissions ╠══════════════════════                                                                   
                      ╚════════════════════════════════════╝                                                                                         
╔══════════╣ SUID - Check easy privesc, exploits and write perms
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-and-suid                                                                     
strings Not Found                                                                                                                                    
-rwsr-xr-x 1 root root 39K Jun 14  2017 /usr/lib/x86_64-linux-gnu/lxc/lxc-user-nic                                                                   
-rwsr-xr-x 1 root root 15K Jan 17  2016 /usr/lib/policykit-1/polkit-agent-helper-1
-rwsr-xr-x 1 root root 10K Mar 27  2017 /usr/lib/eject/dmcrypt-get-device
-rwsr-sr-x 1 root root 84K Nov 30  2017 /usr/lib/snapd/snap-confine  --->  Ubuntu_snapd<2.37_dirty_sock_Local_Privilege_Escalation(CVE-2019-7304)
-rwsr-xr-x 1 root root 419K Jan 18  2018 /usr/lib/openssh/ssh-keysign
-rwsr-xr-- 1 root messagebus 42K Jan 12  2017 /usr/lib/dbus-1.0/dbus-daemon-launch-helper
-rwsr-xr-x 1 root root 2.4M Nov 24  2016 /usr/bin/vim.basic (Unknown SUID binary!)
-rwsr-xr-x 1 root root 23K Jan 17  2016 /usr/bin/pkexec  --->  Linux4.10_to_5.1.17(CVE-2019-13272)/rhel_6(CVE-2011-1485)
-rwsr-xr-x 1 root root 39K May 16  2017 /usr/bin/newgrp  --->  HP-UX_10.20
-rwsr-xr-x 1 root root 49K May 16  2017 /usr/bin/chfn  --->  SuSE_9.3/10
-rwsr-xr-x 1 root root 134K Jul  4  2017 /usr/bin/sudo  --->  check_if_the_sudo_version_is_vulnerable
-rwsr-xr-x 1 root root 40K May 16  2017 /usr/bin/chsh
-rwsr-xr-x 1 root root 33K May 16  2017 /usr/bin/newgidmap
-rwsr-sr-x 1 daemon daemon 51K Jan 14  2016 /usr/bin/at  --->  RTru64_UNIX_4.0g(CVE-2002-1614)
-rwsr-xr-x 1 root root 74K May 16  2017 /usr/bin/gpasswd
-rwsr-xr-x 1 root root 33K May 16  2017 /usr/bin/newuidmap
-rwsr-xr-x 1 root root 53K May 16  2017 /usr/bin/passwd  --->  Apple_Mac_OSX(03-2006)/Solaris_8/9(12-2004)/SPARC_8/9/Sun_Solaris_2.3_to_2.5.1(02-1997)                                                                                                                                                    
-rwsr-xr-x 1 root root 40K May 16  2017 /bin/su
-rwsr-xr-x 1 root root 139K Jan 28  2017 /bin/ntfs-3g  --->  Debian9/8/7/Ubuntu/Gentoo/others/Ubuntu_Server_16.10_and_others(02-2017)
-rwsr-xr-x 1 root root 44K May  7  2014 /bin/ping6
-rwsr-xr-x 1 root root 27K Nov 30  2017 /bin/umount  --->  BSD/Linux(08-1996)
-rwsr-xr-x 1 root root 31K Jul 12  2016 /bin/fusermount
-rwsr-xr-x 1 root root 40K Nov 30  2017 /bin/mount  --->  Apple_Mac_OSX(Lion)_Kernel_xnu-1699.32.7_except_xnu-1699.24.8
-rwsr-xr-x 1 root root 44K May  7  2014 /bin/ping

╔══════════╣ SGID
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-and-suid                                                                     
-rwxr-sr-x 1 root shadow 35K Apr  9  2018 /sbin/unix_chkpwd                                                                                          
-rwxr-sr-x 1 root shadow 35K Apr  9  2018 /sbin/pam_extrausers_chkpwd
-rwxr-sr-x 1 root utmp 10K Mar 11  2016 /usr/lib/x86_64-linux-gnu/utempter/utempter
-rwsr-sr-x 1 root root 84K Nov 30  2017 /usr/lib/snapd/snap-confine  --->  Ubuntu_snapd<2.37_dirty_sock_Local_Privilege_Escalation(CVE-2019-7304)
-rwxr-sr-x 1 root crontab 36K Apr  5  2016 /usr/bin/crontab
-rwxr-sr-x 1 root tty 15K Mar  1  2016 /usr/bin/bsd-write
-rwxr-sr-x 1 root shadow 61K May 16  2017 /usr/bin/chage
-rwxr-sr-x 1 root ssh 351K Jan 18  2018 /usr/bin/ssh-agent
-rwxr-sr-x 1 root shadow 23K May 16  2017 /usr/bin/expiry
-rwxr-sr-x 1 root tty 27K Nov 30  2017 /usr/bin/wall
-rwxr-sr-x 1 root utmp 425K Feb  7  2016 /usr/bin/screen  --->  GNU_Screen_4.5.0
-rwsr-sr-x 1 daemon daemon 51K Jan 14  2016 /usr/bin/at  --->  RTru64_UNIX_4.0g(CVE-2002-1614)
-rwxr-sr-x 1 root mlocate 39K Nov 18  2014 /usr/bin/mlocate

╔══════════╣ Checking misconfigurations of ld.so
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#ld.so                                                                             
/etc/ld.so.conf                                                                                                                                      
Content of /etc/ld.so.conf:                                                                                                                          
include /etc/ld.so.conf.d/*.conf

/etc/ld.so.conf.d
  /etc/ld.so.conf.d/libc.conf                                                                                                                        
  - /usr/local/lib                                                                                                                                   
  /etc/ld.so.conf.d/x86_64-linux-gnu.conf
  - /lib/x86_64-linux-gnu                                                                                                                            
  - /usr/lib/x86_64-linux-gnu
  /etc/ld.so.conf.d/x86_64-linux-gnu_GL.conf
  - /usr/lib/x86_64-linux-gnu/mesa                                                                                                                   

/etc/ld.so.preload
╔══════════╣ Capabilities                                                                                                                            
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#capabilities                                                                      
══╣ Current shell capabilities                                                                                                                       
CapInh:  0x0000000000000000=                                                                                                                         
CapPrm:  0x0000000000000000=
CapEff:  0x0000000000000000=
CapBnd:  0x0000003fffffffff=cap_chown,cap_dac_override,cap_dac_read_search,cap_fowner,cap_fsetid,cap_kill,cap_setgid,cap_setuid,cap_setpcap,cap_linux_immutable,cap_net_bind_service,cap_net_broadcast,cap_net_admin,cap_net_raw,cap_ipc_lock,cap_ipc_owner,cap_sys_module,cap_sys_rawio,cap_sys_chroot,cap_sys_ptrace,cap_sys_pacct,cap_sys_admin,cap_sys_boot,cap_sys_nice,cap_sys_resource,cap_sys_time,cap_sys_tty_config,cap_mknod,cap_lease,cap_audit_write,cap_audit_control,cap_setfcap,cap_mac_override,cap_mac_admin,cap_syslog,cap_wake_alarm,cap_block_suspend,37
CapAmb:  0x0000000000000000=

══╣ Parent process capabilities
CapInh:  0x0000000000000000=                                                                                                                         
CapPrm:  0x0000000000000000=
CapEff:  0x0000000000000000=
CapBnd:  0x0000003fffffffff=cap_chown,cap_dac_override,cap_dac_read_search,cap_fowner,cap_fsetid,cap_kill,cap_setgid,cap_setuid,cap_setpcap,cap_linux_immutable,cap_net_bind_service,cap_net_broadcast,cap_net_admin,cap_net_raw,cap_ipc_lock,cap_ipc_owner,cap_sys_module,cap_sys_rawio,cap_sys_chroot,cap_sys_ptrace,cap_sys_pacct,cap_sys_admin,cap_sys_boot,cap_sys_nice,cap_sys_resource,cap_sys_time,cap_sys_tty_config,cap_mknod,cap_lease,cap_audit_write,cap_audit_control,cap_setfcap,cap_mac_override,cap_mac_admin,cap_syslog,cap_wake_alarm,cap_block_suspend,37
CapAmb:  0x0000000000000000=


Files with capabilities (limited to 50):
/usr/bin/mtr = cap_net_raw+ep
/usr/bin/systemd-detect-virt = cap_dac_override,cap_sys_ptrace+ep
/usr/bin/traceroute6.iputils = cap_net_raw+ep

╔══════════╣ AppArmor binary profiles
-rw-r--r-- 1 root root  3310 Apr 12  2016 sbin.dhclient                                                                                              
-rw-r--r-- 1 root root   125 Jun 14  2017 usr.bin.lxc-start
-rw-r--r-- 1 root root   281 May 23  2017 usr.lib.lxd.lxd-bridge-proxy
-rw-r--r-- 1 root root 23155 Nov 30  2017 usr.lib.snapd.snap-confine.real
-rw-r--r-- 1 root root  1527 Jan  5  2016 usr.sbin.rsyslogd
-rw-r--r-- 1 root root  1469 Sep  8  2017 usr.sbin.tcpdump

╔══════════╣ Files with ACLs (limited to 50)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#acls                                                                              
files with acls in searched folders Not Found                                                                                                        
                                                                                                                                                     
╔══════════╣ Files (scripts) in /etc/profile.d/
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#profiles-files                                                                    
total 24                                                                                                                                             
drwxr-xr-x  2 root root 4096 Apr 17  2018 .
drwxr-xr-x 99 root root 4096 Nov 15  2018 ..
-rw-r--r--  1 root root  580 Nov 30  2017 apps-bin-path.sh
-rw-r--r--  1 root root  663 May 18  2016 bash_completion.sh
-rw-r--r--  1 root root 1003 Dec 29  2015 cedilla-portuguese.sh
-rw-r--r--  1 root root 1557 Apr 14  2016 Z97-byobu.sh

╔══════════╣ Permissions in init, init.d, systemd, and rc.d
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#init-init-d-systemd-and-rc-d                                                      
                                                                                                                                                     
═╣ Hashes inside passwd file? ........... No
═╣ Writable passwd file? ................ No                                                                                                         
═╣ Credentials in fstab/mtab? ........... No                                                                                                         
═╣ Can I read shadow files? ............. No                                                                                                         
═╣ Can I read shadow plists? ............ No                                                                                                         
═╣ Can I write shadow plists? ........... No                                                                                                         
═╣ Can I read opasswd file? ............. No                                                                                                         
═╣ Can I write in network-scripts? ...... No                                                                                                         
═╣ Can I read root folder? .............. No                                                                                                         
                                                                                                                                                     
╔══════════╣ Searching root files in home dirs (limit 30)
/home/                                                                                                                                               
/home/jan
/home/jan/.lesshst
/home/kay/.viminfo
/home/kay/.lesshst
/root/
/var/www
/var/www/html
/var/www/html/development/dev.txt
/var/www/html/development/j.txt

╔══════════╣ Searching folders owned by me containing others files on it (limit 100)
-rw-r--r-- 1 root root 0 Oct 19 08:12 /var/lib/lxcfs/cgroup/name=systemd/user.slice/user-1001.slice/user@1001.service/cgroup.clone_children          
-rw-r--r-- 1 root root 0 Oct 19 08:12 /var/lib/lxcfs/cgroup/name=systemd/user.slice/user-1001.slice/user@1001.service/notify_on_release

╔══════════╣ Readable files belonging to root and readable by me but not world readable
                                                                                                                                                     
╔══════════╣ Interesting writable files owned by me or writable by everyone (not in Home) (max 500)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-files                                                                    
/dev/mqueue                                                                                                                                          
/dev/shm
/dev/shm/linpeas.sh
/run/lock
/run/user/1001
/run/user/1001/systemd
/tmp
/tmp/.font-unix
/tmp/.ICE-unix
/tmp/.Test-unix
/tmp/tmux-1001
/tmp/.X11-unix
#)You_can_write_even_more_files_inside_last_directory

/var/crash
/var/lib/lxcfs/cgroup/memory/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/init.scope/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/accounts-daemon.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/acpid.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/apache2.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/apparmor.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/apport.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/atd.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/console-setup.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/cron.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/dbus.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/dev-disk-byx2duuid-db3bdca8x2d5517x2d4600x2db896x2de8479e05e44a.swap/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/dev-hugepages.mount/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/dev-mqueue.mount/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/dev-xvda5.swap/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/grub-common.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/ifup@eth0.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/irqbalance.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/iscsid.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/keyboard-setup.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/kmod-static-nodes.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/lvm2-lvmetad.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/lvm2-monitor.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/lxcfs.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/lxd-containers.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/mdadm.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/-.mount/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/networking.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/nmbd.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/ondemand.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/open-iscsi.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/polkitd.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/proc-sys-fs-binfmt_misc.mount/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/rc-local.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/resolvconf.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/rsyslog.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/run-user-1001.mount/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/samba-ad-dc.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/setvtrgb.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/smbd.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/snapd.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/ssh.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/sys-fs-fuse-connections.mount/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/sys-kernel-debug.mount/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/systemd-journald.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/systemd-journal-flush.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/systemd-logind.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/systemd-modules-load.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/systemd-random-seed.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/systemd-remount-fs.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/systemd-sysctl.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/systemd-timesyncd.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/systemd-tmpfiles-setup-dev.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/systemd-tmpfiles-setup.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/systemd-udevd.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/systemd-udev-trigger.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/systemd-update-utmp.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/systemd-user-sessions.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/system-getty.slice/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/system-serialx2dgetty.slice/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/tomcat.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/ufw.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/unattended-upgrades.service/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/system.slice/var-lib-lxcfs.mount/cgroup.event_control
/var/lib/lxcfs/cgroup/memory/user.slice/cgroup.event_control
/var/lib/lxcfs/cgroup/name=systemd/user.slice/user-1001.slice/user@1001.service
/var/lib/lxcfs/cgroup/name=systemd/user.slice/user-1001.slice/user@1001.service/cgroup.procs
/var/lib/lxcfs/cgroup/name=systemd/user.slice/user-1001.slice/user@1001.service/init.scope
/var/lib/lxcfs/cgroup/name=systemd/user.slice/user-1001.slice/user@1001.service/init.scope/cgroup.clone_children
/var/lib/lxcfs/cgroup/name=systemd/user.slice/user-1001.slice/user@1001.service/init.scope/cgroup.procs
/var/lib/lxcfs/cgroup/name=systemd/user.slice/user-1001.slice/user@1001.service/init.scope/notify_on_release
/var/lib/lxcfs/cgroup/name=systemd/user.slice/user-1001.slice/user@1001.service/init.scope/tasks
/var/lib/lxcfs/cgroup/name=systemd/user.slice/user-1001.slice/user@1001.service/tasks
/var/spool/samba
/var/tmp

╔══════════╣ Interesting GROUP writable files (not in Home) (max 500)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-files                                                                    
                                                                                                                                                     


                            ╔═════════════════════════╗
════════════════════════════╣ Other Interesting Files ╠════════════════════════════                                                                  
                            ╚═════════════════════════╝                                                                                              
╔══════════╣ .sh files in path
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#script-binaries-in-path                                                           
/usr/bin/gettext.sh                                                                                                                                  

╔══════════╣ Executable files potentially added by user (limit 70)
                                                                                                                                                     
╔══════════╣ Unexpected in /opt (usually empty)
total 18416                                                                                                                                          
drwxr-xr-x  3 root    root       4096 Apr 23  2018 .
drwxr-xr-x 24 root    root       4096 Apr 23  2018 ..
drwxr-xr-x  9 tomcat9 tomcat9    4096 Oct 19 07:36 apache-tomcat-9.0.7
-rw-r--r--  1 root    root    9517889 Apr  3  2018 apache-tomcat-9.0.7.tar.gz
-rw-r--r--  1 root    root    9323198 Jul  6  2017 struts2-rest-showcase-2.5.12.war
lrwxrwxrwx  1 tomcat9 tomcat9      19 Apr 18  2018 tomcat-latest -> apache-tomcat-9.0.7

╔══════════╣ Unexpected in root
/.bash_history                                                                                                                                       
/initrd.img.old
/vmlinuz.old
/vmlinuz
/samba
/initrd.img

╔══════════╣ Modified interesting files in the last 5mins (limit 100)
/var/log/syslog                                                                                                                                      
/var/log/auth.log
/var/log/kern.log

logrotate 3.8.7

╔══════════╣ Files inside /home/jan (limit 20)
total 12                                                                                                                                             
drwxr-xr-x 2 root root 4096 Apr 23  2018 .
drwxr-xr-x 4 root root 4096 Apr 19  2018 ..
-rw------- 1 root jan    47 Apr 23  2018 .lesshst

╔══════════╣ Files inside others home (limit 20)
/home/kay/.profile                                                                                                                                   
/home/kay/.viminfo
/home/kay/.bashrc
/home/kay/.bash_history
/home/kay/.lesshst
/home/kay/.ssh/authorized_keys
/home/kay/.ssh/id_rsa
/home/kay/.ssh/id_rsa.pub
/home/kay/.bash_logout
/home/kay/.sudo_as_admin_successful
/home/kay/pass.bak
/var/www/html/index.html
/var/www/html/development/dev.txt
/var/www/html/development/j.txt

╔══════════╣ Searching installed mail applications
                                                                                                                                                     
╔══════════╣ Mails (limit 50)
                                                                                                                                                     
╔══════════╣ Backup files (limited 100)
-rw-r--r-- 1 root root 610 Apr 17  2018 /etc/xml/catalog.old                                                                                         
-rw-r--r-- 1 root root 673 Apr 17  2018 /etc/xml/xml-core.xml.old
-rw-r--r-- 1 root root 9542 Apr 19  2018 /etc/samba/smb.conf.bak
-rw-r--r-- 1 root root 128 Apr 17  2018 /var/lib/sgml-base/supercatalog.old
-rw-r--r-- 1 root root 190367 Jul 18  2017 /usr/src/linux-headers-4.4.0-87-generic/.config.old
-rw-r--r-- 1 root root 0 Jul 18  2017 /usr/src/linux-headers-4.4.0-87-generic/include/config/net/team/mode/activebackup.h
-rw-r--r-- 1 root root 0 Jul 18  2017 /usr/src/linux-headers-4.4.0-87-generic/include/config/wm831x/backup.h
-rw-r--r-- 1 root root 190615 Apr  2  2018 /usr/src/linux-headers-4.4.0-119-generic/.config.old
-rw-r--r-- 1 root root 0 Apr  2  2018 /usr/src/linux-headers-4.4.0-119-generic/include/config/net/team/mode/activebackup.h
-rw-r--r-- 1 root root 0 Apr  2  2018 /usr/src/linux-headers-4.4.0-119-generic/include/config/wm831x/backup.h
-rwxr-xr-x 1 root root 226 Apr 14  2016 /usr/share/byobu/desktop/byobu.desktop.old
-rw-r--r-- 1 root root 11358 Apr 17  2018 /usr/share/info/dir.old
-rw-r--r-- 1 root root 665 Apr 16  2016 /usr/share/man/man8/vgcfgbackup.8.gz
-rw-r--r-- 1 root root 1624 Mar 14  2016 /usr/share/man/man8/tdbbackup.tdbtools.8.gz
-rw-r--r-- 1 root root 298768 Dec 29  2015 /usr/share/doc/manpages/Changes.old.gz
-rw-r--r-- 1 root root 7867 May  6  2015 /usr/share/doc/telnet/README.telnet.old.gz
-rw-r--r-- 1 root root 31600 Feb 15  2018 /usr/lib/open-vm-tools/plugins/vmsvc/libvmbackup.so
-rwxr-xr-x 1 root root 10504 Mar 14  2016 /usr/bin/tdbbackup.tdbtools
-rw-r--r-- 1 root root 8710 Jul 18  2017 /lib/modules/4.4.0-87-generic/kernel/drivers/net/team/team_mode_activebackup.ko
-rw-r--r-- 1 root root 8990 Jul 18  2017 /lib/modules/4.4.0-87-generic/kernel/drivers/power/wm831x_backup.ko
-rw-r--r-- 1 root root 8710 Apr  2  2018 /lib/modules/4.4.0-119-generic/kernel/drivers/net/team/team_mode_activebackup.ko
-rw-r--r-- 1 root root 8990 Apr  2  2018 /lib/modules/4.4.0-119-generic/kernel/drivers/power/wm831x_backup.ko

╔══════════╣ Searching tables inside readable .db/.sql/.sqlite files (limit 100)
Found /var/lib/mlocate/mlocate.db: regular file, no read permission                                                                                  
Found /var/lib/nssdb/cert9.db: SQLite 3.x database
Found /var/lib/nssdb/key4.db: SQLite 3.x database
Found /var/lib/nssdb/secmod.db: Berkeley DB 1.85 (Hash, version 2, native byte-order)

 -> Extracting tables from /var/lib/nssdb/cert9.db (limit 20)
 -> Extracting tables from /var/lib/nssdb/key4.db (limit 20)                                                                                         
                                                                                                                                                     
╔══════════╣ Web files?(output limit)
/var/www/:                                                                                                                                           
total 12K
drwxr-xr-x  3 root root 4.0K Apr 18  2018 .
drwxr-xr-x 14 root root 4.0K Apr 18  2018 ..
drwxr-xr-x  3 root root 4.0K Apr 23  2018 html

/var/www/html:
total 16K
drwxr-xr-x 3 root     root     4.0K Apr 23  2018 .
drwxr-xr-x 3 root     root     4.0K Apr 18  2018 ..

╔══════════╣ All relevant hidden files (not in /sys/ or the ones listed in the previous check) (limit 70)
-rw-r--r-- 1 root root 0 Apr 18  2018 /etc/.java/.systemPrefs/.system.lock                                                                           
-rw-r--r-- 1 root root 0 Apr 18  2018 /etc/.java/.systemPrefs/.systemRootModFile
-rw-r--r-- 1 root root 220 Aug 31  2015 /etc/skel/.bash_logout
-rw------- 1 root root 0 Aug  1  2017 /etc/.pwd.lock
-rw-r--r-- 1 root root 1391 Apr 17  2018 /etc/apparmor.d/cache/.features
-rw-r--r-- 1 root root 0 Oct 19 07:36 /run/network/.ifstate.lock
-rw-r--r-- 1 root root 2600 Mar 14  2018 /usr/lib/jvm/.java-1.8.0-openjdk-amd64.jinfo
-rw-r--r-- 1 kay kay 220 Apr 17  2018 /home/kay/.bash_logout

╔══════════╣ Readable files inside /tmp, /var/tmp, /private/tmp, /private/var/at/tmp, /private/var/tmp, and backup folders (limit 70)
                                                                                                                                                     
╔══════════╣ Searching passwords in history files
                                                                                                                                                     
╔══════════╣ Searching *password* or *credential* files in home (limit 70)
/bin/systemd-ask-password                                                                                                                            
/bin/systemd-tty-ask-password-agent
/etc/java-8-openjdk/management/jmxremote.password
/etc/pam.d/common-password
/usr/lib/git-core/git-credential
/usr/lib/git-core/git-credential-cache
/usr/lib/git-core/git-credential-cache--daemon
/usr/lib/git-core/git-credential-store
  #)There are more creds/passwds files in the previous parent folder

/usr/lib/grub/i386-pc/password.mod
/usr/lib/grub/i386-pc/password_pbkdf2.mod
/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/management/jmxremote.password
/usr/lib/python2.7/dist-packages/samba/credentials.so
/usr/lib/python2.7/dist-packages/samba/tests/credentials.py
/usr/lib/python2.7/dist-packages/samba/tests/credentials.pyc
/usr/lib/x86_64-linux-gnu/libsamba-credentials.so.0
/usr/lib/x86_64-linux-gnu/libsamba-credentials.so.0.0.1
/usr/lib/x86_64-linux-gnu/samba/ldb/local_password.so
/usr/lib/x86_64-linux-gnu/samba/ldb/password_hash.so
/usr/lib/x86_64-linux-gnu/samba/libcmdline-credentials.so.0
/usr/share/dns/root.key
/usr/share/doc/git/contrib/credential
/usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring.c
/usr/share/doc/git/contrib/credential/netrc/git-credential-netrc
/usr/share/doc/git/contrib/credential/osxkeychain/git-credential-osxkeychain.c
/usr/share/doc/git/contrib/credential/wincred/git-credential-wincred.c
/usr/share/locale-langpack/en_AU/LC_MESSAGES/ubuntuone-credentials.mo
/usr/share/locale-langpack/en_GB/LC_MESSAGES/ubuntuone-credentials.mo
/usr/share/man/man1/git-credential.1.gz
/usr/share/man/man1/git-credential-cache.1.gz
/usr/share/man/man1/git-credential-cache--daemon.1.gz
/usr/share/man/man1/git-credential-store.1.gz
  #)There are more creds/passwds files in the previous parent folder

/usr/share/man/man7/gitcredentials.7.gz
/usr/share/man/man8/systemd-ask-password-console.path.8.gz
/usr/share/man/man8/systemd-ask-password-console.service.8.gz
/usr/share/man/man8/systemd-ask-password-wall.path.8.gz
/usr/share/man/man8/systemd-ask-password-wall.service.8.gz
  #)There are more creds/passwds files in the previous parent folder

/usr/share/pam/common-password.md5sums
/var/cache/debconf/passwords.dat
/var/lib/pam/password

╔══════════╣ Checking for TTY (sudo/su) passwords in audit logs
                                                                                                                                                     
╔══════════╣ Searching passwords inside logs (limit 70)
2017-08-01 11:16:21 configure base-passwd:amd64 3.5.39 3.5.39                                                                                        
2017-08-01 11:16:21 install base-passwd:amd64 <none> 3.5.39
2017-08-01 11:16:21 status half-configured base-passwd:amd64 3.5.39
2017-08-01 11:16:21 status half-installed base-passwd:amd64 3.5.39
2017-08-01 11:16:21 status installed base-passwd:amd64 3.5.39
2017-08-01 11:16:21 status unpacked base-passwd:amd64 3.5.39
2017-08-01 11:16:23 status half-configured base-passwd:amd64 3.5.39
2017-08-01 11:16:23 status half-installed base-passwd:amd64 3.5.39
2017-08-01 11:16:23 status unpacked base-passwd:amd64 3.5.39
2017-08-01 11:16:23 upgrade base-passwd:amd64 3.5.39 3.5.39
2017-08-01 11:16:28 install passwd:amd64 <none> 1:4.2-3.1ubuntu5
2017-08-01 11:16:28 status half-installed passwd:amd64 1:4.2-3.1ubuntu5
2017-08-01 11:16:28 status unpacked passwd:amd64 1:4.2-3.1ubuntu5
2017-08-01 11:16:31 configure base-passwd:amd64 3.5.39 <none>
2017-08-01 11:16:31 status half-configured base-passwd:amd64 3.5.39
2017-08-01 11:16:31 status installed base-passwd:amd64 3.5.39
2017-08-01 11:16:31 status unpacked base-passwd:amd64 3.5.39
2017-08-01 11:16:37 configure passwd:amd64 1:4.2-3.1ubuntu5 <none>
2017-08-01 11:16:37 status half-configured passwd:amd64 1:4.2-3.1ubuntu5
2017-08-01 11:16:37 status installed passwd:amd64 1:4.2-3.1ubuntu5
2017-08-01 11:16:37 status unpacked passwd:amd64 1:4.2-3.1ubuntu5
2017-08-01 11:17:35 status half-configured passwd:amd64 1:4.2-3.1ubuntu5
2017-08-01 11:17:35 status half-installed passwd:amd64 1:4.2-3.1ubuntu5
2017-08-01 11:17:35 status unpacked passwd:amd64 1:4.2-3.1ubuntu5
2017-08-01 11:17:35 status unpacked passwd:amd64 1:4.2-3.1ubuntu5.3
2017-08-01 11:17:35 upgrade passwd:amd64 1:4.2-3.1ubuntu5 1:4.2-3.1ubuntu5.3
2017-08-01 11:17:36 configure passwd:amd64 1:4.2-3.1ubuntu5.3 <none>
2017-08-01 11:17:36 status half-configured passwd:amd64 1:4.2-3.1ubuntu5.3
2017-08-01 11:17:36 status installed passwd:amd64 1:4.2-3.1ubuntu5.3
2017-08-01 11:17:36 status unpacked passwd:amd64 1:4.2-3.1ubuntu5.3
 base-passwd depends on libc6 (>= 2.8); however:
 base-passwd depends on libdebconfclient0 (>= 0.145); however:
Description: Set up users and passwords
dpkg: base-passwd: dependency problems, but configuring anyway as you requested:
Preparing to unpack .../base-passwd_3.5.39_amd64.deb ...
Preparing to unpack .../passwd_1%3a4.2-3.1ubuntu5_amd64.deb ...
Selecting previously unselected package base-passwd.
Selecting previously unselected package passwd.
Setting up base-passwd (3.5.39) ...
Setting up passwd (1:4.2-3.1ubuntu5) ...
Shadow passwords are now on.
Unpacking base-passwd (3.5.39) ...
Unpacking base-passwd (3.5.39) over (3.5.39) ...
Unpacking passwd (1:4.2-3.1ubuntu5) ...



                                ╔════════════════╗
════════════════════════════════╣ API Keys Regex ╠════════════════════════════════                                                                   
                                ╚════════════════╝                                                                                                   
Regexes to search for API keys aren't activated, use param '-r' 


jan@basic2:/dev/shm$ 
```
