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
  - ```zsh
    hexdump -C firmware.bin
    ```
  - ```zsh
    strings firmware.bin
    ```
  - To figure out the entropy:
    ```zsh
    binwalk -E firmware.bin
    ```
- Where can you find the encryption keys?
- How can you get a copy of the decrypted firmware?

### Extracting components from the firmware
- Extract the file system
  ```zsh
  binwalk -e firmware.bin
  ```
- Does the extracted firmware have sensitive files? Search it!
  ```zsh
  ./firmwalker.sh /path/to/extracted/firmware
  ```
- Does the file system has hardcoded credentials (`grep` is your friend)
  - API keys
    ```zsh
    grep -r "api_key" /path/to/extracted/firmware
    grep -r "apikey" /path/to/extracted/firmware
    grep -r "API_KEY" /path/to/extracted/firmware
    ```
  - Private certificates
    ```zsh
    grep -r "-----BEGIN PRIVATE KEY-----" /path/to/extracted/firmware
    grep -r "-----BEGIN CERTIFICATE-----" /path/to/extracted/firmware
    ```
  - Backdoors
    ```zsh
    grep -r "backdoor" /path/to/extracted/firmware
    grep -r "malicious_code" /path/to/extracted/firmware
    ```
  - Sensitive URLs
    ```zsh
    grep -r "http://" /path/to/extracted/firmware
    grep -r "https://" /path/to/extracted/firmware
    grep -r "ftp://" /path/to/extracted/firmware
    ```
  - Config files revealing useful information
    ```zsh
    grep -r "password" /path/to/extracted/firmware
    grep -r "username" /path/to/extracted/firmware
    grep -r "secret" /path/to/extracted/firmware
    ```

### Emulating the firmware
- Identify the architecture
- Emulate the firmware using Qemu and Chroot or FAT (`python fat.py` - FAT available from [GitHub](https://github.com/attify/firmware-analysis-toolkit) )
  ```zsh
  sudo python3 ./fat.py filename.img --qemu 2.5.0
  ```
- Perform analysis and exploitation via emulation

### Reverse engineering firmware binaries
- Command Injection bugs (IDA analysis and looking at the web files)
- Identifying Buffer overflows and other software binary specific vulns and exploitation
  - what all security protections are there in place?
  - Bypassing the security protections.

---
## Firmware Analysis Tools
1.	Binwalk (https://github.com/ReFirmLabs/binwalk)	
2.	Firmwalker (https://github.com/craigz28/firmwalker)	
3.	Firmware analysis toolkit (https://github.com/attify/firmware-analysis-toolkit)	
4.	Firmadyne (https://github.com/firmadyne/firmadyne)	
5.	Fact core (https://github.com/fkie-cad/FACT_core)

---
# SBOM Analysis

**Software Bill of Materials** is a nested description of software artifact components and metadata. This information can also include licensing information, persistent references, and other auxiliary information.

### Tools:
#### Dependency-Track (https://github.com/DependencyTrack/dependency-track)
```zsh
docker run -d -m 8192m -p 8080:8080 --name dependency-track -v dependency-track:/data dependencytrack/bundled
```

#### Grype (https://github.com/anchore/grype)
```zsh
grype <image>
```

#### Bomber (https://github.com/devops-kung-fu/bomber)
```zsh
bomber scan cyclonedx.sbom.json
```
