# RED TEAMING GUIDE
![logo_3_3440x1440](https://github.com/GTekSD/SUASS/assets/55411358/e6eae309-989a-4424-b56f-a8350a85b6b8)

Imagine your house has a security guard (penetration test). They check the locks, windows, and alarm system to see if a robber can get in (find vulnerabilities).

Red team engagement is like having a friend pretend to be a robber. They try everything to break in (phishing emails, hacking, sneaking in) to see how well your guard (security team) responds to a real attack. 

#### Here's how they work:

* A team pretends to be real attackers (the "red team").
* They try to break into your systems using the same tricks real attackers use (phishing emails, hacking, sneaking in physically).
* Your regular security team (the "blue team") tries to stop them, just like they would a real attack.
* No one on the blue team knows the red team is coming, so it's a surprise attack, just like a real one.

#### Types of Red Team Engagement can be run in several ways:

* **Full Engagement:** Simulate an attacker's full workflow, from initial compromise until final goals have been achieved. Like the robber friend starting from outside and trying everything.
* **Assumed Breach:** Start by assuming the attacker has already gained control over some assets, and try to achieve the goals from there. As an example, the red team could receive access to some user's credentials or even a workstation in the internal network. Like the friend already being inside your house and trying to steal something. 
* **Table-top Exercise:** An over the table simulation where scenarios are discussed between the red and blue teams to evaluate how they would theoretically respond to certain threats. Ideal for situations where doing live simulations might be complicated. Talking through different attack scenarios to see how everyone would react.

_The goal is not for the red team to win, but to test the blue team's ability to respond to an attack._


----------------
Red teaming involves simulating realistic attack scenarios to test the resilience of an organization’s security measures. As a red teamer, the goal is to identify vulnerabilities in systems, networks, applications, and human processes by using the same tactics, techniques, and procedures (TTPs) as real-world attackers.

### Step-by-Step Plan for Red Teaming

#### **1. Define Scope and Objectives**
- **Client Discussions**: Engage with the client to understand their security concerns, critical assets, and acceptable boundaries for testing. Ensure that the scope is well-defined to avoid unauthorized actions.
  - **Key Questions to Ask**:
    - What are the critical assets (data, systems, applications)?
    - What threats is the client most concerned about (e.g., data breaches, insider threats, ransomware)?
    - Are there any systems or areas out of scope for testing?
    - Does the client want a specific focus (e.g., network, cloud, social engineering)?

- **Rules of Engagement (ROE)**: Set clear rules for the engagement to define acceptable actions. For example:
  - Time frames for the engagement.
  - Systems that can be touched or must be avoided.
  - Testing approach (stealthy vs. noisy, black-box vs. white-box).
  - Contact points in case of incident escalation or need for clarification.

#### **2. Reconnaissance**
- **Passive Reconnaissance**: Gather open-source intelligence (OSINT) to map the client's external attack surface without directly interacting with their systems.
  - Tools: Search engines, social media, data leak sites, WHOIS lookups, subdomain enumeration, etc.
  - Goal: Identify exposed infrastructure, employee data, and other useful information.

- **Active Reconnaissance**: Interact with client assets to gather more detailed information.
  - Tools: Nmap, Shodan, Burp Suite, DNS enumeration.
  - Goal: Identify open ports, services, potential misconfigurations, and possible vulnerabilities.

#### **3. Initial Access**
- **Network-Based Exploits**: Look for vulnerabilities in externally exposed services and applications.
  - Techniques: Exploit unpatched software (e.g., CVE vulnerabilities), SQL injection, command injection, weak credentials.
  - Tools: Metasploit, Exploit-DB, custom scripts.

- **Social Engineering**: Simulate phishing attacks, baiting, or pretexting to gain access through users.
  - Techniques: Phishing emails, USB drops, voice calls, fake websites.
  - Tools: GoPhish, SET (Social Engineering Toolkit), custom lures.

#### **4. Privilege Escalation**
- Once access is gained, escalate privileges within the system.
  - **Local Privilege Escalation**: Exploit local vulnerabilities or misconfigurations (e.g., weak file permissions, outdated software).
  - **Lateral Movement**: Use compromised credentials or exploits to move through the network.
  - Tools: BloodHound, Mimikatz, Metasploit, PowerShell Empire.

#### **5. Persistence**
- Maintain access after initial exploitation to simulate how attackers would remain undetected.
  - **Persistence Techniques**: Scheduled tasks, registry modification, rootkits, implant backdoors.
  - Tools: Cobalt Strike, PowerShell scripts, custom persistence mechanisms.

#### **6. Command and Control (C2)**
- Set up a command and control infrastructure to simulate an attacker’s ability to control compromised systems.
  - C2 Tools: Cobalt Strike, Metasploit, Covenant.
  - Techniques: Use HTTP(S), DNS, or other communication channels for stealthy command transmission.

#### **7. Data Exfiltration**
- Simulate data theft to measure the organization’s detection and response capabilities.
  - Target: Identify sensitive data (intellectual property, PII, financial records) and attempt to extract it.
  - Tools: Custom scripts for exfiltration, encrypted channels (FTP, HTTP/S, DNS tunneling).
  
#### **8. Post-Exploitation and Impact Assessment**
- Assess the potential damage that could have been inflicted on the organization.
  - Techniques: Encrypt files (ransomware simulation), tamper with data integrity, pivot to other systems.
  - Tools: Simulate DDoS attacks, tampering, or full system compromise.

#### **9. Reporting and Debriefing**
- **Documentation**: Compile detailed reports of your findings, highlighting vulnerabilities, exploited paths, and remediation recommendations.
  - Include: Screenshots, logs, and a clear timeline of activities.
  - Tailor the report for both technical and non-technical audiences.
  
- **Debriefing**: Hold a debrief session with the client to walk through the engagement and explain how the red team compromised systems and the risks involved.

#### **10. Recommendations and Follow-Up**
- Provide actionable remediation advice to address vulnerabilities.
  - Recommendations could range from patch management, network segmentation, and strengthening user training, to implementing more robust monitoring and detection.

- **Re-Test**: Offer to conduct a follow-up assessment once the client has implemented the remediation to validate their improved security posture.

---

### Tools and Techniques Overview

| Phase                | Tools                                   | Techniques                                              |
|----------------------|-----------------------------------------|---------------------------------------------------------|
| Reconnaissance        | Nmap, Shodan, OSINT Tools               | Subdomain enumeration, WHOIS, DNS lookups               |
| Initial Access        | Metasploit, Burp Suite, Phishing Kits   | Exploit vulnerabilities, social engineering             |
| Privilege Escalation  | Mimikatz, BloodHound, PowerShell Empire | Exploit misconfigurations, credential dumping           |
| Persistence           | Cobalt Strike, PowerShell Scripts       | Scheduled tasks, backdoors, rootkits                    |
| C2 Setup              | Cobalt Strike, Covenant, Metasploit     | HTTP/S, DNS, FTP tunnels for command and control        |
| Data Exfiltration     | Custom Scripts, Encrypted Channels      | Data theft via HTTP/S, FTP, DNS tunneling               |

### Additional Considerations
- **Legal Compliance**: Ensure all testing activities comply with legal requirements (e.g., GDPR, HIPAA, etc.).
- **Detection and Evasion**: Ensure your red team can evade detection to simulate real-world attackers, while being mindful not to disrupt critical operations.
- **Communication**: Maintain clear communication channels with the client during testing to avoid any operational impacts.

This plan provides a solid foundation to build a customized red teaming approach based on the client’s needs. You can adapt it based on specific goals and challenges that arise.
