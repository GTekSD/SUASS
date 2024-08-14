![network](https://www.cipherex.com/wp-content/uploads/2024/01/Conducting-a-Robust-Infrastructure-Security-Audit-A-Step-by-Step-Guide.png)

# Infrastructure Penetration Testing

![Approch](https://securitycafe.ro/wp-content/uploads/2015/01/infrastructure_testing1.png)

The purpose of this type of testing is to provide clients with a level of confidence that their Internet and LAN infrastructure is secure.

For this purpose, we split the infrastructure tests in two categories:

- **External penetration tests:** verify if unauthorized access can be gained via the external network components by a hacker having limited or no previous knowledge of the network.
- **Internal penetration tests:** determine which level of unauthorized access can be gained by an internal attacker who already has access to the internal network. Test if the ‘crown jewels’ of your business are protected against internal attackers.

## Testing process

Our structured approach to attacking a network is shown in the picture above and it has the following phases:

### Gather information about your organization and your systems from:

- the Domain Name Service (DNS)
- the Internet registration database (RIPE)
- bulletin boards, forums and other social media
- the web
- other relevant sources

### Identify and analyze the machines exposed to the Internet for:

- active ports (TCP and UDP)
- running services (ex. DNS, SMTP, VPN, etc)
- login services for remote access
- SNMP (if active)

### Iteratively scan for vulnerabilities (operating system and services):

- well-known vulnerabilities
- configuration errors
- design errors

### Exploit the identified vulnerabilities in order to gain unauthorized access to systems or data:

- manual exploitation
- use validated exploit code and tools
- do not affect the functionality of the system
