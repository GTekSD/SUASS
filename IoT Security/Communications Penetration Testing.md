# Communications (Mobile and Web) Penetration Testing

- Reverse engineer the mobile application
- `(jadx appname.apk)`
- Does it reveal any information on how the device communicates with the mobile app and vice-versa?
  - ports which are being used
  - hardcoded firmware download URLs
  - Command messaging format
  - Hardcoded SSIDs
  - Hardcoded encryption keys
- Intercept the traffic using a proxy tool
- Does the traffic interception reveal any details?
  - Use the mobile application to communicate with the target device to see what kind of traffic is being sent .
- Does it used MQTT?
  - What topics are being used?
  - Is the communication happening over a secure channel?
  - Can you subscribe to any topic?
  - Can you publish to the topics?
  - Is there authentication being used?
  - Is the COAP implementation secure?
