# RFID Penetration Testing

RFID penetration testing helps the tester to perform vulnerability assessment on RFID systems and identify various possible threats to the target organization. The major weakness of RFID devices is related to its frequency. You may use various RFID pen testing tools to perform frequency analysis of RFID tags and try to decode the data or perform various attacks, such as DoS attack, MITM, RFID cloning, impersonation, replay attack, etc.

## Introduction to RFID Penetration Testing

RFID (Radio Frequency Identification) technology comes with flaws and attack surfaces, that if not adequately secured could be exploited with serious consequences. RFID systems are susceptible to attacks, such as eavesdropping, MITM, DoS, spoofing, etc. 

RFID systems include tags that receive signals and send response without any authentication. This vulnerability leads to unauthorized access and alteration of RFID tag data. These unprotected tags are vulnerable to various attacks, such as spoofing, eavesdropping, DoS, traffic analysis, etc. Also, RFID systems use radio signals that cover several meters around the receivers. It is possible to perform eavesdropping and sniffing RFID tags using RFID readers. It is also possible to perform jamming attack by transmitting high power radio signals to jam the entire RFID system down. Many organizations install RFID readers without providing any physical security leading to unauthorized access to the information sent by the readers. Hence, performing RFID penetration testing helps organizations to identify vulnerabilities associated with RFID systems and fixes them beforehand.

## Perform Reverse Engineering 

RFID is an embedded system which often uses proprietary protocols and different cryptographic functions. In this RFID the details of the algorithms are typically kept secret because once its operation principles are known then the system compromise becomes easier. To solve this problem, we are using Legic prime security system. Reverse engineering of its functionality is the necessary step in the security assessment of a proprietary protocols.

According to Merriam-Webster Dictionary definition of reverse engineering is to disassemble and examine in detail to discover the concepts that are involved in manufacture usually in order to produce something similar. 

From RFID systems, one may gain information visually, by opening or breaking the components physically and looking for the common things. By physical inspection it is possible to find identifiers, such as manufacturer or product code printed on the device or different specifications of the RFID systems. 

The RFID systems are mostly susceptible to reverse engineering as their hardware and software components may be easily analyzed and reproduced. You need to detect the vulnerabilities and security flaws in these RFID systems. 

You may perform reverse engineering by gaining access to the chip and reading its memory contents optically to retrieve the PIN, biometric data, personal information, etc. Reverse engineering of an RFID tag requires in-depth knowledge of logical gates, electronics, and cryptography.

Listed below are the steps to perform RFID reverse engineering:

- **Visual inspection**  
  Initially you need to examine the components and look for the details, such as manufacturer, the model, or the RFID standard before analyzing the characteristics of a RFID tag. This information may help you to get details of the basic parameters on the communication protocol.

- **Monitoring Coupling and Frequencies**  
  You need to determine the operational frequency by studying the internal components of the RFID. You may do this by disassembling the hardware and analyzing it. You may also monitor suspected frequencies using spectrum analyzer/oscilloscope.

- **Monitoring Energy supply and modulations**  
  You are also advised to identify how the RFID tag is powered whether it has its own battery or it is powered by the reader signal. Based on this information you may get the battery details. Also find out various modulation parameters.

- **Line encoding, Syntax inference, and Protocol inference using signal Spectrogram**  
  Try to deduce the symbol coding implemented in the RFID tag. Most commonly used code settings are NRZ (non-return to zero), Manchester, and Miller.
  
- **Cryptanalysis**  
  Test different encodings for various combinations of plain text and keys.

## Perform Power Analysis Attack

Power analysis is the type of side channel attack that enables you to crack passwords by analyzing power consumption patterns of a network device. The power consumption patterns get changed when the RFID card receives correct and incorrect password bits. By performing power analysis attack, you may discover the correlation between the power consumption and internal state of a device. 

You may perform a power analysis attack by means of a directional antenna and an oscilloscope. These devices analyze and collect the information that is leaked by a device during cryptographic operation. Then, static analysis is performed on the collected information to identify the secret key. You may also perform power analysis attack using a very common device, such as a cell phone.

## Perform Eavesdropping 

Eavesdropping is one of the primary threats to the organizations using the RFID technology. You may easily access the RFID tag data by eavesdropping the legitimate transmission between the tag and the RFID reader. As the RFID signals cover several meters around the receiver, you may use special antennas and receiving equipment to eavesdrop radio signals transmitted from the reader and the tag. 

Many RFID systems transmit data in clear text due to various constraints, such as memory, cost, etc. Hence, it is important to establish a secure channel between the tag and reader as there may be serious implications if some sensitive information is leaked. Therefore, you need to interrogate tags if they lack required access controls and eavesdrop on the content of tag. And finally, you need to identify various vulnerabilities in the RFID systems that lead to eavesdropping.

## Perform an MITM Attack 

An RFID system is vulnerable to MITM attacks because the tags are small and low-priced. Also,
many RFID tags send and receive data in clear text. The man-in-middle attack (MITM) is similar to the eavesdropping attack the only difference is that in eavesdropping there is no physical medium where as in man-in-the-middle you have to make independent connections with interrogators, tags, and the RFID back end system. In this MITM attack messages are transmitted between victims, making them believe that they are communicating with each other directly but the fact is that the entire conversation is controlled by the tester.

To perform this attack, you need to intercept the communication between the reader and/or tag by falsely claiming to be an authentic reader /or tag. We advise you to have the ability to intercept messages that are being transmitted between the victims and also to be able to inject a new one which may be possible in some RFID systems.

