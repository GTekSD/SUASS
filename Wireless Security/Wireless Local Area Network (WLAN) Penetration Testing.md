![image](https://github.com/user-attachments/assets/f7227f1e-df82-4d65-b63c-b5e4b0db735c)# Wireless Local Area Network (WLAN) Penetration Testing

Today organizations face several challenges in securing their wireless networks. There are several threats that are unique to wireless environment from rogue APs to weak encryption algorithms. WLAN penetration testing helps in identifying various possible threats and attacks on the target organization, such as sniffing, MAC filtering and spoofing, DoS, cracking encryption, and man-in-the-middle attack.

## Discover the Wireless Networks

Discover the wireless networks by wardriving. To discover Wi-Fi networks, the tester needs the following things: 
- Portable computer or laptop with Wi-Fi card 
- Wireless network discovery tools, such as inSSIDer Office, NetSurveyor, and Xirrus Wi-Fi Inspector
- WLAN adapter suitable for the specific tool 
- An external antenna (optional, but highly recommended) 
- A GPS receiver for surveying large areas

Wi-Fi networks may be found by driving around with the Wi-Fi enabled laptop. The laptop is recommended to contain the wireless discovery tool installed on it. Using the wireless discovery tool, testers may map out the active wireless networks. Several Wi-Fi network discovery tools, such as inSSIDer Office, NetSurveyor, Xirrus Wi-Fi Inspector, Acrylic Wi-Fi Home, WirelessMon, Ekahau HeatMapper, are available online that give more information about the wireless networks in the vicinity.

Note SSIDs, BSSIDs, encryption technique, and beacon strength of discovered APs. Also, identify soft APs; a soft AP is set up on a Wi-Fi adapter without the need of a physical Wi-Fi router, for example, Wi-Fi in mobile devices

One way to identify the rogue APs is to use the pre-configured authorized list of APs. 

- If any new AP which is not present in the authorized list of APs is detected, it would be considered as a rogue AP
- If MAC of any discovered AP is not present in the authorized list of MAC addresses, it would be considered as a rogue AP
- If radio media type used by any discovered AP is not present in the authorized list of media types, it would be considered as a rogue AP
- If radio channel used by any discovered AP is not present in the authorized list of channels, it would be considered as a rogue AP

  ![Discovering wireless network by war-driving](https://github.com/user-attachments/assets/f1482b13-fee9-4639-8fe0-a1c43fa31fc4)

Use Wireless network discovery tools, such as WirelessMon, NetSurveyor, etc. to detect APs, soft APs, and rogue APs. 

### NetSurveyor  
  Source: http://nutsaboutnets.com  
  NetSurveyor is an 802.11 (Wi-Fi) network discovery tool that gathers information about nearby wireless APs in real time and displays it in useful ways. The data is displayed using a variety of different diagnostic views and charts. Data may be recorded for extended periods and played back at a later date/time. Also, reports may be generated in Adobe PDF format. Applications of NetSurveyor are listed below:  
- During the installation of a wireless network, it helps in verifying the network is properly configured and antennas are positioned at locations to achieve efficient transmission/reception.
- Trouble-shooting an existing network or wireless environment that is performing poorly
- Reporting the presence of Wi-Fi networks and local APs and the signal strengths of their beacons
- Conducting wireless site surveys where the installer is interested in learning about the coverage of a new or existing AP, roaming capability, presence of RF interference or “dead spots,” and optimum location of APs, their antennas and client stations
- In a secure business environment, it detects the presence of rogue APs o Helps in understanding the relationship between APs (BSSIDs), wireless networks (SSIDs), and client stations (STAs)

  ![NetSurveyor-802](https://github.com/user-attachments/assets/33503cdc-0c0f-4150-9fd9-e5abb0ef7eff)

### WirelessMon  
 Source: https://www.passmark.com  
 WirelessMon is a software tool that allows users to monitor the status of wireless Wi-Fi adapter(s) and gather information about nearby wireless APs and hot spots in real time. It may log the information it collects into a file, while also providing comprehensive graphing of signal level and real time IP and 802.11 Wi-Fi statistics. 

#### Features:  
- Verifies that the 802.11 network configuration is correct
- Tests Wi-Fi hardware and device drivers are functioning correctly
- Check signal levels from your local Wi-Fi network and nearby networks
- Locates the sources of interferences to a network
- Supports the MetaGeek Wi-Spy (2.4i, 2.4x, and DBx) useful for finding interference from non 802.11A/B/G/N devices transmitting on the same frequencies
- Scan for hot spots in your local area (wardriving)
- Creates signal strength maps of an area (heat maps)
- GPS support for logging and mapping signal strength
- Measures network speed and throughput and view available data rates
- Scans for hot spots in your local area (wardriving)
- Verifies the security settings for local Aps and checks Wi-Fi network coverage and range

  <img width="828" alt="wirelessmon-big" src="https://github.com/user-attachments/assets/8db42be1-667d-4b03-9f72-4a66dec55cdf" />

## Check Physical Security of AP

Physical security of AP describes security mechanisms that are designed to restrict access to unauthorized person (including attackers or intruders) from physically accessing an AP. It means, placing APs in such a manner that they cannot be stolen, moved, vandalized, blocked, or damaged. Good physical security of an AP uses the concept of defense in depth, in appropriate combinations to deter and deny access to unauthorized personnel.  
Follow the steps given below to check the physical security of AP:

- Check the physical location of all authorized APs. 
- Check if physical access to APs is controlled. 
- Check network’s physical security policy and determine who has the authorized physical access to APs.
- In addition, keep track of all APs by creating a spreadsheet including each AP’s location, model type, and MAC and IP address.

## Detect Wireless Connections

Detecting wireless connections allows a tester to identify various network vulnerabilities, such as open ports and services and thereby helps in assessing and determining the security standards of the organization’s wireless network.

You may detect the wireless connections using the wireless network discovery tools, which use two different scanning methodologies to detect, monitor, and log a WLAN device. These two scanning methodologies are active scanning and passive scanning. 

Both the methods gather WLAN’s AP information by capturing and decoding a beacon frame which contains network information that includes SSID, BSSID, and the network encryption implemented. 

###  Active Scanning 

Active scanning methodology involves broadcasting a probe request frame and waiting for responses from available wireless networks. This method retrieves information including the WLAN’s ESSID, BSSID, signal strength, operation channel, and presence of network encryption.  

Active scanners uncover the weak points in the network and let you know how an outsider could spot the network. By using the active scanners, you may resolve the uncertainties associated with the network, such as restricting the attacker’s IP addresses, etc. Examples of active wireless scanners include MiniStumbler, inSSIDer Office, etc.

### Passive Scanning

Passive scanning methodology involves a way to detect the existence of an AP by sniffing the packets from the airwaves. It reveals the AP, SSID, and client STA (station) details. While active scanners focus on stimulating and resolving the issues, passive scanners, on the other hand, helps you in monitoring the network activities. They simply scan the entire network and indicate the existence of the loopholes that could cause the attacks. Some of the passive scanners include Kismet, KisMAC, AirPCap, airodump-ng, etc.

## Sniff Traffic between the AP and Linked Devices 
The penetration testers are advised to keep their laptop and a wireless network card in open or promiscuous mode in order to sniff traffic between the AP and linked devices. The promiscuous mode allows the radio to scan all available wireless channels and capture information within range. 

You may try to passively monitor transmissions to identify communication patterns and participants. By passive monitoring, you may capture all the wireless network traffic regardless of the destination and even without being connected to any AP. Thus, this helps you to look for passwords and other sensitive data traversing the airwaves.

## Create a Rogue Access Point and Try to Create a Promiscuous Client

Rogue APs are the soft APs that are used to bypass the authentication of the security systems of an organization. These APs are used as a backdoor to the network with the purpose of sniffing wireless network traffic, or to get easy access to some other wireless network. You may use rogue APs to identify and analyze various types of possible attacks and the damage caused by such attacks on the target organization. 

Promiscuous client may be created by creating unsecured AP and forcing a user to connect to the unsecured network.

1. Choose an appropriate location to plug in your rogue AP that allows maximum coverage from your connection point
2. Disable the SSID Broadcast (silent mode) and any management features to avoid detection
3. Place the AP behind a firewall, if possible, to avoid network scanners
4. Set up a rogue AP for shorter periods and force the user to connect to the unsecured network
5. Try to gain access to the network data

  ![Promiscuous client connecting to a Rogue APPromiscuous client connecting to a Rogue AP](https://github.com/user-attachments/assets/09201134-3ab5-48b7-8ba5-23a829f5879f)

## Use a Wireless Honeypot to Discover Vulnerable Wireless Clients

You need to discover vulnerable wireless clients and identify the weak wireless APs (WAP) that are allowing the unauthorized clients to connect with the target organization’s network. 

In order to do so, you may setup a honeypot (also known as an “evil twin AP” or fake wireless AP) that lures the unauthorized clients into connecting to it and alerts the administrator, leaving the actual network totally secured. Make sure that the honeypot is securely configured so that it does not compromise other hosts on the same network. After setting up the honeypot, run tools, such as Wi-Fish Finder, AirMagnet Wi-Fi Analyzer PRO, etc. to discover vulnerable wireless clients. 

Once you find a vulnerable client, try to obtain the following information: 
- Try to capture any email or FTP connections 
- Try to access the user’s file shares 
- Try to capture user’s login credentials by means of captive portal or spoofed DNS caching (displays a fake website that looks like a mirror image of a hotspot or website login page)

You may use AirMagnet Wi-Fi Analyzer PRO to identify vulnerable wireless clients in the network: 

###  AirMagnet WiFi Analyzer PRO  
Source: https://enterprise.netscout.com  
Image Source: https://www.fullcontrolnetworks.co.uk/ (https://www.spectrotech.com.au/wp-content/uploads/2016/06/Dashboard-Feature_1.jpg)
AirMagnet WiFi Analyzer PRO is a wireless network monitor that provides real-time accurate, independent and reliable Wi-Fi analysis of 802.11a/b/g/n and ac wireless networks, including 3 X 3 802.11ac wireless network analysis without missing any traffic. It is a portable wireless network analyzer that travels to the source of the wireless network troubleshooting problems enabling fast and accurate fault-finding without any AP downtime. It is a dedicated Wi-Fi network monitoring and troubleshooting software solution guaranteeing any wireless network fault detection as compared to “time-slicing monitoring functionality” built inside the wireless network infrastructure.

  ![Screenshot of AirMagnet Wi-Fi Analyzer PRO](https://github.com/user-attachments/assets/02241731-936c-4060-9ce1-ade48d14fd94)

## Perform a Denial-of-Service Attack (De-authentication Attack)

Wireless networks are susceptible to DoS attacks. DoS attacks may totally break down or disable WLAN of the target organization. You need to discover the vulnerabilities that lead to DoS attacks on a wireless network. Wireless networks generally operate on unlicensed bands and data transmission takes the form of radio signals. Wireless DoS attacks disrupt network wireless connections by sending multiple broadcast deauthenticate commands. Transmitted deauthentication commands forces the clients to disconnect from the AP. It has the potential to completely disrupt the wireless network performance by flooding the targeted machine with excessive requests to overload the system.

 ![Deauthentication attack](https://github.com/user-attachments/assets/f1ecff69-9192-48f9-8ab9-fde15d894cc6)

You may also perform “Self DoS attack” by turning the AP into a connection killing machine by sending the malformed packets.

 ![image](https://github.com/user-attachments/assets/f24d199d-49c4-46fe-ac7d-08ca179737fe)

## Attempt Rapid Traffic Generation

You may perform sniffing on wireless networks to identify the source and destination MAC addresses. You may access the MAC address from the header of the packet even when the content of the packet is encrypted with WEP. Identifying these addresses helps you in discovering the hosts on the wireless network as well as on a bridged and wired LAN.

Wireless networks that use WEP for encryption do not provide any security against replay attacks. Thus, you may capture any packet and retransmit it on to the target network after modifying its content. The packets are strongly encrypted; hence you need to guess its content by analyzing the network traffic. For example, if you may guess an ARP request that generates an ARP response from another host in the network then you may replay the same packet multiple times. This forces the host to provide a huge stream of encrypted responses, thus causing rapid traffic generation. 

You may use aireplay-ng tool that comes with the aircrack-ng suite. This tool may generate many packets in few minutes and crack WEP keys after gathering many packets. It comes with the aircrack-ng, so it has many features of aircrack-ng that helps you to crack the WEP keys.

  ![Screenshot of aireplay-ng for Rapid Traffic Generation](https://github.com/user-attachments/assets/a32b4e91-72e2-4533-8094-367400181936)

## Attempt Single-packet Decryption

You may perform Single-Packet decryption using ChopChop attack. This attack works against WEP protocol and allows you to decrypt a WEP data packet without prompting for the WEP key. ChopChop attack does not recover the WEP key itself, but simply discloses the plaintext. You need to test whether the target APs are vulnerable to this attack. Generally, the APs drop the packets containing less than 60 bytes of data. You may use aireplay-ng to guess the missing data of the packet, such as headers. To perform this attack, you need to capture minimum one WEP packet.

Perform this attack on the target organization’s wireless network and analyze the results:  
 - If you are able to recover the plain text, then compare it with the actual WEP data packets to determine the security level of the target network.

The screenshot given below illustrates performing chopchop attack using aireplay-ng: 

 ![Screenshot of aireplay-ng performing Chopchop attack](https://github.com/user-attachments/assets/fb93ff7c-410a-4de6-af93-6f10ac419a2d)

You may obtain the result in a file “replay_dec-0201-191706.cap” and view the decrypted packet using tcpdump or Wireshark.

 ![Screenshot of aireplay-ng output of Chopchop attack](https://github.com/user-attachments/assets/662f399e-595f-4312-889f-15ecc6990b03)

## Perform an ARP Poisoning Attack

ARP is used to determine the MAC address of an AP whose IP address is known. ARP poisoning is one way to test the wireless network security. Usually ARP protocol does not provide any authentication to verify whether the received response is a forged one or legitimate response from a valid host. In this test or technique, the tester is advised to try to exploit the lack of verification. The tester is advised to send an ARP Replay packet constructed with a wrong MAC address, this corrupts the ARP cache maintained by the OS.

The ARP poisoning attack has its impact on all the hosts present in a subnet. All stations associated with a subnet will be susceptible to ARP poisoning attack and are vulnerable as most of the APs act as transparent MAC layer bridges. All the hosts connected to a switch or hub are susceptible to ARP poisoning attack, if the AP is connected directly to that switch or hub without any router/firewall in between them. If the tester may break the security of one host in a subnet, then it is possible to compromise the rest of it. This is because, most of the APs act as transparent MAC layer bridges. The following diagram illustrates the ARP poisoning attack process:

 ![Block diagram of ARP poisoning attack](https://github.com/user-attachments/assets/a45b78d1-6415-462d-a57d-ef6482f1fad2)

You may use tools, such as Cain & Abel to perform ARP poisoning attack on the target wireless network:

### Cain & Abel  
Source: http://www.oxid.it  
Cain & Abel is a popular tool to perform ARP poisoning attack. It is used to perform sniffing on switched LANS and man-in-the-middle attacks. Before using this tool, you need to disable the antivirus or firewall installed in your system and you need to configure the tool to work with the network that your system is connected. Next, you need to start the sniffer to populate all the connected hosts on the network. Now select all the hosts in the subnet and ensure that the target device is in the list. Now start performing ARP poisoning. Before spoofing you may run tools, such as Wireshark to capture and monitor ARP poisoning packets to the target device.

 ![Screenshot of Cain & Abel performing ARP poisoning](https://github.com/user-attachments/assets/2b8738cb-b630-4498-99a6-76efb18cff1f)

## Try to Inject the Encrypted Packet 

Packet injection, also known as forging packets or spoofing packets, is the process of developing fake packets and inserting them into an established network. This attack may allow an outsider to interrupt communication of authenticated users and restrict their access over certain network services. Packet injection attacks may also list APs in the zone which respond to broadcast probes and perform a 30 packet test. 

You may inject custom encrypted packets on the target wireless network to test the network’s vulnerability to certain packet injection attacks. This test also helps you to identify if the wireless card may effectively inject and determine the ping response time to the AP. This attack is also used to test a specific AP or test a hidden SSID. 

You may use tools, such as aireplay-ng to inject encrypted packets on the target AP.

 ![Screenshot of aireplay-ng injecting encrypted packets](https://github.com/user-attachments/assets/17e06a40-e0cf-41e7-86b9-64f91865ce2c)

## Crack WPA-PSK Keys 

WPA-PSK is an authentication mechanism. In order to verify the authentication of a wireless network configured with this kind of authentication mechanism, users need to provide some form of credentials. Both WPA and WPA-PSK use the same encryption mechanism, but the only difference is that WPA-PSK authentication requires a simple common password. In general, the shared password systems are vulnerable. Similarly, the Pre-Shared Key (PSK) is also vulnerable to the same risks.

### WPA2 Handshake

The WPA2 four-way handshake is designed for mutual authentication between the AP (AP) and the wireless client without revealing the key. All the messages between the AP and the client are protected by encryption and may only be decrypted using Pairwise Master Key (PMK), which is already shared by them. The four-way handshake protects the messages from various malicious APs and attacks.

### How WPA2 Handshake Works? 
- The user entered passphrase along with SSID of an AP is supplied to a Password-Based Key Derivation Function 2 (PBKDF2) to generate 256-bit PSK or PMK
- Either the client or the AP creates PSK, and then, 4-way handshake communication takes place between them by exchanging packets, such as SNonce, ANonce, client’s MAC, and AP’s MAC
- This information is then used to create PTK (Pairwise Transient Key) for current session
- The message integrity check (MIC) signature generated for packet and is signed by using the PTK

 ![WPA2 four-way handshake](https://github.com/user-attachments/assets/65f308a5-b59e-466b-b318-941bd77425f6)

The drawback in the WPA-PSK is that the authentication messages and keys are encrypted and shared using a four-way handshake mechanism. If you can capture the messages containing keys during the handshake then you may try to crack them using various tools. You need to sniff 4-way handshake communication between the client and the AP and observe the information, such as SNonce, ANonce, client’s MAC, and AP’s MAC exchanged during handshake. You may use Dictionary attack where you need to try each of the passphrases in Dictionary file and generate PSK. Also, observe the message integrity check (MIC) of packet which is signed by using the PTK. Using the PTK, you may reconstruct the MIC and compare it to MIC of sniffed packet. If it is matched, you have successfully cracked WPA-PSK key.

 ![Cracking WPA-PSK keys](https://github.com/user-attachments/assets/8dade35b-f15d-4ad8-bfec-282777c655e8)

## Crack WPA/WPA2 Enterprise Mode

WPA Enterprise is a complicated mode that is designed for enterprise wireless networks and it requires additional authentication from a RADIUS server. Enterprise mode of WPA/WPA2 is more secure than the PSK mode as it uses separate username and password to authenticate the devices over the RADIUS server and is also susceptible to man-in-the-middle (MITM) attack. You need to create a fake AP with the same SSID, such as that of an original network and wait for clients to connect to these points. After obtaining the credentials, you may use this information to connect to the wireless network of the target organization.

## Check for MAC Filtering 

MAC filtering is a process used by network administrator to allow only the list of approved MAC addresses to connect to a router in the wireless network. This restricts the unauthorized clients from connecting to the network and thereby safeguarding it from various attacks. 

Use aireplay-ng tool to determine whether the target AP using MAC filtering or not. If the wireless network card supports packet injection, you may attempt a forced association. However, if MAC filtering is active, the association will be denied. For this procedure, you will need BackTrack or similar UNIX/Linux system. Open a terminal window and run the following command using aireplay-ng: 

```shell
aireplay-ng –fakeauth 0 –e {target ESSID} –a {MAC address of AP} –h {MAC address of your forensic laptop’s wireless card}
Example:
aireplay-ng –fakeauth 0 –e belkin54g –a 00:11:50:53:9A:24 –h 00:20:A6:52:23:30
```

Once the command is executed a message will be displayed, showing whether the authentication and association were successful. However, if MAC filtering is active, the association will be denied. If the association is successful, then it implies that the target wireless network is at risk.

## Spoof the MAC Address

MAC address spoofing allows you to change your MAC address on your Network Interface Controller (NIC) card for legitimate and non-legitimate purpose. You may perform MAC address spoofing to impersonate a legitimate device on the network to circumvent existing security procedures of the target organization. MAC spoofing opens up a variety of attack vectors and can bypass access control list on servers and routers, such as impersonation, DoS, man-in-the-middle attack, etc. Follow the steps given below to spoof the MAC address of the target host: 

1. After determining an allowed MAC address, spoof the MAC address from the captured frame and try to gain access
2. Before changing the MAC, deactivate the wireless network card
3. Close airodump-ng or any other program that utilizes the network card before continuing:
  ```shell
  ifconfig {interface} down
  ```
4. In BackTrack, type the following command in the MAC changer window:
   ```shell
   macchanger –m {MAC of currently associated device} {interface}
   ```
5. After the MAC address is changed, the display will show the previous and new MAC address and vendor settings
6. Reactivate the wireless network card:
   ```shell
   ifconfig {interface} up
   ```
7. Attempt an authentication and association to the AP using the spoofed MAC address
8. If you see the “success” message, MAC filtering is indeed active on the AP

 ![Screenshot showing macchanger command to Spoof MAC address](https://github.com/user-attachments/assets/fcdb6660-cb7d-4266-9b62-991b89b25548)

## Create a Direct Connection to the Wireless Access Point

You need to check whether the target wireless network is allowing direct connections to malicious devices. If the target network is allowing direct connections, then it is vulnerable to various types of network attacks.

Plug the network cable between laptop and the wireless AP. If the wireless AP and laptop is DHCP enabled, then the laptop will automatically be assigned to an IP in the same network range. This IP follows the private IP address technique. In most cases, a wireless AP will be present in the same network range as that of a laptop, with the last octet of the IP address of an AP being “1” 

For example, if your laptop has the IP address 192.169.1.100, then the wireless AP will most likely have the IP address 192.168.1.1.

 ![Screenshot showing available wireless connections](https://github.com/user-attachments/assets/25735bf3-7dec-486d-bc13-b5f64700e652)

 ![Screenshot of Internet Protocol Version 4 (TCP/IPv4) Properties](https://github.com/user-attachments/assets/a1f55190-6f0a-49f0-b885-6ff6f3e57def)

If the DHCP is not enabled, you need to assign the IP address to the forensics laptop that is in the same “Class” of the wireless AP. The IP address of the wireless AP may be determined by typing the command “ipconfig” in the command prompt. The result shows the “Default Gateway” that is the IP address of the wireless AP.

 ![Screenshot showing output of ipconfig](https://github.com/user-attachments/assets/28a4f383-90fd-4824-90fc-89015fa35dd2)

Once you get the IP address of the wireless AP, try connecting to it by typing it in the address in the address bar of a web browser. A login window will pop up and will ask to fill in the credentials for obtaining access to the wireless AP.

 ![Screenshot of Windows Security sign in window pop-up](https://github.com/user-attachments/assets/07671231-8c15-403e-866f-6e68e6044f48)

## Additional Wireless Penetration Testing Tools 
Wireless penetration testing tools help you to evaluate the information security measures implemented in the target wireless network. These tools help the tester to identify design weaknesses, technical flaws, and vulnerabilities in the wireless networks. You may use some of the popular tools, such as Aircrack-ng suite, Kismet, AirMagnet Wi-Fi Analyzer, AirDefense, etc. to perform wireless penetration testing.

### Kismet  
Source: https://www.kismetwireless.net  
Kismet is a wireless network detector, sniffer, and intrusion detection system. Kismet works predominately with Wi-Fi (IEEE 802.11) networks but may be expanded via plug-ins to handle other network types. It identifies networks by passively collecting packets and detecting standard named networks and hidden networks.
To identify the networks and hidden networks, Kismet divides the process in three parts: Kismet drone, Kismet server, and Kismet client. Kismet drone captures the network packets, and then forwards them to the Kismet server for interpretation purpose. Then, the server interprets the packet data and extracts and organizes the wireless information in a well-defined manner. At last, the Kismet client makes connection to the server and displays the collected information.

 ![Screenshot of Kismet](https://github.com/user-attachments/assets/e0fef3a0-6380-425b-bc08-6eeaff22f146)

### AirDefense  
Source: https://www.extremenetworks.com  
The Extreme AirDefense Services Platform (ADSP) simplifies the management, monitoring, and protection of your WLAN networks. The platform supports three key functions—security and compliance, network assurance, and proximity awareness and analytics. 

#### Features:
 
 - It allows penetration testers to automatically log on to an AP and test for vulnerabilities from the perspective of a wireless hacker.
 - Extreme sensors conduct wireless penetration testing, proactively identifying vulnerabilities before they may be exploited, so you may better manage threats and keep your systems secure.
 - It also allows you to capture a complete record of WLAN performance, giving you the ability to rewind and analyze detailed records of wireless activity in support of forensics investigations or network performance troubleshooting.
 - Provides a single UI-based platform for wireless monitoring, intrusion protection, automated threat mitigation, etc.
 - It also provides tools for wireless rogue detection, policy enforcement, intrusion prevention, and regulatory compliance and uses distributed sensors that work in tandem with a hardened purpose-built server appliance to monitor all 802.11 (a/b/g/n) wireless traffic in real time.
 - It analyzes existing and zero-day threats in real time against historical data to accurately detect all wireless attacks and anomalous behavior.

 ![Screenshot of AirDefense](https://github.com/user-attachments/assets/136dad1d-4597-4cab-8fcd-1e4d681f40cc)

