# Wireless Local Area Network (WLAN) Penetration Testing

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
