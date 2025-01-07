![wd](https://github.com/user-attachments/assets/9ece5c15-10b4-4954-be31-937195a0ad02)# Wireless Local Area Network (WLAN) Penetration Testing

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

- **NetSurveyor**  
  Source: http://nutsaboutnets.com  
  NetSurveyor is an 802.11 (Wi-Fi) network discovery tool that gathers information about nearby wireless APs in real time and displays it in useful ways. The data is displayed using a variety of different diagnostic views and charts. Data may be recorded for extended periods and played back at a later date/time. Also, reports may be generated in Adobe PDF format. Applications of NetSurveyor are listed below:  
- During the installation of a wireless network, it helps in verifying the network is properly configured and antennas are positioned at locations to achieve efficient transmission/reception.
- Trouble-shooting an existing network or wireless environment that is performing poorly
- Reporting the presence of Wi-Fi networks and local APs and the signal strengths of their beacons
- Conducting wireless site surveys where the installer is interested in learning about the coverage of a new or existing AP, roaming capability, presence of RF interference or “dead spots,” and optimum location of APs, their antennas and client stations
- In a secure business environment, it detects the presence of rogue APs o Helps in understanding the relationship between APs (BSSIDs), wireless networks (SSIDs), and client stations (STAs)

  ![NetSurveyor-802](https://github.com/user-attachments/assets/33503cdc-0c0f-4150-9fd9-e5abb0ef7eff)
