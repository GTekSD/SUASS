# NFC Penetration Testing

NFC (Near Field Communication) technology in the mobile devices allow users to access various services within a single device. This technology has several vulnerabilities which may lead to various attacks, such as eavesdropping, data modification, data corruption, etc. You need to test NFC devices to reveal unknown vulnerabilities that may be exploited to gather confidential information, such as credit card numbers, login credentials, etc.

## Introduction to NFC Penetration Testing

Near Field Communication (NFC) is a short-range, wireless connection standard that uses radio waves to establish communication between electronic devices. It establishes communication either by touching together the devices or by locating them in close proximity. The NFC standard is designed on the basis of RFID standard. It also includes different data exchange formats as well as communication protocols. This standard does not guarantee secure communication even though the communication range is limited to a few centimeters (maximum 20 cm). The reason is that, it does not require any form of passwords or login credentials to get connected. This provides opportunity to the malicious outsiders to gain access to devices, user credentials, and other confidential information.  

NFC is an emerging technology which many organizations use for short range communication. For you, it is important to test the NFC communications of the target organization and reveal the possible threats organizations may face. NFC technology is susceptible to various attacks, such as eavesdropping, data corruption, data modification, spoofing, MITM attack, etc. Hence, NFC penetration testing is required to identify vulnerabilities and also to resolve them beforehand for making a system immune to security attacks.

## Perform Eavesdropping

NFC technology broadcasts radio signals in the vicinity of the transmitter and not just to the intended receiver, there is a scope to grab signals as the communication takes place between the devices in close proximity. NFC eavesdropping is a consequence in which an antenna is used to record the communication between NFC and other devices or we may simply say that one may record communications between NFC devices by means of large and sophisticated antenna.  

The main objective of this attack is to intercept the NFC exchange process to corrupt the information being exchanged and make it useless. You need to test whether the target NFC devices are vulnerable to eavesdropping or not. To perform eavesdropping you need to use an antenna to capture the communication between the NFC devices. Organizations need to secure the NFC communication channel so that the information is encrypted and only an authorized device may decrypt it. Secondly, they need to set the range of NFC so that limited devices may be connected.  
![Eavesdropping Attack](https://github.com/user-attachments/assets/92e659d0-920c-489a-9878-047da2e75df8)

## Perform a Data Modification Attack 

The Data Modification attack is a more dangerous attack that not only captures and stores target’s data exchange but also modifies it using a radio frequency device. It is feasible in rare cases, particularly for NFC communication in active mode. This is a control-data attack that may constrain the NFC data exchange in the target network temporarily. The possibility of this attack depends on various factors, such as the strength of the amplitude modulation.

Detecting this attack is a bit difficult especially while performing the active mode transmission of NFC information. You may use a RFID jammer to detect this attack and interfere with the NFC data exchange. Try to alter NFC source device code to measure the strength of frequencies and compare them with susceptible frequency range to detect this attack. It is always recommended to check the RF field during transmission as this could help you in identifying this attack.

You may attempt this attack on the target network by modifying the control-flow of programs. In order to do so, primarily you need to capture some running data, get the control over it and then override it using memory corruption errors, such as a Buffer overflow, use-after-free, etc. Try to modify/override configuration data, user input data, policy making data, etc. to analyze the security of target network.

## Perform Data Corruption Attack

Data corruption attack is a type of DoS attack, where the third-party attempts to corrupt the data being transmitted between the two endpoints. You may perform this attack either by interfering or disrupting the data transmission or blocking the data channel, so that the receiver is not able to decipher or read the data received.

You may attempt the data corruption attack, by transmitting a valid set of data frequencies at a correct time. You may calculate the correct time based on the used modulation scheme and coding. In this attack, you do not have to decipher the data transferred, as the main objective of this attack, is just to destroy or make the legitimate information unavailable to the receiver. 

As a preventive measure, the NFC device may detect this kind of attack by checking the RF signal during data transmission, as the power required to effectively attack a system is considerably higher than the power used to send data. 

You need to perform this type of attack to test the device’s security and further advise the organization to implement the data validation controls as prevention against data corruption.

## Perform a MITM Attack

NFC is a short-range wireless technology that is used for financial transactions and data sharing. Due to the lack of device authentication, NFC communication may be exploited to perform attacks, such as man-in-the-middle, masquerading, eavesdropping, etc. NFC tags are used as passive data stores that may be rewritable, which is a serious drawback as data may be modified by performing a man-in-the-middle attack.

Performing a MITM attack is a difficult task and practically infeasible. In this attack, you need to eavesdrop the communication and also try to manipulate and transmit it to the NFC reader. You need to intercept the communication between the two NFC devices, that is your device acts as a relay agent between the communicating devices. After intercepting the data, try to modify the information that is being transmitted and forward it to the other communicating entity. The two legitimate devices cannot notice the interception of messages and MITM attack. 

You need to identify the vulnerabilities in the NFC communication that leads to attacks, such as man-in-the-middle attack. To protect the NFC devices from such type of attacks, organizations need to secure the communication by encryption.

## Document the Result

Documenting the results obtained during penetration testing is an essential step. You are advised to document the result obtained while conducting testing on WLAN, RFID devices, NFC devices, mobile devices, and IoT. After the completion of the steps, you are advised to combine and reconstruct the results in a detailed format. Note down the weaknesses found in the configuration of organization’s wireless infrastructure. The pen testing report from each section serves as a basis for creating a final report. The final documented report contains a detailed information on all the vulnerabilities, identified in each section,  
such as: 

- Weak encryption mechanisms 
- Unencrypted flow of data 
- Insecure device’s firmware/software 
- Poor authentication mechanism 
- Weak web interfaces 
- Improper data storage mechanism 
- Poor storage of encryption keys 
- Enabled Universal Plug and Play UPnP service

For every identified vulnerability, you need to provide detailed documentation that describes the security vulnerability and how it may be exploited. This makes the document transparent, understandable, and comprehensible for technical administration. Furthermore, this document may be used to make changes in the device configuration and overall security infrastructure to enhance the security of the target network.
