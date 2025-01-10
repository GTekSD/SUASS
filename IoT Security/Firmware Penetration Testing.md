# Firmware Penetration Testing

## How to get the firmware
- Vendors website
- Support groups
- Community forums
- OTA update sniffing
- Mobile application
- Dumping from the device

## Analyzing firmware

### Analyze it via 
- `strings`
- `hexdump`

### Is the firmware encrypted?
- What kind of encryption is being used?
  - `hexdump -C firmware.bin`
  - `strings firmware.bin`
  - `binwalk -E firmware.bin` to figure out the entropy
- Where can you find the encryption keys?
- How can you get a copy of the decrypted firmware?

### Extracting components from the firmware
- Extract the file system (`binwalk -e firmware.bin`)
- Does the file system has hardcoded credentials (`grep` is your friend)
  - API keys
  - Private certificates
  - Backdoors
  - Sensitive URLs
  - Config files revealing useful information

### Emulating the firmware
- Identify the architecture
- Emulate the firmware using Qemu and Chroot or FAT (`python fat.py` - FAT available from [GitHub](https://github.com/attify/firmware-analysis-toolkit) )
- Perform analysis and exploitation via emulation

### Reverse engineering firmware binaries
- Command Injection bugs (IDA analysis and looking at the web files)
- Identifying Buffer overflows and other software binary specific vulns and exploitation
  - what all security protections are there in place?
  - Bypassing the security protections.
