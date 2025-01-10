# Embedded Device Penetration Testing

## Start by performing an external visual inspection of the device

### FCC ID and other certifications
- Look up the FCC ID at [fccid.io](https://fccid.io/) website
  - Does it reveal additional details about the target
  - Internal pictures
    - can you figure out what chipsets are being used?
    - any exposed interfaces?
    - which flash? what protocol does it uses?
  - External pictures
  - Test cases run on the device
  - Frequency which is being used
    - any common frequency being used? 433/315 etc.
### Markings of compliances and protocols used
### External ports and interfaces
- USB
- Ethernet
- SD Card slot
### Voltage and Power consumption

## Open the device
- Are the screws hidden behind the rubber pads or labels
- Tamper protection mechanisms?
- Can you bypass them - chemical methods ?
  - X-Ray ?
  - Ultrasonic welding
- What do you see when you open up the device
  - Chips
  - Various other components
  - Copper tracing
  - Multi-layered?


## Analyzing and Exploiting the device
### Identify the various components on the board
### Read their component numbers and look up online for the datasheets
### What do these component perform?
### Do you see any exposed interfaces?
- Are they labeled?
- Not labeled?
- Scattered across the board?
### Identify the pinouts for the Serial interface
- Multimeter
- Logic analyzer
- JTAGulator
### Connect to the Serial interface using a USB-TTL or [Attify Badge](https://www.attify-store.com/products/attify-badge-assess-security-of-iot-devices)
- Identify the baudrate
- Shell
  - Authenticated ?
    - What all can do you from here?
    - Dump the firmware
    - Modify values on the device and see if it persists
    - Control the device components via the shell
    - Is the shell of root privileges?
  - Unauthenticated?
    - Can you brute force the password?
    - Is the password hidden in the firmware?
    - Bootloader manipulation attacks
### JTAG
- Find the JTAG pinouts using JTAGulator
- Debug
- Dump firmware
- Write new firmware
- Perform run-time manipulation of the binaries
### Flash
- Dump data from the flash
- Modify and write data back to the device
- Does the device has firmware signature and integrity verification?
  - Can it be bypassed?
### Glitching based attacks
