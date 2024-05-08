# External Vulnerability Assessment and Penetration Testing
You conduct vulnerability scanning from outside of the company’s network. External scanners usually target the IT infrastructure exposed to the internet, including open ports in the network firewall and web application firewalls.

### Basic Pre-Engagement
It is very tempting to start an external penetration test as soon as client asks us to. After all, we can perform this test from our current location (no need to travel to client’s site to perform test) and, Who cares about that silly thing called documentation? Turns out, except us, everyone.

Your client wants it so that they can compare, at the end of test, whether the entire perimeter has been accessed or not (in other words, did we leave anything out);

Your boss / management (any other role who is a decision maker in your hierarchy) wants it so that they know we didn’t do more than we were asked to (scope creep is not mythical) & that we did all that we were supposed to; So, here are the things that one should keep in mind before starting an external penetration test.

### Scope of work:

Few clients will share the list of external IP addresses to test and won’t be happy if you stray from that list. Few other clients would want you to tell them the attack surface (in other words, what IP addresses of ours are exposed publically) before they give us permission (for full or partial test).

### Type of test (Black box, Grey box, White box)

#### Black box:
We won’t tell you anything about our network, the type of machine under that IP, etc. We want to see what an external attacker would do.

Here, you will have to make it clear that uptime of external IPs are not your responsibility. You will need their IT staff to be on standby during the test so that they can monitor the network and devices for any performance hit. You will be expected to stop when they ask you to.

#### Grey-box:
We will give you some information (e.g., IP address space, type of devices, make / model, etc.).

The expectation here, from client, usually boils down to one line — now that we told you the things that we have on our external network (and potentially saved you lot of time), what vulnerabilities are we exposed to?

#### Is physical security testing part of scope?

If it is, I suggest you get your get-out-of-jail card before moving a muscle. Also called “Authorization letter”, this document (signed by an authorized signatory — may or may not be the CISO / CIO but the person who is legally authorized to sign agreements on behalf of the company) will help you when you get caught in a mis-understanding with local cops. The coalfire incident has shown how important is this document. So get this before starting the pentest of any service / infrastructure that is business / mission — critical for your client. TrustedSec has made a host of legal documentation available for no cost (thank you guys!) to facilitate legal boundaries around your physical security pentest. I recommend you have a look at them.

### Report Deadline

Very important. End of testing is different from end of engagement. Testing ends when it ends (!). However, reporting is another, separate activity. Reporting starts after testing is over. You must schedule some time for this.

Preferred timings of test Some client would want you to initiate the test when no one is in office (out of working hours). Few clients would ask you to initiate the test during working hours. You have to document this.

# Information gathering / Reconnaissance

Many people have written lot about it. However, i have few points to mention here. Whether you have IP address or a domain name, you need to find ASN (Autonomous System Number) belonging to that company first. The benefit — it will help you find all the IP ranges that belong to the company. You can use below links to find ASN from a domain name or IP address.

