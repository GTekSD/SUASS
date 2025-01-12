# OT and SCADA Penetration Testing

### Objective
- Introduce the challenges in industrial control system (ICS)/supervisory control and data acquisition (SCADA) testing
- Review ICS/SCADA network protocols
- Analyze Modbus network traffic
- Modify ICS/SCADA network data

## OT/SCADA Concepts 
### IT vs. OT System Architecture  
The types of networks discovered in operational technology (OT)/supervisory control and data acquisition (SCADA) architectures have several differences. One of the most significant is the lifetime of the systems; within critical infrastructure, systems can and often do remain in place for many years.

Another aspect to consider is that some of these systems operate in or around harsh environments. In fact, it is considered normal for SCADA environments to consist of extreme temperatures, dirt, fumes, radiation, and so on.

Enterprise IT Systems | OT SCADA Systems 
----------------------|------------------
Equipment update cycle of 1.5–4 years | Equipment update cycle of 20 years or more
Technology-based and mostly standards-based equipment installations | Typically, custom and proprietary equipment installations
Proactive system management (scheduled patching and updates) | Passive system management, patching and updates are not a priority


## ICS/SCADA Protocols  
- A **large variety** of protocols with some being proprietary
- Has evolved to more standards such as **Transmission Control Protocol (TCP)/ Internet Protocol (IP)**
- Like all protocols, these were based on the **principle of trust**
- **No inherent security** features for the most part Copyright 

Industrial protocols have evolved over time from simplistic networks that collect information from remote devices to complicated networks of systems that have redundancy built into the devices. Protocols utilized inside industrial control systems are occasionally very specific to the application. 

Over the years, many efforts have been made by standards organizations such as IEC, ISO, and ANSI to standardize protocols. There is an abundance of proprietary protocols as well. In most cases, these protocols are built by vendors to require specific software and hardware to create vendor-centric systems. Irrespective of the origin of the protocol, most industrial protocols have one aspect in common: they were not designed with security in mind and are inherently insecure. 

This has become a significant problem since their convergence with IT networks and the now-dominant Transmission Control Protocol (TCP)/Internet Protocol (IP)-based protocols. Understanding these security flaws and how they are exploited is crucial for penetration testing and threat modeling in industrial control system (ICS) environments.

### Control Plane vs. Data Plane  
- **ICS networks** have a separation between data-plane and control-plane protocols.
- Data Plane | Control Plane
  -----------|--------------
  **Parameters are passed** using standard SCADA protocols such as Modbus, DNP3 and Profinet | Used for **engineering activities** such as reprogramming the controller 

Unlike IT networks, ICS environments have a separation between data-plane and control-plane protocols. 
- **Data-plane protocols:**  
  These protocols are used to pass parameters and registers between human–machine interface (HMI) SCADA applications and I/O. Standard HMI and SCADA protocols such as Modbus, Profinet, and DNP3 are used here and are fully documented because vendors allow integration with all types of software solutions.
- **Control-plane protocols:**  
  These protocols Include all engineering activities, i.e., reprogramming of the controller, upload/download of the firmware, etc. These are unique engineering protocols because automation vendors created specific software to develop them. The reasoning was that only vendor software should be used to design these devices. Therefore, in addition to being proprietary, these protocols are usually undocumented and unnamed. This makes it difficult to monitor them. Moreover, they are difficult to test because there are few tools to do so. Since these are largely proprietary protocols, it is difficult to write tools that can test all different factors. Furthermore, some of these protocols were created for a specific task and have no documentation, and unless someone took the time to name and define a protocol, they are mostly unnamed.

### Example of Control-plane and Data-plane Protocols 