## Perform a DoS Attack

DoS attack is a type of attack in which the services are reduced or made unavailable to the valid user. This type of attack is easy to accomplish but difficult to guard against. To perform DoS attack on a RFID system, flood the RFID system by providing more data than it may handle normally, bringing the whole system to a halt. DoS attacks may be performed in various ways: hacking the RFID tag, RFID reader, and back end server.

Listed below are some of the situations in which DoS attack may be carried out in RFID systems: 
- You may physically destroy or remove the tags that are attached to an object to avoid tracking.
- To prevent check-out of the particular item you may also kill the tags in warehouse, supply chain.
- You may protect the tags from being read.
- You may jam the return signals from the tags if you have a powerful signals generator although such action would cause the interrogator to raise an alarm.

You may implement jamming and interference techniques to perform DoS attacks. For example, you may use a high-power radio frequency transmitter to block frequencies used by the RFID system. You may also block radio signals using jammers, such as Armourcard RFID Jammer, UV30 Jammer, Wave Bubble, etc. Another form of DoS is to destroy or disable RFID tags by washing out their contents completely or wrapping them with metal foil.

## Perform RFID Cloning/Spoofing

You need to test whether the RFID system is allowing you to perform RFID cloning/spoofing. RFID cloning involves capturing the data from a legitimate RFID tag, and then creates a clone of it using a new chip. That means, that data from one RFID tag is copied into another tag, by changing the Tag ID (TID) but the form factor and data may remain the same. The cloned copy is different from the original RFID tag and it may be easily detected. You may use Proxmark 3, RFID Emulator, RFIDler, etc. to clone RFID tags.

Follow the steps mentioned below to clone a MIFARE Classic RFID tag: 
- Purchase a "magic" MIFARE Classic card (allows you to write block 0 information) 
**Note:** Block 0 on the MIFARE Classic card contains manufacturer data, including the UID. You cannot write data to this block under normal circumstances as it is blocked by the manufacturer.
- Use Mifare Classic Offline Cracker (MFOC) tool to dump RFID card data 
- Use nfc-mfclassic script (part of the libnfc library) to clone RFID card data

Before performing RFID spoofing, you need to eavesdrop then read and record the data transmitted from a RFID tag. It is difficult to detect the spoofed RFID tag, as it uses the original Tag ID. You may use RFDump to overwrite existing RFID tag data with the spoofed data (obtained by eavesdropping).

## Perform an RFID Replay Attack

Replay attack is a process of consuming the computing resources of the tags by repeating/delaying a valid data transmission of the network. To perform replay attack on an RFID device, you need to intercept the signals transmitted between a reader and a tag to obtain a valid RFID signal. Next, you need to replay the captured signal into the RFID system, and as it resembles a valid signal, it is accepted by the system creating an unauthorized effect.

RFIDs may be more vulnerable to a replay attack than other techniques due to its ability to read at a distance by covert readers. This technique works by combining the capabilities of both eavesdropping and spoofing. To be secured from a replay attack, every server challenge’s tag’s response is recommended to be unique. To achieve this, the value of tag responses and server challenge is recommended to be unpredictable and by enforcing that, the answers need to be cartographical. You may use Proxmark 3 to perform an RFID replay attack on the target network.

## Perform a Virus Attack

RFID software contains vulnerabilities due to which it might be infected with a virus. When a reader scans the infected tag, it may result in compromising backend RFID middleware systems via an SQL injection attack resulting in a virus attack. This attack prevents the communication between tags, network connections, interrogators, and back end system. For the payload of an RFID tag it is possible to carry either a virus or a link to one. You may inject infective viruses to the memory space of RFID tags.

The virus problem is not particular to RFID such that the tester is advised to address both from the front end as well as the back end part of RFID systems by which the front end part comprises the interrogate and tag. The organizations need to find ways to avoid virus attacks by blocking anomalous bits from the tag.

## Oscilloscopes, RFID Antennas and RFID Readers 

### Listed below are some of the popular oscilloscopes used for RFID hacking: 
- Tektronix Oscilloscopes (https://www.tek.com) 
- Keysight Oscilloscopes (https://www.keysight.com) 
- B&K Precision Oscilloscopes (https://www.bkprecision.com) 
- Teledyne LeCroy Oscilloscopes (https://teledynelecroy.com) 
- Rigol Digital Oscilloscopes (https://www.rigolna.com) 
- National Instruments Oscilloscopes (https://www.ni.com)

### Listed below are some of the popular RFID Antennas used for RFID hacking: 
- Honeywell RFID Antennas (https://www.honeywellaidc.com) 
- atlas RFID Antennas (https://www.atlasrfidstore.com) 
- Zebra RFID Reader Antennas (https://www.zebra.com) 
- Times-7 UHF RFID Antennas (https://www.times-7.com) 
- KATHREIN RFID Antennas (https://www.kathrein-solutions.com) 
- Ha-VIS RFID antennas (http://www.harting-rfid.com)

### Listed below are some of the popular RFID Readers used for RFID hacking: 
- GAO RFID Readers (https://gaorfid.com) 
- atlas RFID Readers (https://www.atlasrfidstore.com)
- Sky RFID Readers (https://skyrfid.com) 
- Technology Solutions RFID Readers (https://www.tsl.com) 
- TERTIUM RFID Readers (http://www.tertiumtechnology.com) 
- ams NFC/HF RFID Reader (https://ams.com

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
