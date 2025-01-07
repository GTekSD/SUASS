# RFID Penetration Testing

RFID penetration testing helps the tester to perform vulnerability assessment on RFID systems and identify various possible threats to the target organization. The major weakness of RFID devices is related to its frequency. You may use various RFID pen testing tools to perform frequency analysis of RFID tags and try to decode the data or perform various attacks, such as DoS attack, MITM, RFID cloning, impersonation, replay attack, etc.

### Introduction to RFID Penetration Testing

RFID (Radio Frequency Identification) technology comes with flaws and attack surfaces, that if not adequately secured could be exploited with serious consequences. RFID systems are susceptible to attacks, such as eavesdropping, MITM, DoS, spoofing, etc. 

RFID systems include tags that receive signals and send response without any authentication. This vulnerability leads to unauthorized access and alteration of RFID tag data. These unprotected tags are vulnerable to various attacks, such as spoofing, eavesdropping, DoS, traffic analysis, etc. Also, RFID systems use radio signals that cover several meters around the receivers. It is possible to perform eavesdropping and sniffing RFID tags using RFID readers. It is also possible to perform jamming attack by transmitting high power radio signals to jam the entire RFID system down. Many organizations install RFID readers without providing any physical security leading to unauthorized access to the information sent by the readers. Hence, performing RFID penetration testing helps organizations to identify vulnerabilities associated with RFID systems and fixes them beforehand.

### Perform Reverse Engineering 

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

### Perform Power Analysis Attack