![Illustration of control-plane and data-plane protocols](https://github.com/user-attachments/assets/48e34430-5ddd-46cb-9a46-bc52cd84dd42)

As shown in the figure, penetration testers face challenges when testing in the control-plane side of a network. A common type of vulnerability is that in the programmable logic controller (PLC). An example is CVE-2017-16740. The vulnerability referenced here is within the control plane.

A description is as follows:  
A buffer overflow issue was discovered in Rockwell Automation Allen-Bradley MicroLogix 1400 Controllers, Series B and C Versions 21.002 and earlier. The stack-based buffer overflow vulnerability has been identified, which may allow remote code execution.  
This is an example of what a penetration tester much research if they encounter these protocols in testing. Since this is a Rockwell controller, there should be a good amount of documentation on it. As described above, there is a classic stack-based buffer overflow vulnerability. Since programmers are usually creatures of habit, more such vulnerabilities are likely to exist.


## Modbus  
SCADA Modbus is an application-layer messaging protocol positioned at level 7 of the Open Systems Interconnection (OSI) model. It provides client/server communication between devices connected to different types of buses or networks. Developed and published by Modicon in 1979 for use with its PLCs, Modbus is a method used for transmitting information over serial lines between electronic devices. The device requesting the information is called the Modbus master, and the devices supplying information are Modbus slaves. In a standard Modbus network, there is one master and up to 247 slaves, each with a unique slave Address from 1 to 247. The master can also write information to the slaves.

![Modbus message structure](https://github.com/user-attachments/assets/e0eaa30a-ac22-424d-9a99-3042d9482682)

The protocol’s simplicity and efficiency caused it to become the most widely used network protocol in the industrial manufacturing environment. It has been implemented by hundreds of vendors on thousands of different devices to transfer discrete/analog I/O and register data between control devices.

The Modbus protocol has been the most common SCADA protocol. The main reasons for the use of Modbus in an industrial environment are as follows: 
- It has been developed with industrial applications in mind. 
- It is openly published and royalty-free. 
- It is easy to deploy and maintain. 
- It moves raw bits or words without placing many restrictions on vendors. 
- SCADA systems using Modbus protocols are readily available.

### Modbus Protocol Types  
1. Modbus TCP
2. Modbus remote terminal unit (RTU)
3. Modbus ASCII
4. Modbus Plus
5. Modbus Daniels
6. Modbus Tek-Air
7. Modbus Omniflow

The most popular Modbus protocols are Modbus remote terminal unit (RTU) and Modbus TCP/IP.  
- Modbus RTU is a serial communication protocol that connects different devices on the same network, enabling communication between them.
- Modbus TCP/IP covers the use of Modbus communication via an “Intranet” or “Internet” environment using TCP/IP protocols. The most common use of the protocols is currently for the Ethernet attachment of PLCs, I/O modules, and gateways to other simple field buses or I/O networks. 

There will always be the question of why the connection-oriented TCP/IP protocol is used rather than the datagram-oriented User Datagram Protocol (UDP). The primary reason is to keep control of an individual “communication” by isolating it in a connection that can be identified, cancelled, and supervised without the need for specific actions on client and server applications. This provides the mechanism a tolerance to network performance changes as well as the possibility to add security features such as firewalls and proxies. 

Modbus TCP/IP handles two different situations. A connection can be recognized too easily at the protocol level. A single connection can be used to perform multiple independent communications. In addition, TCP/IP allows a huge number of concurrent connections in case the user decides to re-use an old connection or reconnect to a frequently used connection. 

#### How does Modbus TCP/IP work?  
The Modbus device can be connected using an Ethernet port on a gateway. A user can make a query using any standard Modbus Scanner to extract the value from a Modbus device. All requests are sent via TCP/IP on the registered port 502.

#### What is the difference between Modbus RTU, TCP/IP, and ASCII?  
The Modbus protocol defines a protocol data unit (PDU) that is independent of the underlying communication layers. Modbus RTU is the most commonly used and is a binary representation of the PDU with addressing before the PDU and a cyclic redundancy check (CRC) appended after the PDU. Modbus ASCII is a representation of the same PDU using all printable characters (and generally twice as many bytes). Modbus TCP/IP is essentially the same PDU as Modbus RTU, except that the CRC is left out of the application-layer byte string and included in the TCP layer to be dealt with automatically. Furthermore, there are some additional addressing bytes in the TCP encapsulation of the RTU packet. 

The function codes, register numbering, and addressing are identical for all protocol variants. Register types are the same, i.e., the same data blocks are defined for a Modbus device.

### Modbus Protocol and Open Systems Interconnection Model  
Data are stored in Modbus as follows: 
- Information in the slave device is stored in four different tables. 
- Each table has 9999 data points that can store different values. 
- Each coil has 1 bit and is given a data address between x0000 and x9999. 
- Each register is 1 word = 16 bits = 2 bytes and has a data address between x0000 and x9999.

The numbers 40001, 10000, etc. should be taken as the address of the location. These numbers are never displayed in actual messages. The actual address is the offset at the location where the number is stored. Therefore, if the device has application-defined units (ADUs), the address 0001 in Modbus and PDU would be at offset 40001 and 40002, respectively.

Each device in a network must be assigned a unique unit address, which can be between 1 and 255. When the master requests for data, the first byte it sends is the device/slave address. Therefore, the slave decides to response or ignore only after the first byte is sent.

![Modbus protocol vs. open systems interconnection model](https://github.com/user-attachments/assets/6e6dbd4b-4f99-4aeb-a1d3-40b3fb11529e)

A Modbus map is a simple list of points for any device that supports Modbus as a communication protocol. The Modbus map should have the following information: 
1. The kind of data the device reads and stores (e.g., temperature or pressure)
2. The address at which the data are stored (e.g., voltage A-N at 40001)
3. The format in which the data is stored (e.g., bits, UINT16, and SINT16)
4. Engineering units of the points, if required
5. Whether the device has ADU or PDU addressing

The popular network scanning tool Nmap has a script in its repository that can be used to detect and extract data from the Modbus protocol.

### Modbus Recon  
The Internet community can access Modbus at the reserved system port 502 on the TCP/IP stack. A simple request-reply scheme is used for all Modbus application protocol (MBAP) transactions. The client device (also known as master device) initiates a request, and the server (also known as slave) replies. For example, when an HMI workstation requires a value from a PLC, it sends a request message to start the data transfer process. The PLC then sends a response providing the requested information. In this situation, the device running the HMI acts as the client/master, and the PLC acts as the server/slave. Each message contains a function code set by the client/master and indicates to the server/slave the kind of action to perform. Function codes are numbers that tell the slave which table to access and whether to read from or write to the table.

![Screenshot showing Metasploit output](https://github.com/user-attachments/assets/bf898729-b709-4937-a812-33d294423859)


## ICS and SCADA Pen Testing  
The process of penetrating testing with ICS and SCADA is not the same as that of a normal IT pen test. With ICS/SCADA, penetration testers must determine the attack surface largely without sending data into the target, which results in a different type of process to follow for testing ICS and SCADA systems and, consequently, OT networks.

With this type of testing, penetration testers must ensure that they have accurate asset inventory and identification, this can be obtained from the client in the initial data call or from Open Source Intelligence gathering. SCADA penetration testing should be limited to test-bed or development systems and executed in a passive manner to avoid disrupting operations.

Step | Goal | Description
-----|------|------------
**Asset and System Identification** | Determine threat vector and prioritize | What will be assessed, the method, and in what order
**Vulnerability Identification** | Determine the threat level and vector; map the attack surface and risk | Identify the vulnerabilities that the discovered attack surface represents
**Risk Determination** | Determine the possible impact | Determine the risk based on the level of the discovered vulnerability

## Sample SCADA Network  
As shown in the figure, a corporate and a SCADA network are separated by a firewall. For external testing, the process is the same as for any other network, i.e., the filtering is the OT and IT networks must be determined. Like in most filter devices, the penetration tester must determine the rulesets and look for a specific vulnerability within them or accept the fact that the filters determine the attack surface and the risk from that attack surface; this is what should be ascertained during testing. 
- **HMI/controller machine:**  
  Usually, a Windows workstation is used as the master to manage and control PLCs on the network through client software. If compromised, an attacker can gain access to everything in the SCADA network. With the lifecycle of industrial systems being about 20 years, these Windows systems are often old. Therefore, it is critical for the client to understand the principle of least service and least privileges. The client mitigates and reduces their risk through penetration testing.
- **PLC:**  
  A PLC is a physical system connected with a power supply and the capability to communicate over Ethernet networks. It could have an LCD panel showing the controller status, operator messages, etc. In recent times, PLCs have been shown to be accessible via web browsers, Telnet, and Secure Shell (SSH), exposing it to different kinds of application and network layer attacks. If compromised, an attacker can manipulate the I/O of the client’s devices and cause serious damage to the organization. The PLC and the communication between it and the controller have been aspects that attackers could exploit; the famous Stuxnet attack was on a PLC.
- **End devices (sensor, valve, or pump):**  
  End devices are installed at a remote site. They report to PLCs over communication links such as radio, serial connections, Ethernet, or direct modems. If compromised, an attacker can compromise the integrity of the environment.

![Illustration of SCADA network](https://github.com/user-attachments/assets/e8fc097a-50be-4c2d-9dbe-2117abc14a1e)


## Approach  
- Penetration testing approach: how to prepare
- Planning
- Determine the purpose.
  - Model the threat.
- Understand the network layout.
  - Map the flow of data.
  - How do the end devices turn on and off?
- Network exploration
- Plan the attack (within the scope and rules of engagement).
- Exploitation

There is only a slim chance that the client’s site will have a test lab or mockup of their network. Nevertheless, penetration testers can attempt to emulate or build as much of a network to test on as possible to limit the impact on the site. However, some testing will need to be performed on the production side of the network, but as a best practice, the tester should avoid scanning anything on the production side and isolate any areas that control high-risk equipment. The tester must ensure that all stakeholders receive communications during each phase of testing. 

- **Purpose**  

  In IT testing, it is straightforward to determine the purpose of the target site. However, in OT, ICS, and SCADA testing, this is not so simple, because there are many different types of these networks running a variety of protocols. As the first prerequisite of any assessment, the pen tester must understand the purpose of the SCADA system: what mission-critical systems are in place, what functionality it provides, who the end users are, and how it benefits the organization. At this stage, it is a good idea to study system documentation, conduct research on implemented products and vendors, find known product vulnerabilities, and note factory-default credentials. A component of this stage is to model the threat.

- **Understand the network layout**  

  The primary purpose of studying the network architecture is to logically understand how each component of the SCADA environment relates to another (this is highly complex). The penetration tester should understand what components are involved and how are they segregated, connected, or exposed to the wider network. This phase also involves the identification of various subnets present within the network. Furthermore, it is important to determine whether the corporate network is separated from the SCADA network. The tester must mentally start to think about the attack surface; the presence of a web server; the presence of a database; and how these components connect, authenticate, and communicate. Moreover, the tester must consider the presence of applications visible at the front end, whether they can be fuzzed, etc.

- **Network exploration**  

  With the information obtained from the preceding phases, the penetration tester can begin exploring the network. Network exploration must be performed with care and customer consent. If the systems and services are scanned, only one port and one target should be scanned at a time. However, in most cases, the tester should attempt to obtain this information passively. Wireshark and other protocol analyzers are powerful tools for this purpose. SCADA systems can be very fragile; therefore, the tester should exercise great caution and perform only well-bounded testing. They should perform exploration while keeping stakeholders in informed.

- **Plan attacks**  

  The previous phase should provide the penetration tester sufficient information on what
they need to test and what attacks are applicable. If attacks are allowed within the scope, then the tester must prepare test cases and ideally practice them before running them against the site assets. Furthermore, they should only use code that they wrote and customized or thoroughly tested in the lab. This is advisable for all forms of testing and not just for SCADA.

- **Exploitation**  

  They client may ask the pen tester to execute each exploit individually. This will help in detecting the root cause in case any device unexpectedly experiences failure conditions. If failure occurs, the tester should halt testing and inform the client. Furthermore, they should attempt exploiting each component within the SCADA network, i.e., the network infrastructure, web interfaces, host operating systems (OSes), PLCs, HMI, and workstations, as in a conventional network pen test.


## Attack Monitoring

![Illustration of attack monitoring](https://github.com/user-attachments/assets/50ee634f-6626-4ea7-a50b-303c2dbb144b)  

This diagram is based on a threat target of evaluation in which a man-in-the-middle (MITM) attack may be simulated to change the commands to and from the HMI merely to observe what occurs. The pen tester can modify and read the messages transmitted between the machines, similar to how the Modbus protocol can be manipulated.

As shown in the diagram, this level involves much of the same attack surface and vectors as in IT networks. The difference here is that the tester has access to data being sent; in other words, they can control end devices, which could result in serious damage or even loss of life. 

This flow chart is a representation of the things that will more than likely be available when testing an OT network. Note that the flow chart may or may not be flat. Therefore, there could be a device between the pen tester and the network, which may limit or complicate what they can when testing. If the tester discovers from an external position that they can only map the attack surface through the device, which is usually a router or a firewall, then that is good for security. The tester’s job is to map the attack surface and then determine the risk from that surface; they can use some tricks or bypass firewalls to penetrate the filtering device between them and the target. The good news is that most of the testing will be on the OT flat side of the network because the majority of the networks have all of its interfaces on that side. While this is often the case, to the tester must be prepared to identify any mistake and determine the existence of an interface into the OT from the IT, which is something that does occur. 

The flow chart has an encryption encounter as a result of having to perform a denial-of-service (DoS) attack. However, penetration testers rarely resort to DoS attacks; instead, they examine the encryption protocol and algorithm being used and determine whether it is a strong or weak one, which would allow them to evaluate how to proceed.


## Testing Environment  
- The ideal environment is a **safe (non-production) simulation.**
- All **connecting components** need to be tested.
  - Can we accomplish testing with the safe environment?
- During information and documentation gathering
  - **Identify the protocols** being used on the system.
- **RTU**
  - RTU connectivity
  - Test or simulate traffic to and from

The ideal environment to assess SCADA is a safe (nonproduction) configuration. However, it is also desirable to have all connecting components and functionality available to confidently assess full system interoperability. 

An RTU is used in SCADA systems at a remote location to collect code and transmit data back to the control station, as well as to receive and implement commands from the control center. Ideally, these components are configured with actual signals for the assessment, although emulators and simulators may be necessary. 

The ability to establish a typical SCADA installation allows the assessment team to test and make recommendations on the configuration and deployment of a production system more accurately. Understanding the system configuration is key when deciding where the largest risks in the system may reside. Mirroring the connections to external systems is vital when replicating this configuration. 

The assessment team must know where and how a SCADA system element typically connects to, for example, the Internet. Any of these elements being accessed from outside the SCADA network, such as the historian database, should be tested based on its position in the network. 

Often, SCADA systems use OSes and hardware that are not in wide usage. Therefore, it is important that the assessment team have access to some of these less common platforms so that they can build their own testing environment for use during an assessment.

## Penetration Testing Actions Action  
A solid comprehension of the SCADA architecture that a pen test is intended for will help avoid pitfalls that could result in a negative effect on the operational process (i.e., hanging or crashing all or part of the process, costing the business lost revenue at the least or loss of life at the worst). The pen testing of IT systems or networks is often performed in real time. SCADA systems on an OT network should be examined as passively as possible. Preferably, there should be no active scanning or probing of the systems on the OT network to avoid compromising operations. In an ideal situation, a test bed, development, or sandbox system identical (e.g., mirrored) to the operational system would be in place not only for cybersecurity purposes but also for software testing and other implementation tests intended, eventually, for the OT system.

Action | Recommended SCADA Practices
-------|-----------------------------
Identify networks, hosts, and nodes. | <p>1. Inspection of the content addressable memory (CAM) table of the switch. <br>2. Inspection of router configuration files and route tables. <br>3. Physical wiring confirmation <br>4. Passive network monitoring</p>
Identify services. | <p>1. Verification of local ports <br>2. Use of test bed and sandboxes for scanning</p>
Identify vulnerabilities within the service. | <p>1. Local banner grabbing with version verification <br>2. Scan of mirrored test bed and sandbox systems</p>

## Host Attack Types  
#### Host 
- Access or an insider threat
- Physical security
  - Usually better than IT at most sites
- Operating system (OS)
  - Patches
  - Versions
- Baselining
  - Hardening testing

There is nothing new in the list as shown in the slide; many of the components of OT pen testing are the same as in the IT side.

As with all tests, physical security is a critical component. As the saying goes, “if I touch a box, I can own it.” The OS is like anything else in IT testing. The pen tester should determine what OS the client uses and at what patch level, and in alignment with this information, they should determine if the client has and uses a patch management system. Indeed, some readers might ask why they should worry about these aspects when on offense. The answer is that the pen tester must improve the security and defenses of the client; ultimately, as a security expert, it is the job of the pen tester to improve the security process of their clients in the best way possible.

Therefore, when possible, the pen tester should ask about baselining and the vulnerability management program. It is a good practice to test a scenario of a vulnerability in a component and let the client show how they would handle it.

## Network Attack Types 
#### Access to the network 
- Live computer jacks
- Active ports on switches
- Filtering bypass
- Man in the middle
- Denial of service
- Distributed denial of service

Once on site, it is imperative for network testing that the pen tester either obtain access to the switch room to determine the existence of ports that are not connected but are still live as well as to determine the existence of “live” network jacks anywhere in the site. This is a common problem because many in the OT field either have limited security knowledge or more likely consider their network isolated.

Next, the tester should consider their testing location. If the location is internal, then the tester cannot evaluate the attack surface through the perimeter device. If possible, the tester should obtain a network diagram and review the ingress and egress points. A site representative should hopefully be able to assist by revealing some aspects about their network as well as the traffic into and out of the segments. Hopefully, the client would have segments that help isolate traffic. However, the tester should not expect to obtain too much information because network engineers that know enough about their networks are rare even in the IT sector. 

If the location is external, then the tester should attempt using some techniques to bypass the filtering. They can test for fragmentation scanning to check whether it yields different results, but it should only be performed on one port at a time and on noncritical points. The tester can use source port scanning to find any weak rules. Since these networks are usually on a very long lifecycle, there are chances of finding weak filtering; thus, they should be tested. 

For internal testing, the following levels of access must be tested for: 
- Unauthenticated 
- Authenticated as a regular user 
- Authenticated as a privileged user

In most cases, the tester will have more than enough findings with the first two and rarely need the third item.

For MITM attacks, it is best to run Wireshark or another protocol analyzer and determine whether the network is well segmented with switches and proper virtual local area network (VLAN) configurations. Another trick is to spoof the media access control (MAC) address of the default gateway and determine the existence of any traffic going in and out of the OT network that is not protected with first encryption and authentication. Since some of these networks are quite dated, there is a chance of finding cleartext protocols such as the File Transfer Protocol (FTP) and Hypertext Transfer Protocol (HTTP), which should be assessed. 

Another task is to determine the possibility of egressing out from the OT network with an encrypted protocol such as SSH or any virtual private network (VPN) protocol; in such a case, the tester can blind any monitoring the client has in place. If the tester discovers through MITM attacks that the client has done a good job and encrypted the traffic, they should attempt to spoof the encryption and get the user to either accept the certificate, if they are using HTTP secure (HTTPS), or store the key, if they are using SSH. 

If possible, the pen tester should obtain configurations and review them for the best practices of ingress and egress filtering as well as the recommended guidelines to defeat distributed DoS attacks.

The tester should assess the environment and test for the following:  
- Ingress 
- Sanity checking 
- Bogon filtering and RFC 2827 to defeat DoS attacks 
- RFC 3704 and GEO IP blocking 
- Egress 
- Blocking of outbound connections initiated from servers—on discovering servers, spoof the network traffic and determine if it is allowed out or if the access to other things that were blocked before are now allowed.
- Blocking of any packet that does not have a source IP address of the site network 
- NIST 800-82 best practices 
- Blackhole routing—is the network traffic for the Domain Name System (DNS) and HTTP/HTTPS from one source or can anyone directly egress out?

If the tester cannot gain access to the configurations of the devices between the OT and IT, then they should test it from both sides with their team.


## Ports of SCADA  
The concern with Internet-facing PLCs is that they can be targeted by adversaries to breach the perimeter and enter the network. Then, they can attempt to achieve persistence and start scanning devices over the network, move laterally across, and perform malicious actions, such as bringing down the plant or creating a disaster. 

The following are some of the threats for Internet-facing PLCs: 
- Remote-access attacks 
- PLC worms; payload sabotage attacks 
- PLC rootkits

For PLCs that are directly accessible, even though only the PLC web server is accessible directly from the Internet, several remote-access attacks could be performed, including DoS attacks and integrity attacks such as downloading and overwriting of the PLC program with a sabotage PLC program. Doing so compromises the integrity of the PLC. For instance, port 102 is used by the Siemens proprietary S7 family PLCs, and port 502 is used for Modbus, which is one of the de facto industrial control system protocols for communication between a PLC and a plant component acting as the slave device. Each slave in Modbus has a unit ID, which gives an idea of how many slaves are being controlled by that PLC.

Nmap now has scripts for SCADA, and certain Nmap scripts such as “s7-info.nse” are written specifically for ICS environments to gather information about Siemens PLCs. Therefore, the PLC is one of the main components to test.

| Protocol                | Port(s)                          |
|-------------------------|----------------------------------|
| BACnet/IP               | UDP/47808                        |
| DNP3                    | TCP/20000, UDP/20000             |
| EtherCAT                | UDP/34980                        |
| Ethernet/IP             | TCP/44818, UDP/2222, UDP/44818   |
| FL-net                  | UDP/55000 to 55003               |
| Foundation Fieldbus HSE | TCP/1089 to 1091, UDP/1089 to 1091|
| ICCP                    | Vendor Application Specific       |
| Modbus TCP              | TCP/502                          |
| OPC UA Binary           | TCP/4840                         |
| OPC UA Discovery Server | TCP/4840                         |
| OPC UA XML              | TCP/80, TCP/443                  |
| PROFINET                | TCP/34964, UDP/34962 to 34964    |
| ROC Plus                | TCP/UDP 4000                     |


## Nmap Scripting Engine  
Quite a few scripts are available within the Nmap tool, and a tester should be aware of these.

| Script Name                      | Description                                                                                  |
|----------------------------------|----------------------------------------------------------------------------------------------|
| `BACnet-discover-enumerate.nse`  | Identify and enumerate BACnet devices.                                                       |
| `codesys-v2-discover.nse`        | Identify and enumerate CoDeSys V2 controllers.                                               |
| `enip-enumerate.nse`             | Identify and enumerate EtherNet/IP devices from Rockwell Automation and other vendors.       |
| `fox-info.nse`                   | Identify and enumerate Niagara Fox devices.                                                  |
| `modicon-info.nse`               | Identify and enumerate Schneider Electric Modicon PLCs.                                      |
| `Omron-info.nse`                 | Identify and enumerate Omron PLCs.                                                           |
| `pcworx-info.nse`                | Identify and enumerate PC Worx Protocol-enabled PLCs.                                        |
| `proconos-info.nse`              | Identify and enumerate ProConOS-enabled PLCs.                                                |
| `S7-enumerate.nse`               | Identify and enumerate Siemens SIMATIC S7 PLCs.                                              |

