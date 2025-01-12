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



