OSINT

Finding domain and Sub domains
$ subbruite.py certifiedhacker.com
$ nmap --script dns-brute www.certifiedhacker.com
$ dnsmap certifiedhacker.com
$ fierce -dns certifiedhacker.com
$ sublist3r.py -d certifiedhacker.com -p 80 -c Bing
$ https://netcraft.com

Finding similar or parallel domain names : search for similar domain names and record the findings
$ urlcrazy -p Microsoft.com


Web search Advanced Operators
Web Search:- allinanchor:, allintext:, allintitle:, allinurl: cache:,
define:, filetype:, id: inachor: info: intext: intitle:  inurl: link: related: site: 

Image Search:- allintitle: allinurl: filetype: inurl:, intitle:, site:

Groups:- allintext:, allintitle: author: group: insubject: intext: intitle

Directory:- allintext:, allintitle:, allinurl:, ext:, filetype: intext:. intitle, inurl:

News:- allintext:. allintitle:, allinurl:, intext, intitle: inurl:, location source:

Product Search:- allintext: allintitle:


Refining web search using opratoors:
- Sitedigger tool to automate the GH process
- Google Hacking Diggity Project to employe search engines such as Google, Bing, and Shodan to quickly identify vulnerable systems and sensitive data in network.
- Shodan

Finding the Geographical Location of a Company
- Use Google Maps or Google Earth
- 
- wikimapia.org
- mapquest.com
- waze.com/en-GB/livemap
- bing.com/maps


Listing Employees and emails
- theHarvester -d certifiedhacker.com -l 500 -b google -h myresult.html
- Phishing Frenzy
- Metagoofil.py -d certifiedhacker.com -t doc,pdf -l 100 -n 10 -o outputfiles -f result.html
PASTEBIN (SimplyEmail and Pepe to collect emails)
HaveIBeenPwned

People search
- pipl
- spokeo
- PeopleFinder

gather emails phone numbers or address of key personnel or employess
linkedin
facebook
twitter
myspace
pinterest
plus google
Instagram


Extract sensitive data about the company
- Web Investigation Tool

eMailTrackerPro = email header analysis

NNTP Usenet Newsgroups


# OSENT through Web App Analysis

search for
copywrite notices
revision number
document numbers
document Version1a Version45.3c
archive.org
WebSite-Watcher
Webpage source

# OSENT through DNS Interrogation

-- whois Microsoft.com
-- nmap -sn --script whois-* Microsoft.com


Perform Whois Lookups using Perl Script

#!/usr/bin/perl -w

use strict;
use Net::Whois::Raw;
die "Usage: perl netRange.pl <IP Address>" unless $ARGV[0];
foreach(split(/\n\,whois(shift))){print $_,"\n" if(m/^(netrange|orgname)/i);}


Find IP Block Allocated to Organization
when Org dosnt provide IP range, use IP registries. It helps to finge IP range

https://www.apnic.net/
https://afrinic.net/
https://www.ripe.net/
https://www.lacnic.net/






