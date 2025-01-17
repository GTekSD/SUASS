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
  - ```console
    hexdump -C firmware.bin
    ```
  - ```console
    strings firmware.bin
    ```
  - To figure out the entropy:
    ```console
    binwalk -E firmware.bin
    ```
- Where can you find the encryption keys?
- How can you get a copy of the decrypted firmware?

### Extracting components from the firmware
- Extract the file system
  ```console
  binwalk -e firmware.bin
  ```
- Does the extracted firmware have sensitive files? Search it!
  ```console
  ./firmwalker.sh path/to/extracted/firmware
  ```
- Does the file system has hardcoded credentials (`grep` is your friend)
  - API keys
  - Private certificates
  - Backdoors
  - Sensitive URLs
  - Config files revealing useful information

### Emulating the firmware
- Identify the architecture
- Emulate the firmware using Qemu and Chroot or FAT (`python fat.py` - FAT available from [GitHub](https://github.com/attify/firmware-analysis-toolkit) )
  ```console
  sudo python3 ./fat.py filename.img --qemu 2.5.0
  ```
- Perform analysis and exploitation via emulation

### Reverse engineering firmware binaries
- Command Injection bugs (IDA analysis and looking at the web files)
- Identifying Buffer overflows and other software binary specific vulns and exploitation
  - what all security protections are there in place?
  - Bypassing the security protections.
