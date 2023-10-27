# Awesome Bug Bounty Tools

## Contents
- Recon
- Subdomain Enumeration
- Port Scanning
- Screenshots
- Technologies
- Content Discovery
- Links
- Parameters
- Fuzzing
- Exploitation
  - Command Injection
  - CORS Misconfiguration
  - CRLF Injection
  - CSRF Injection
  - Directory Traversal
  - File Inclusion
  - GraphQL Injection
  - Header Injection
  - Insecure Deserialization
  - Insecure Direct Object References
  - Open Redirect
  - Race Condition
  - Request Smuggling
  - Server Side Request Forgery
  - SQL Injection
  - XSS Injection
  - XXE Injection
- Miscellaneous
  - Passwords
  - Secrets
  - Git
  - Buckets
  - CMS
  - JSON Web Token
  - postMessage
  - Subdomain Takeover
  - Uncategorized

## Recon

Lorem ipsum dolor sit amet

## Subdomain Enumeration

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

## Port Scanning

- [masscan](https://github.com/robertdavidgraham/masscan) - TCP port scanner, spews SYN packets asynchronously, scanning entire Internet in under 5 minutes.
- [RustScan](https://github.com/RustScan/RustScan) - The Modern Port Scanner
- [naabu](https://github.com/projectdiscovery/naabu) - A fast port scanner written in go with focus on reliability and simplicity.
- [nmap](https://github.com/nmap/nmap) - Nmap - the Network Mapper. Github mirror of the official SVN repository.
- [sandmap](https://github.com/trimstray/sandmap) - Nmap on steroids. Simple CLI with the ability to run the pure Nmap engine, 31 modules with 459 scan profiles.
- [ScanCannon](https://github.com/johnnyxmas/ScanCannon) - Combines the speed of masscan with the reliability and detailed enumeration of nmap

## Screenshots

- [EyeWitness](https://github.com/FortyNorthSecurity/EyeWitness) - EyeWitness is designed to take screenshots of websites, provide some server header info, and identify default credentials if possible.
- [aquatone](https://github.com/michenriksen/aquatone) - Aquatone is a tool for visual inspection of websites across a large number of hosts and is convenient for quickly gaining an overview of the HTTP-based attack surface.
- [screenshoteer](https://github.com/vladocar/screenshoteer) - Make website screenshots and mobile emulations from the command line.
- [gowitness](https://github.com/sensepost/gowitness) - gowitness - a golang, web screenshot utility using Chrome Headless
- [WitnessMe](https://github.com/byt3bl33d3r/WitnessMe) - Web Inventory tool, takes screenshots of webpages using Pyppeteer (headless Chrome/Chromium) and provides some extra bells & whistles to make life easier.
- [eyeballer](https://github.com/BishopFox/eyeballer) - Convolutional neural network for analyzing pentest screenshots
- [scrying](https://github.com/nccgroup/scrying) - A tool for collecting RDP, web, and VNC screenshots all in one place
- [Depix](https://github.com/beurtschipper/Depix) - Recovers passwords from pixelized screenshots
- [httpscreenshot](https://github.com/breenmachine/httpscreenshot/) - HTTPScreenshot is a tool for grabbing screenshots and HTML of large numbers of websites.

## Technologies

- [wappalyzer](https://github.com/AliasIO/wappalyzer) - Identify technology on websites.
- [webanalyze](https://github.com/rverton/webanalyze) - Port of Wappalyzer (uncovers technologies used on websites) to automate mass scanning.
- [python-builtwith](https://github.com/claymation/python-builtwith) - BuiltWith API client
- [whatweb](https://github.com/urbanadventurer/whatweb) - Next generation web scanner
- [retire.js](https://github.com/RetireJS/retire.js) - scanner detecting the use of JavaScript libraries with known vulnerabilities
- [httpx](https://github.com/projectdiscovery/httpx) - httpx is a fast and multi-purpose HTTP toolkit that allows running multiple probers using the retryablehttp library. It is designed to maintain the result reliability with increased threads.
- [fingerprintx](https://github.com/praetorian-inc/fingerprintx) - fingerprintx is a standalone utility for service discovery on open ports that works well with other popular bug bounty command line tools.

## Content Discovery

- [gobuster](https://github.com/OJ/gobuster) - Directory/File, DNS, and VHost busting tool written in Go
- [recursebuster](https://github.com/C-Sto/recursebuster) - rapid content discovery tool for recursively querying webservers, handy in pentesting and web application assessments
- [feroxbuster](https://github.com/epi052/feroxbuster) - A fast, simple, recursive content discovery tool written in Rust.
- [dirsearch](https://github.com/maurosoria/dirsearch) - Web path scanner
- [dirsearch](https://github.com/evilsocket/dirsearch) - A Go implementation of dirsearch.
- [filebuster](https://github.com/henshin/filebuster) - An extremely fast and flexible web fuzzer
- [dirstalk](https://github.com/stefanoj3/dirstalk) - Modern alternative to dirbuster/dirb
- [dirbuster-ng](https://github.com/digination/dirbuster-ng) - dirbuster-ng is a C CLI implementation of the Java dirbuster tool
- [gospider](https://github.com/jaeles-project/gospider) - Gospider - Fast web spider written in Go
- [hakrawler](https://github.com/hakluke/hakrawler) - Simple, fast web crawler designed for easy, quick discovery of endpoints and assets within a web application
- [crawley](https://github.com/s0rg/crawley) - Fast, feature-rich unix-way web scraper/crawler written in Golang.

## Links

- [LinkFinder](https://github.com/GerbenJavado/LinkFinder) - A python script that finds endpoints in JavaScript files
- [JS-Scan](https://github.com/zseano/JS-Scan) - a .js scanner, built in PHP. designed to scrape URLs and other info
- [LinksDumper](https://github.com/arbazkiraak/LinksDumper) - Extract (links/possible endpoints) from responses & filter them via decoding/sorting
- [GoLinkFinder](https://github.com/0xsha/GoLinkFinder) - A fast and minimal JS endpoint extractor
- [BurpJSLinkFinder](https://github.com/InitRoot/BurpJSLinkFinder) - Burp Extension for passive scanning JS files for endpoint links.
- [urlgrab](https://github.com/IAmStoxe/urlgrab) - A golang utility to spider through a website searching for additional links.
- [waybackurls](https://github.com/tomnomnom/waybackurls) - Fetch all the URLs that the Wayback Machine knows about for a domain
- [gau](https://github.com/lc/gau) - Fetch known URLs from AlienVault's Open Threat Exchange, the Wayback Machine, and Common Crawl.
- [getJS](https://github.com/003random/getJS) - A tool to fastly get all JavaScript sources/files
- [linx](https://github.com/riza/linx) - Reveals invisible links within JavaScript files

## Parameters

- [parameth](https://github.com/maK-/parameth) - This tool can be used to brute discover GET and POST parameters
- [param-miner](https://github.com/PortSwigger/param-miner) - This extension identifies hidden, unlinked parameters. It's particularly useful for finding web cache poisoning vulnerabilities.
- [ParamPamPam](https://github.com/Bo0oM/ParamPamPam) - This tool for brute discover GET and POST parameters.
- [Arjun](https://github.com/s0md3v/Arjun) - HTTP parameter discovery suite.
- [ParamSpider](https://github.com/devanshbatham/ParamSpider) - Mining parameters from dark corners of Web Archives.
- [x8](https://github.com/Sh1Yo/x8) - Hidden parameters discovery suite written in Rust.

