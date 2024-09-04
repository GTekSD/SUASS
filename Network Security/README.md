![network](https://www.cipherex.com/wp-content/uploads/2024/01/Conducting-a-Robust-Infrastructure-Security-Audit-A-Step-by-Step-Guide.png)

# Infrastructure Penetration Testing

Network penetration testing is a well-known method for identifying vulnerabilities in networks, systems, hosts, and network devices before attackers recognize and exploit them. It is the process of actively evaluating the security of a network by simulating the attacks an attacker would perform on a network, attached devices, network applications, or a website. This security assessment of Internet/intranet systems determines the vulnerable network services that unidentified threat sources can abuse. Network penetration test starts with discovering live systems, open ports, troubleshooting live systems, services and grabbing system banners. Pen tester should try to gain access to the target network environment through live systems, open ports, services, etc. and then use those systems as a base to penetrate deeper into the network.

Network penetration test commonly includes the following type of tests against target network infrastructure: 

- Detecting unnecessary open ports, services running, sensitive information exposed through default banners
- Firewall bypass testing
- IDS evasion testing
- Testing switching or routing issues

### Benefits of network penetration testing:

- Identification of the critical vulnerabilities enables the security experts to develop and implement proper fixes
- Network penetration test helps the administrator to close unnecessary ports, services, hide or customize banners, troubleshoot services and calibrate firewall/IDS rules for robust security.
- It helps organizations avoid huge fines for noncompliance, by helping them comply with the audit regulatory standards like Payment Card Industry Data Security Standard (PCI DSS), Health Insurance Portability and Accountability Act (HIPAA), and Gramm–Leach–Bliley Act (GLBA)
- It helps organizations to identify and address the risks, thus avoids security breach and protects the organization from heavy financial falls

Network penetration test can be conducted from inside or outside of the organization. Based on needs, there are two types of network penetration testing: external penetration testing and internal penetration testing. It is recommended that organizations should perform both internal and external network penetration testing for better results


![Approch](https://securitycafe.ro/wp-content/uploads/2015/01/infrastructure_testing1.png)

The purpose of this type of testing is to provide clients with a level of confidence that their Internet and LAN infrastructure is secure.

For this purpose, we split the infrastructure tests in two categories:

- **External penetration tests:** Verify if unauthorized access can be gained via the external network components by a hacker having limited or no previous knowledge of the network.
- **Internal penetration tests:** Determine which level of unauthorized access can be gained by an internal attacker who already has access to the internal network. Test if the ‘crown jewels’ of your business are protected against internal attackers.

## Testing process

Our structured approach to attacking a network is shown in the picture above and it has the following phases:

### Gather information about your organization and your systems from:

- The Domain Name Service (DNS)
- The Internet registration database (RIPE)
- Bulletin boards, forums and other social media
- The web
- Other relevant sources

### Identify and analyze the machines exposed to the Internet for:

- Active ports (TCP and UDP)
- Running services (ex. DNS, SMTP, VPN, etc)
- Login services for remote access
- SNMP (if active)

### Iteratively scan for vulnerabilities (operating system and services):

- Well-known vulnerabilities
- Configuration errors
- Design errors

### Exploit the identified vulnerabilities in order to gain unauthorized access to systems or data:

- Manual exploitation
- Use validated exploit code and tools
- Do not affect the functionality of the system
