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

# 1. Information gathering / Reconnaissance

Many people have written lot about it. However, i have few points to mention here. Whether you have IP address or a domain name, you need to find ASN (Autonomous System Number) belonging to that company first. The benefit — it will help you find all the IP ranges that belong to the company. You can use below links to find ASN from a domain name or IP address.

- [HackerTarget.com](https://hackertarget.com/as-ip-lookup/) - HackerTarget.com is an open-source platform that provides online security scanning solutions and assessments.
- [NetworksDB.io](https://networksdb.io/) - NetworksDB.io is a database of public networks, IP addresses, and domain names owned by companies and organizations worldwide.
- [Hurricane Electric BGP Toolkit](https://bgp.he.net/) - The Hurricane Electric BGP Toolkit is a tool that uses internal BGP data, data from routeviews, and other sources.
- [MX](https://mxtoolbox.com/NetworkTools.aspx) - MxToolbox is a tool that offers free and paid monitoring and lookup tools for email, DNS, blacklist, network performance, and websites.
- [ViewDNS.info](https://viewdns.info/) - ViewDNS.info is a source for DNS-related tools and information.
- You would also want to look at subdomain enumeration. Utilize the following tools.

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


## Nmap: the Network Mapper - Free Security Scanner

### The six port states recognized by Nmap: 
`open`, `closed`, `filtered`, `unfiltered`, `open|filtered`, or `closed|filtered`.

- `open` - An application is actively accepting TCP connections, UDP datagrams or SCTP associations on this port. Finding these is often the primary goal of port scanning. Security-minded people know that each open port is an avenue for attack. Attackers and pen-testers want to exploit the open ports, while administrators try to close or protect them with firewalls without thwarting legitimate users. Open ports are also interesting for non-security scans because they show services available for use on the network. 

- `closed` - A closed port is accessible (it receives and responds to Nmap probe packets), but there is no application listening on it. They can be helpful in showing that a host is up on an IP address (host discovery, or ping scanning), and as part of OS detection. Because closed ports are reachable, it may be worth scanning later in case some open up. Administrators may want to consider blocking such ports with a firewall. Then they would appear in the filtered state, discussed next. 

- `filtered` - Nmap cannot determine whether the port is open because packet filtering prevents its probes from reaching the port. The filtering could be from a dedicated firewall device, router rules, or host-based firewall software. These ports frustrate attackers because they provide so little information. Sometimes they respond with ICMP error messages such as type 3 code 13 (destination unreachable: communication administratively prohibited), but filters that simply drop probes without responding are far more common. This forces Nmap to retry several times just in case the probe was dropped due to network congestion rather than filtering. This slows down the scan dramatically.

- `unfiltered` - The unfiltered state means that a port is accessible, but Nmap is unable to determine whether it is open or closed. Only the ACK scan, which is used to map firewall rulesets, classifies ports into this state. Scanning unfiltered ports with other scan types such as Window scan, SYN scan, or FIN scan, may help resolve whether the port is open. 

- `open|filtered` - Nmap places ports in this state when it is unable to determine whether a port is open or filtered. This occurs for scan types in which open ports give no response. The lack of response could also mean that a packet filter dropped the probe or any response it elicited. So Nmap does not know for sure whether the port is open or being filtered. The UDP, IP protocol, FIN, NULL, and Xmas scans classify ports this way.

- `closed|filtered` - This state is used when Nmap is unable to determine whether a port is closed or filtered. It is only used for the IP ID idle scan.


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

#### Findings and their NSE scripts

- BEAST Security vulnerability
- Server vulnerable to SSL Lucky13 Attack
- SSL / TLS Versions Supported
- SSL Cipher Suites Supported
- SSL DROWN Attack vulnerability (Decrypting RSA with Obsolete and Weakened encryption)
- SSL Medium Strength Cipher Suites Supported (SWEET32)
- SSL RC4 Cipher Suites Supported (Bar Mitzvah)
- SSL Version 2 and 3 Protocol Detection
- SSL Weak Cipher Suites Supported
- SSLv3 Padding Oracle on Downgraded Legacy Encryption Vulnerability (POODLE)
- TLS Version 1.0 Protocol Deprecated
- TLS Version 1.1 Protocol Deprecated
```
nmap --script ssl-enum-ciphers <target ip>
```


- Nginx v1.16.1 is vulnerable to Information Disclosure vulnerability
```
nmap -sV <target ip>
```


- SSL/TLS Diffie-Hellman Modulus <= 1024 Bits (Logjam)	
```
nmap --script ssl-dh-params <target ip>
```


- SSL Certificate Chain Contains RSA Keys Less Than 2048 bits
- SSL Certificate Expiry
- SSL Certificate Signed Using Weak Hashing Algorithm
- SSL Self-Signed Certificate
```
nmap --script ssl-cert <target ip>
```

- Obsolete CBC ciphers Enabled
- SSH Server CBC Mode Ciphers Enabled
- SSH Weak Key Exchange Algorithms Enabled
- SSH Weak MAC Algorithms Enabled
```
nmap --script ssh2-enum-algos <target ip>
```

- HTTP TRACE / TRACK Methods Allowed
```
nmap --script http-methods <target ip>
```

- HSTS Missing from HTTPS Server
```
nmap --script http-security-headers <target ip>
```


- Microsoft SQL Server Unsupported Version Detection (remote check)
```
nmap -p 1433 --script ms-sql-info <target ip>
```


- Unencrypted Telnet Server
```
nmap -p 23 --script telnet-encryption <target ip>
```

### Example

```
root@Kali:~# nmap -sC 10.211.55.6
..
21/tcp   open   ftp
| ftp-anon: Anonymous FTP login allowed (FTP code 230)
|_Can't get directory listing: PASV failed: 550 Permission denied.
| ftp-syst:
|   STAT:
| FTP server status:
|      Connected to 10.211.55.4
|      Logged in as ftp
…
|      vsFTPd 3.0.3 – secure, fast, stable
|_End of status
22/tcp   open   ssh
| ssh-hostkey:
|   2048 81:21:ce:a1:1a:05:b1:69:4f:4d:ed:80:28:e8:99:05 (RSA)
|   256 5b:a5:bb:67:91:1a:51:c2:d3:21:da:c0:ca:f0:db:9e (ECDSA)
|_  256 6d:01:b7:73:ac:b0:93:6f:fa:b9:89:e6:ae:3c:ab:d3 (ED25519)
53/tcp   open   domain
| dns-nsid:
|   id.server: ATL
|_  bind.version: dnsmasq-2.75
80/tcp   open   http
|_http-title: 404 Not Found
…
3306/tcp open   mysql
| mysql-info:
|   Protocol: 10
|   Version: 5.7.12-0ubuntu1
…
```


## testssl.sh: Testing TLS/SSL encryption anywhere on any port 

```
     -e, --each-cipher             checks each local cipher remotely
     -E, --cipher-per-proto        checks those per protocol
     -s, --std, --categories       tests standard cipher categories by strength
     -f, --fs, --nsa               checks forward secrecy settings
     -p, --protocols               checks TLS/SSL protocols (including SPDY/HTTP2)
     -g, --grease                  tests several server implementation bugs like GREASE and size limitations
     -S, --server-defaults         displays the server's default picks and certificate info
     -P, --server-preference       displays the server's picks: protocol+cipher
     -x, --single-cipher <pattern> tests matched <pattern> of ciphers
                                   (if <pattern> not a number: word match)
     -c, --client-simulation       test client simulations, see which client negotiates with cipher and protocol
     -h, --header, --headers       tests HSTS, HPKP, server/app banner, security headers, cookie, reverse proxy, IPv4 address

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
