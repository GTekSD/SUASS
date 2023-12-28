# External VAPT
--------------

# Recon

## Subdomain Enumeration

- [SubEnum](https://github.com/bing0o/SubEnum) - Bash script for Subdomain Enumeration using 4 tools and 3 online services
- [Sublist3r](https://github.com/aboul3la/Sublist3r) - Fast subdomains enumeration tool for penetration testers
- [Amass](https://github.com/OWASP/Amass) - In-depth Attack Surface Mapping and Asset Discovery
- [massdns](https://github.com/blechschmidt/massdns) - A high-performance DNS stub resolver for bulk lookups and reconnaissance (subdomain enumeration)
- [Findomain](https://github.com/Findomain/Findomain) - The fastest and cross-platform subdomain enumerator, do not waste your time.
- [Sudomy](https://github.com/Screetsec/Sudomy) - Sudomy is a subdomain enumeration tool to collect subdomains and analyzing domains performing automated reconnaissance (recon) for bug hunting / pentesting
- [chaos-client](https://github.com/projectdiscovery/chaos-client) - Go client to communicate with Chaos DNS API.
- [domained](https://github.com/TypeError/domained) - Multi Tool Subdomain Enumeration
- [bugcrowd-levelup-subdomain-enumeration](https://github.com/appsecco/bugcrowd-levelup-subdomain-enumeration) - This repository contains all the material from the talk "Esoteric sub-domain enumeration techniques" given at Bugcrowd LevelUp 2017 virtual conference
- [shuffledns](https://github.com/projectdiscovery/shuffledns) - shuffleDNS is a wrapper around massdns written in go that allows you to enumerate valid subdomains using active bruteforce as well as resolve subdomains with wildcard handling and easy input-output...
- [censys-subdomain-finder](https://github.com/christophetd/censys-subdomain-finder) - Perform subdomain enumeration using the certificate transparency logs from Censys.
- [Turbolist3r](https://github.com/fleetcaptain/Turbolist3r) - Subdomain enumeration tool with analysis features for discovered domains
- [censys-enumeration](https://github.com/0xbharath/censys-enumeration) - A script to extract subdomains/emails for a given domain using SSL/TLS certificate dataset on Censys
- [tugarecon](https://github.com/LordNeoStark/tugarecon) - Fast subdomains enumeration tool for penetration testers.
- [as3nt](https://github.com/cinerieus/as3nt) - Another Subdomain Enumeration Tool
- [Subra](https://github.com/si9int/Subra) - A Web-UI for subdomain enumeration (subfinder)
- [Substr3am](https://github.com/nexxai/Substr3am) - Passive reconnaissance/enumeration of interesting targets by watching for SSL certificates being issued
- [domain](https://github.com/jhaddix/domain/) - enumall.py Setup script for Regon-ng
- [altdns](https://github.com/infosec-au/altdns) - Generates permutations, alterations and mutations of subdomains and then resolves them
- [brutesubs](https://github.com/anshumanbh/brutesubs) - An automation framework for running multiple open-sourced subdomain bruteforcing tools (in parallel) using your own wordlists via Docker Compose
- [dns-parallel-prober](https://github.com/lorenzog/dns-parallel-prober) - This is a parallelized domain name prober to find as many subdomains of a given domain as fast as possible.
- [dnscan](https://github.com/rbsec/dnscan) - dnscan is a python wordlist-based DNS subdomain scanner.
- [knock](https://github.com/guelfoweb/knock) - Knockpy is a python tool designed to enumerate subdomains on a target domain through a wordlist.
- [hakrevdns](https://github.com/hakluke/hakrevdns) - Small, fast tool for performing reverse DNS lookups en masse.
- [dnsx](https://github.com/projectdiscovery/dnsx) - Dnsx is a fast and multi-purpose DNS toolkit allow to run multiple DNS queries of your choice with a list of user-supplied resolvers.
- [subfinder](https://github.com/projectdiscovery/subfinder) - Subfinder is a subdomain discovery tool that discovers valid subdomains for websites.
- [assetfinder](https://github.com/tomnomnom/assetfinder) - Find domains and subdomains related to a given domain
- [crtndstry](https://github.com/nahamsec/crtndstry) - Yet another subdomain finder
- [VHostScan](https://github.com/codingo/VHostScan) - A virtual host scanner that performs reverse lookups
- [scilla](https://github.com/edoardottt/scilla) - Information Gathering tool - DNS / Subdomains / Ports / Directories enumeration
- [sub3suite](https://github.com/3nock/sub3suite) - A research-grade suite of tools for subdomain enumeration, intelligence gathering and attack surface mapping.
- Crt.sh subdomain enumeration
- ```curl -fsSL "https://crt.sh/?CN=%25.target.com&exclude=expired" | pup 'td :contains(".target.com") text{}' | sort -n | uniq -c | sort -rn | column -t```

## Port Scanning

- [nmap](https://github.com/nmap/nmap) - Nmap - the Network Mapper. Github mirror of the official SVN repository.
- [testssl](https://github.com/drwetter/testssl.sh) - Testing TLS/SSL encryption anywhere on any port.
- [masscan](https://github.com/robertdavidgraham/masscan) - TCP port scanner, spews SYN packets asynchronously, scanning entire Internet in under 5 minutes.
- [RustScan](https://github.com/RustScan/RustScan) - The Modern Port Scanner
- [naabu](https://github.com/projectdiscovery/naabu) - A fast port scanner written in go with focus on reliability and simplicity.
- [sandmap](https://github.com/trimstray/sandmap) - Nmap on steroids. Simple CLI with the ability to run the pure Nmap engine, 31 modules with 459 scan profiles.
- [ScanCannon](https://github.com/johnnyxmas/ScanCannon) - Combines the speed of masscan with the reliability and detailed enumeration of nmap

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

