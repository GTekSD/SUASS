# Mobile Application Penetration Testing

Mobile Application TestingThe Mobile Application Penetration Testing  approach is based on our web application security methodology. The key difference is the security model around the client-side security.

Traditionally, the end-user is in control of his device and he is responsible for securing it against attackers and malware.  However, in mobile application environments, end-users may not always be aware of the threats they are facing and may not be in complete control of the device. Additionally, most mobile web applications are customized for dedicated functionalities and they typically do not benefit from the “many eyes” advantage that a popular software product receives.

To address these issues, our Mobile Penetration Testing methodology incorporates in addition to application security assessment, an end-user application security review process.
## Server-side security

The server-side security testing is carried out using one of the approaches described in the web application security assessment methodology: black box, gray box or white box approach.
## Client-side security

The client application is tested either using a platform emulator (typically provided together with SDK) and/or actual hardware device.
## Platform risk identification

Functionality of the client application is thoroughly analysed to identify assumptions about platforms of executions that may not be always true, for example:

- An application relies on GPS data being accurate, then such data may be spoofed if the application is executed on an emulator
- Storage and exchange of cryptographic keys or shared secrets between application and a security device such as SIM card cannot be intercepted by other applications

## End-user software testing

The data exchange between client-side application and server-side application is intercepted using various tools and the client-side application is being supplied with invalid responses to trigger erroneous behaviour. Fuzzing tools are used where possible to cover the maximum attack surface followed by manual investigation of suspicious behaviour.
