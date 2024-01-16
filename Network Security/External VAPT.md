# External Vulnerability Assessment and Penetration Testing
--------------
You conduct vulnerability scanning from  outside of the company’s network. External scanners usually target the IT infrastructure exposed to the internet, including open ports in the network firewall and web application firewalls.


# 1. Information gathering and reconnaissance

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