- [HackerTarget.com](https://hackertarget.com/as-ip-lookup/) - HackerTarget.com is an open-source platform that provides online security scanning solutions and assessments.
- [NetworksDB.io](https://networksdb.io/) - NetworksDB.io is a database of public networks, IP addresses, and domain names owned by companies and organizations worldwide.
- [Hurricane Electric BGP Toolkit](https://bgp.he.net/) - The Hurricane Electric BGP Toolkit is a tool that uses internal BGP data, data from routeviews, and other sources.
- [MX](https://mxtoolbox.com/NetworkTools.aspx) - MxToolbox is a tool that offers free and paid monitoring and lookup tools for email, DNS, blacklist, network performance, and websites.
- [ViewDNS.info](https://viewdns.info/) - ViewDNS.info is a source for DNS-related tools and information.
- You would also want to look at subdomain enumeration. Utilize the following tools.
- [OWASP Amass](https://github.com/owasp-amass/amass) : Discover targets for enumerations 
  ```
  amass intel -org TARGET
  ```

### Subdomain Enumeration

- [SubEnum](https://github.com/bing0o/SubEnum) - Bash script for Subdomain Enumeration using 4 tools and 3 online services
  ```
  $ subenum -d target.com              - Basic usage
  $ subenum -l domains.txt -r          - Agains a list of domains and Resolve The Found Subdomains
  ```
- [Sublist3r](https://github.com/aboul3la/Sublist3r) - Fast subdomains enumeration tool for penetration testers
  ```
  $ python sublist3r.py -d target.com                                       - To enumerate subdomains of specific domain.
  $ python sublist3r.py -e google,yahoo,virustotal -d target.com            - To enumerate subdomains and use specific engines such Google, Yahoo and Virustotal engines.
  ```
- [Amass](https://github.com/OWASP/Amass) - In-depth Attack Surface Mapping and Asset Discovery
  ```
  $ amass enum -passive -d target.com -src -config config.ini
  $ amass enum -active -d target.com -src -config config.ini
  ```
- [Findomain](https://github.com/Findomain/Findomain) - The fastest and cross-platform subdomain enumerator, do not waste your time.
  ```
  $ findomain -t target.com                                                  - To enumerate subdomains of specific domain.
  ```
- [censys-subdomain-finder](https://github.com/christophetd/censys-subdomain-finder) - Perform subdomain enumeration using the certificate transparency logs from Censys.
  ```
  $ python censys-subdomain-finder.py target.com -o output.txt              - Output the list of subdomains to a text file:
  ```
- [censys-enumeration](https://github.com/0xbharath/censys-enumeration) - A script to extract subdomains/emails for a given domain using SSL/TLS certificate dataset on Censys
  ```
  $ python censys_enumeration.py --no-emails targets.txt           - Only subdomain enumeration.
  $ python censys_enumeration.py --verbose targets.txt             - Verbose output
  ```
- [tugarecon](https://github.com/LordNeoStark/tugarecon) - Fast subdomains enumeration tool for penetration testers.
  ```
  $ python3 tugarecon.py -d target.com
  $ python3 tugarecon.py -d target.com --savemap
  $ python3 tugarecon.py -d target.com --bruteforce
  $ python3 tugarecon.py -d target.com --bruteforce --full
  $ python3 tugarecon.py -d target.com -b --full
  $ python3 tugarecon.py -r
  ```
- [knock](https://github.com/guelfoweb/knock) - Knockpy is a python tool designed to enumerate subdomains on a target domain through a wordlist.
  ```
  $ knockpy domain.com -o /path/to/new/folder
  ```
- [subfinder](https://github.com/projectdiscovery/subfinder) - Subfinder is a subdomain discovery tool that discovers valid subdomains for websites.
  ```
  $ subfinder -silent -d <target.com> -o <output.txt>
  ```
- [assetfinder](https://github.com/tomnomnom/assetfinder) - Find domains and subdomains related to a given domain
  ```
  $ assetfinder -subs-only <target.com> | tee <output.txt>
  ```
- [Crt.sh](https://crt.sh/) - Crt.sh is a website that can be used to find SSL or TLS certificates for a specific domain.
  ```
  $ curl -fsSL "https://crt.sh/?CN=%25.target.com&exclude=expired" | pup 'td :contains(".target.com") text{}' | sort -n | uniq -c | sort -rn | column -t
  ```

### Dorking: gain access to sensitive information

- [The Exploit Database](https://www.exploit-db.com/google-hacking-database)
- [Bug Bounty Helper](https://dorks.faisalahmed.me/)
- [Git Dork Helper](https://vsec7.github.io/)
- [Github Dorks](https://github.com/techgaun/github-dorks)
- [Shodan Dorks](https://github.com/humblelad/Shodan-Dorks)
- [Googler Dorking](https://github.com/jarun/googler)
  ```
  $ googler -n 100 -s 1 --np --unfilter site:*.target.com >> output.txt
  $ googler -n 100 -s 101 --np --unfilter site:*.target.com >> output.txt
  $ googler -n 100 -s 201 --np --unfilter site:*.target.com >> output.txt
  $ googler -n 100 -s 301 --np --unfilter site:*.target.com >> output.txt
  ```

This is where we interact directly with the client infrastructure. The tools that could be utilized in this activity include, but are not limited to, the following:-

### Port Scanning

- [nmap](https://github.com/nmap/nmap) - Nmap - the Network Mapper. Github mirror of the official SVN repository.
- [testssl](https://github.com/drwetter/testssl.sh) - Testing TLS/SSL encryption anywhere on any port.
- [RustScan](https://github.com/RustScan/RustScan) - The Modern Port Scanner
- [naabu](https://github.com/projectdiscovery/naabu) - A fast port scanner written in go with focus on reliability and simplicity.

## Nessus Vulnerability Scanner

Advanced Scan 
> Settings
  - DISCOVERY
    - Host Discovery
      -  - [x] UDP
     
    - Port Scanning
      - Port scan range: 0-65535
      -  - [x] UDP
     
> Plugins
  - Backdoors: `DISABLED`
  - Denial of Service: `DISABLED`

### FAQ
#### Why do we DISABLED these plugins?
- **Reduced Risk of System Disruption:** Disabling these plugins might prevent accidental crashes or outages caused by certain scans.
- **Compliance with Client Restrictions:** Some clients might prohibit these scans due to concerns about potential impacts.

**Backdoors Plugin:**
The Nessus Backdoors plugin family is a collection of plugins designed to detect the presence of backdoors on systems. Backdoors are unauthorized access points that attackers can use to gain remote control of a system. They can be installed in a variety of ways, such as through malware, vulnerabilities in software, or physical access to the system.

**Denial of Service:**
The Nessus Denial of Service plugin is a collection of plugins designed to detect vulnerabilities in systems that could be exploited to cause denial-of-service (DoS) attacks.
DoS attacks aim to overwhelm a system with traffic or requests, making it unavailable to legitimate users.

## Nmap: the Network Mapper - Free Security Scanner

### The six port states: 
`open`, `closed`, `filtered`, `unfiltered`, `open|filtered`, or `closed|filtered`.

- `open` - The Open state indicates that an application on the target system is actively listening for connections/packets on that port.

- `closed` - The Closed state indicates there isn’t any application listening on that port. However, the port state could change to Open in the future.

- `filtered` - The Filtered state indicates that either a firewall, a filter, or some kind of network hurdle is blocking the port and hence NMAP isn’t able to determine whether it is open or closed.

- `unfiltered` - The Unfiltered state indicates that ports are responding to NMAP probes; however, it isn’t possible to determine whether they are open or closed.

- `open|filtered` - he Open/Filtered state indicates that the port is either filtered or open; however, NMAP isn’t precisely able to determine the state.

- `closed|filtered` - The Closed/Filtered state indicates that the port is either filtered or closed; however, NMAP isn’t precisely able to determine the state.


### Port Scanning
By default, Nmap scans the 1,000 most popular ports. You can specify a different range of ports to scan using the `-p` flag. 

For example, to scan the ports 22, 80, and 443, you would use the following command:
```
nmap -p 22,80,443 scanme.nmap.org
```

You can also scan all 65,535 ports by using the `-p-` flag
```
nmap -p- scanme.nmap.org
```

### Service and Operating System Detection
Nmap can detect the services and operating systems running on a host. This information can be useful for security auditing and penetration testing. To detect services, Nmap uses a database of known services. To detect operating systems, Nmap uses a variety of methods, including fingerprinting.
```
nmap -sV -O scanme.nmap.org
```

### NSE Scripting
Nmap NSE (Nmap Scripting Engine) is a library of scripts that can be used to extend Nmap's functionality. NSE scripts can be used for a variety of purposes, including:
- Port scanning
- Service detection
- Operating system detection
- Vulnerability detection
- Intrusion detection

NSE scripts can be loaded into Nmap using the `-sC` flag. The `-sC` flag runs [a set list of default scripts](https://nmap.org/nsedoc/categories/default.html) against your target.
```
$ nmap -sC scanme.nmap.org
```

### HTTP Enumeration

```
nmap --script http-enum <target>
```

### HTTP Methods

```
nmap --script http* <target>
```
• http-methods
• http-title
• http-method-tamper
• http-trace
• http-fetch
• http-wordpress-enum
• http-devframework
• http NSE Library

### SMB Enumeration

```
nmap -p 445 --script smb* <target>
```
• smb-os-discovery
• smb-vuln-ms17-010
• smb-protocols
• smb-mbenum
• smb-enum-users
• smb-enum-processes
• smb-enum-services

### DNS Enumeration

```
nmap -p 53 --script dns* <target>
```
• dns-cache-snoop
• dns-service-discovery
• dns-recursion
• dns-brute
• dns-zone-transfer
• dns-nsid
• dns-nsec-enum
• dns-fuzz
• dns-srv-enum

### FTP Enumeration

```
nmap -p 21 --script ftp* <target>
```
• ftp-syst
• ftp-anon
• ftp-vsftpd-backdoor
• ftp-brute
• ftp NSE
• ftp-bounce
• ftp-vuln-cve2010-4221
• ftp-libopie

### MySQL Enumeration

```
nmap -p 3306 --script mysql* <target>
```
• mysql-info
• mysql-databases
• mysql-enum
• mysql-brute
• mysql-query
• mysql-empty-password
• mysql-vuln-cve2012-2122
• mysql-users
• mysql-variables

### SSH Enumeration

```
nmap -p 22 --script ssh* <target>
```
• ssh2-enum-algos
• ssh-brute
• ssh-auth-methods
• ssh-run
• ssh-hostkey
• sshv1
• ssh-publickey-acceptance

### SMTP Enumeration

```
nmap -p 25 --script smtp* <target>
```
• smtp-commands
• smtp-open-relay
• smtp-enum-users
• smtp-commands
• smtp-brute
• smtp-ntlm-info
• smtp-strangeport
• smtp-vuln-cve2011-1764

### VNC Enumeration

```
nmap -p 5900 --script *vnc* <target>
```
• vnc-info 
• vnc-brute
• realvnc-auth-bypass
• vnc-title

### Service Banner Grabbing

```
nmap --script banner <target>
```

### Detecting Vulnerabilities

```
nmap -sV --script *vuln* <target>
```
#### Additional scripts: 
Clone these two repo into `/usr/share/nmap/scripts` directory. 
- https://github.com/scipag/vulscan
- https://github.com/vulnersCom/nmap-vulners

### Nmap Full Scan 
To scan a list of target IP addresses or hostnames for open ports, services, vulnerabilities, and potential security issues.
```
nmap -Pn -sV -sC --script vuln -p- -iL scope_list.txt -oN Output.txt
```
Options:
- -Pn: Disable host discovery (ping probes). Assume all hosts are online. This is useful for scanning hosts that block ping requests. Nmap won't waste time checking if hosts are online, assuming they are.
- -sV: Enable service version detection. Attempt to determine the exact service running on open ports. Nmap will try to determine the specific applications or services running on open ports.
- -sC: Run default Nmap scripts for service version detection and vulnerability scanning.
- --script vuln: Run Nmap's vulnerability scripts specifically. These scripts try to identify known vulnerabilities in services.
- -p-: Scan all 65535 ports (full port scan). Nmap will probe every possible port on each target.
- -iL scope_list.txt: Read target IP addresses or hostnames from a text file named "scope_list.txt".
- -oN Output.txt: Save scan results in normal format to a file named "Output.txt".


## testssl.sh: [Testing TLS/SSL encryption anywhere on any port.](https://github.com/drwetter/testssl.sh)
```
Usage:
testssl.sh [options] <host>:<port>
```

### Port Scanning
By default, testssl scans only 443 ports. You can specify a different ports.

For example, to scan the ports 22, 80, and 8080, you would use the following commands:
```
$ testssl 45.33.32.156:22
```
```
$ testssl 45.33.32.156:80
```
```
$ testssl 45.33.32.156:8080
```
### Scan Using an Input File
testssl dosen't allow you to scan a list of IP addresses line -iL in nmap.
But here is the solution, [IRCMDUF.sh](https://github.com/GTekSD/fast/blob/main/IRCMDUF.sh)
```
IRCMDUF.sh "testssl -E -s -p -S -h -U" list_of_ip_add.txt
```

### testssl Full Scan 
```
$ testssl -E -s -p -S -h -U <target>:<port>
```
This command will checks per protocol, standard cipher categories by strength, TLS/SSL protocols, certificate info, headers, and all of the following vulnerabilities.

```
     -U, --vulnerable              tests all (of the following) vulnerabilities (if applicable)
     -H, --heartbleed              tests for Heartbleed vulnerability
     -I, --ccs, --ccs-injection    tests for CCS injection vulnerability
     -T, --ticketbleed             tests for Ticketbleed vulnerability in BigIP loadbalancers
     --BB, --robot                 tests for Return of Bleichenbacher's Oracle Threat (ROBOT) vulnerability
     --SI, --starttls-injection    tests for STARTTLS injection issues
     -R, --renegotiation           tests for renegotiation vulnerabilities
     -C, --compression, --crime    tests for CRIME vulnerability (TLS compression issue)
     -B, --breach                  tests for BREACH vulnerability (HTTP compression issue)
     -O, --poodle                  tests for POODLE (SSL) vulnerability
     -Z, --tls-fallback            checks TLS_FALLBACK_SCSV mitigation
     -W, --sweet32                 tests 64 bit block ciphers (3DES, RC2 and IDEA): SWEET32 vulnerability
     -A, --beast                   tests for BEAST vulnerability
     -L, --lucky13                 tests for LUCKY13
     -WS, --winshock               tests for winshock vulnerability
     -F, --freak                   tests for FREAK vulnerability
     -J, --logjam                  tests for LOGJAM vulnerability
     -D, --drown                   tests for DROWN vulnerability
     -4, --rc4, --appelbaum        which RC4 ciphers are being offered?
```

## Hacking Vulnerable Web Applications Without Going To Jail
 - http://blog.taddong.com/2011/10/hacking-vulnerable-web-applications.html
 - https://www.irongeek.com/i.php?page=security/deliberately-insecure-web-applications-for-learning-web-app-security
 - http://scanme.nmap.org/
