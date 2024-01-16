# External Vulnerability Assessment and Penetration Testing
You conduct vulnerability scanning from  outside of the company’s network. External scanners usually target the IT infrastructure exposed to the internet, including open ports in the network firewall and web application firewalls.

Basic Pre-Engagement
It is very tempting to start an external penetration test as soon as customer asks us to. After all, we can perform this test from our current location (no need to travel to customer’s site to perform test) and,

Who cares about that silly thing called documentation? Turns out, except us, everyone.

Your customer wants it so that they can compare, at the end of test, whether the entire perimeter has been accessed or not (in other words, did we leave anything out);

Your boss / management (any other role who is a decision maker in your hierarchy) wants it so that they know we didn’t do more than we were asked to (scope creep is not mythical) & that we did all that we were supposed to;

So, here are the things that one should keep in mind before starting an external penetration test

Scope of work

Is entire perimeter to be tested, or few IP addresses?

Few customers will share the list of external IP addresses to test and won’t be happy if you stray from that list. Few other customers would want you to tell them the attack surface (in other words, what IP addresses of ours are exposed publically) before they give us permission (for full or partial test).

Type of test (black box, grey box, white box)

Black box — we won’t tell you anything about our network, the type of machine under that IP, etc. We want to see what an external attacker would do.

Here, you will have to make it clear that uptime of external IPs are not your responsibility. You will need their IT staff to be on standby during the test so that they can monitor the network and devices for any performance hit. You will be expected to stop when they ask you to.

Grey-box — we will give you some information (e.g., IP address space, type of devices, make / model, etc.).

The expectation here, from customer, usually boils down to one line — now that we told you the things that we have on our external network (and potentially saved you lot of time), what vulnerabilities are we exposed to?

Is physical security testing part of scope?

If it is, i suggest you get your get-out-of-jail card before moving a muscle. Also called “authorization letter”, this document (signed by an authorized signatory — may or may not be the CISO / CIO but the person who is legally authorized to sign agreements on behalf of the company) will help you when you get caught in a mis-understanding with local cops. The coalfire incident has shown how important is this document. So get this before starting the pentest of any service / infrastructure that is business / mission — critical for your customer. TrustedSec has made a host of legal documentation available for no cost (thank you guys!) to facilitate legal boundaries around your physical security pentest. I recommend you have a look at them.


Report Deadline

Very important. End of testing is different from end of engagement. Testing ends when it ends (!). However, reporting is another, separate activity. Reporting starts after testing is over. You must schedule some time for this.

Preferred timings of test

Some customer would want you to initiate the test when no one is in office (out of working hours). Few customers would ask you to initiate the test during working hours. You have to document this.

# 1. Information gathering and reconnaissance

Passive Recon
Many people have written lot about it. However, i have few points to mention here:-

Whether you have IP address or a domain name, you need to find ASN (Autonomous System Number) belonging to that company first. The benefit — it will help you find all the IP ranges that belong to the company. You can use below links to find ASN from a domain name or IP address:-

https://hackertarget.com/as-ip-lookup/
Networksdb.io
BGP looking glasses (https://bgp.he.net/)
You would also want to look at sub-domain enumeration. Utilize the following tools

Amass
Censys
Shodan
Spiderfoot
Virustotal
ViewDNS.info
VHostScan (https://github.com/codingo/VHostScan)
Google Transparency Report (transparencyreport.google.com)
CertSpotter
CertDB
Crt.sh

## Subdomain Enumeration

- [SubEnum](https://github.com/bing0o/SubEnum) - Bash script for Subdomain Enumeration using 4 tools and 3 online services
- [Sublist3r](https://github.com/aboul3la/Sublist3r) - Fast subdomains enumeration tool for penetration testers
- [Amass](https://github.com/OWASP/Amass) - In-depth Attack Surface Mapping and Asset Discovery
- [Findomain](https://github.com/Findomain/Findomain) - The fastest and cross-platform subdomain enumerator, do not waste your time.
- [censys-subdomain-finder](https://github.com/christophetd/censys-subdomain-finder) - Perform subdomain enumeration using the certificate transparency logs from Censys.
- [censys-enumeration](https://github.com/0xbharath/censys-enumeration) - A script to extract subdomains/emails for a given domain using SSL/TLS certificate dataset on Censys
- [tugarecon](https://github.com/LordNeoStark/tugarecon) - Fast subdomains enumeration tool for penetration testers.
- [knock](https://github.com/guelfoweb/knock) - Knockpy is a python tool designed to enumerate subdomains on a target domain through a wordlist.
- [hakrevdns](https://github.com/hakluke/hakrevdns) - Small, fast tool for performing reverse DNS lookups en masse.
- [subfinder](https://github.com/projectdiscovery/subfinder) - Subfinder is a subdomain discovery tool that discovers valid subdomains for websites.
- [assetfinder](https://github.com/tomnomnom/assetfinder) - Find domains and subdomains related to a given domain
- Crt.sh subdomain enumeration
- ```curl -fsSL "https://crt.sh/?CN=%25.target.com&exclude=expired" | pup 'td :contains(".target.com") text{}' | sort -n | uniq -c | sort -rn | column -t```


Active Recon
This is where we interact directly with the customer infrastructure. The tools that could be utilized in this activity include, but are not limited to, the following:-

Knock (https://github.com/guelfoweb/knock)
Fierce
Sublist3r
Aquatone
Nmap
masscan
So that’s all for now. We will expand on this series soon.


## Port Scanning

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

