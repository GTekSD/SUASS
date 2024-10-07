# RED TEAMING GUIDE
![logo_3_3440x1440](https://github.com/GTekSD/SUASS/assets/55411358/e6eae309-989a-4424-b56f-a8350a85b6b8)

> Imagine your house has a security guard (penetration test). They check the locks, windows, and alarm system to see if a robber can get in (find vulnerabilities).
> Red team engagement is like having a friend pretend to be a robber. They try everything to break in (phishing emails, hacking, sneaking in) to see how well your guard (security team) responds to a real attack. 

> _The goal is not for the red team to win, but to test the blue team's ability to respond to an attack._

### Red Teaming Plan of Action

**Objective**:  
The primary goal of this red teaming engagement is to simulate real-world attack scenarios to test the client's security team's (blue team's) preparedness and incident response capabilities. By doing so, we identify weaknesses in both technology and personnel, helping the organization enhance its defenses against sophisticated attackers.

---

### 1. **Initial Planning & Scope Definition**

**1.1 Define Engagement Goals**  
The first step is to determine the objectives of the red teaming engagement. The goal is not for the red team to "win" but to gauge the organization's defense capabilities and improve them. Potential goals include:
- Test incident detection and response capabilities.
- Identify exploitable vulnerabilities in the organization's systems.
- Assess the security posture of both physical and digital environments.
- Evaluate employee security awareness and preparedness for social engineering attacks.

**1.2 Determine Engagement Type**  
The type of engagement should align with the client’s risk appetite and desired outcomes. Common engagement types include:
- **Full Engagement**: Simulating the entire attack lifecycle from initial compromise to the end goal.
- **Assumed Breach**: Begin with the assumption that the red team already has access to certain assets, testing internal security controls and lateral movement detection.
- **Tabletop Exercise**: An over-the-table discussion of attack scenarios, helping to identify potential weaknesses without actually executing live attacks.

**1.3 Scope and Constraints**  
- **Assets**: Clearly define which assets are in-scope for the attack (servers, networks, physical locations, employees).
- **Exclusions**: List any out-of-bounds areas (e.g., critical production systems that cannot tolerate disruptions).
- **Timing**: Decide when the engagement will take place and how long it will run.
- **Communication**: Define how and when the red team will communicate with the organization’s leadership and designated security officers.

---

### 2. **Engagement Preparation**

**2.1 Assemble the Red Team**  
The red team should consist of individuals with diverse skill sets in areas such as:
- Network penetration testing.
- Web application security.
- Social engineering.
- Physical security testing.

**2.2 Information Gathering (Reconnaissance)**  
Before the active phase of the engagement begins, the red team will conduct reconnaissance to collect information about the target. This might involve:
- **Open-source intelligence (OSINT)**: Collecting publicly available data on the organization and employees (LinkedIn profiles, social media posts, company website).
- **Network Scanning**: Identifying exposed services, subdomains, IP addresses, and other entry points.
- **Social Engineering Preparation**: Gathering information on employees to craft convincing phishing emails or phone calls.

**2.3 Setup Rules of Engagement (ROE)**  
Clear rules must be established to ensure safety and avoid unnecessary disruptions:
- **Allowed Tactics**: Define which tactics are permitted (e.g., phishing, physical entry, network attacks).
- **Emergency Procedures**: If an attack inadvertently causes damage or triggers significant concern, there must be a quick way to notify key stakeholders and pause the engagement.

---

### 3. **Execution of Red Team Engagement**

**3.1 Initial Compromise**  
- **Phishing**: Send spear-phishing emails to employees to capture credentials or deliver malware.
- **Social Engineering**: Call employees to extract sensitive information or gain physical access.
- **Exploiting Vulnerabilities**: Identify and exploit technical weaknesses in the network, applications, or infrastructure.
- **Physical Breaches**: Attempt unauthorized access to sensitive locations, such as data centers or offices.

**3.2 Lateral Movement & Privilege Escalation**  
After gaining an initial foothold, the red team will try to escalate privileges and move laterally within the network to access more critical systems. Tactics may include:
- **Credential Dumping**: Extracting user credentials from compromised machines.
- **Pivoting**: Using compromised systems as stepping stones to access other parts of the network.

**3.3 Exfiltration and Goal Achievement**  
Simulate exfiltration of data or access to sensitive information, such as:
- Critical intellectual property.
- Customer data.
- Financial records.

The red team will document how far they were able to progress, what data they could access, and whether they could achieve the specified goals.

---

### 4. **Reporting & Post-Engagement Review**

**4.1 Immediate Debrief**  
After the engagement, the red team and key stakeholders (e.g., leadership, security officers) will meet to review:
- High-level findings.
- Blue team's detection and response times.
- Any major disruptions caused by the red team activities.

**4.2 Detailed Report Creation**  
A comprehensive report will be generated that includes:
- **Attack Path**: Step-by-step breakdown of how the red team achieved initial compromise, moved laterally, and escalated privileges.
- **Exploited Vulnerabilities**: A list of identified vulnerabilities, including technical, physical, and human-based weaknesses.
- **Blue Team's Response**: Assessment of the blue team’s detection and response times.
- **Recommendations**: Actionable remediation steps for each identified issue, categorized by severity (Critical, High, Medium, Low).

**4.3 Recommendations & Remediation Plan**  
- Provide detailed guidance on how to fix vulnerabilities discovered during the engagement.
- Suggest improvements to incident response protocols, detection tools, and employee security training.
  
**4.4 Post-Engagement Training & Lessons Learned**  
Conduct a session with the blue team to discuss:
- What went well during the engagement.
- Areas where improvements are needed.
- Techniques to improve detection and response.
- Update the organization's security policies and incident response plans based on the findings.

---

### 5. **Follow-Up and Retesting**

**5.1 Implement Recommendations**  
Work with the client to ensure that the recommended remediation steps are implemented. This may involve:
- Patching systems.
- Updating security protocols.
- Strengthening access controls.

**5.2 Retesting**  
Schedule a follow-up red teaming engagement to validate that the security improvements have been successfully implemented and the organization is better prepared for real-world attacks.

---

### 6. **Conclusion**

The red team engagement provides a realistic and comprehensive assessment of the client’s security posture, identifying not just technical vulnerabilities but also weaknesses in people and processes. By testing the organization in a controlled environment, we ensure that they are better prepared to defend against sophisticated attackers.

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

This structured plan will guide your red teaming engagement from start to finish, ensuring a thorough evaluation of the client’s defenses and a clear path to strengthening their security posture. 
