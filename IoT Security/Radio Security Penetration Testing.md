# Radio Security Penetration Testing

- What radio communication protocols is the target device using
- What frequency is the communication happening on
- Identify spikes in that frequency via GQRX whenever data is being transferred
- Can you sniff the radio communication
### BLE
- Use Ubertooth or Adafruit BLE Sniffer to sniff the communication
- Identify the handles being read and written
- Can you write those handles by yourself using gatttool
- Are replay attacks possible?
- Jamming based attacks
- Is the communication encrypted
  - Yes
    - did you capture the initial key exchange communication
    - can you decrypt the communication via other ways (brute forcing the keys)
  - No
    - Is sensitive information being passed in clear text?
### ZigBee
- Use ZigBee sniffer to sniff the ZigBee communications happening
- Identify the channel on which ZigBee devices are communicating
- Is the communication encrypted?
- Did you capture the key exchange or found the key on the device or firmware
- Are you able to decrypt the communication
- Can you replay the communication packets to make the device act again
- Replay and Jamming based attacks
