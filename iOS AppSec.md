# iOS Application Penetration Testing

##### Contents
1. iOS Architecture
2. iOS Application Structure
3. Jailbreak
4. iOS Application Security Approach
5. Important Directories/Files to Look for in iOS
6. Extracting an IPA file
7. Running Static Analysis with MobSF
8. Setting Up Proxy
9. Introduction to OWASP Mobile Top 10
10. Tools Used
11. References

## 1. iOS Architecture

![iOS Architecture](https://dotnettrickscloud.blob.core.windows.net/img/xamarin/ios-architecture.png)

The diagram explains the different layers that are used between the Application and
Hardware level to establish communication & perform different tasks.

1. **Kernel and Device Drivers:** is the lowest layer of iOS which mainly includes the kernel and device drivers.
2. **Core OS Layer:** consists of technologies and frameworks which provide low-level services related to low-level hardware and networks. These include Accelerate Framework, Directory Services, System Configuration, memory management, file system handling and threads.
3. **Core Services Layer:** consists of core services that provide essential features to the application. It gives access to fundamental resources needed for an application. These services generally include Address book, Security, Social, foundation, Webkit, etc.
4. **Media Layer:** provides various multimedia services that can be utilized in the device, which basically enables all the audio-visual technologies (2D and 3D graphics, animations, image effects, professional-grade audio and video functionalities). It provides various functions such as Core Image, Core Audio, Core Text, etc.
5. **Cocoa Touch Layer:** is the topmost layer in the architecture and is also known as the Application Layer, which is primarily responsible for the application’s appearance. It exposes various APIs for programming the iPhone devices and provides access to the main system functions like Contacts, Camera, touch input, shares with other apps, push notifications, etc






