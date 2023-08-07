# Android Penetration Testing

## Finding 1: Database Stored in Android Device Without Encryption
  - Check every file with notepad or DB Browser (Only for .db extension files) after logging into the target app, If sensitive data (username, email_id, client_id, password, mobile_number, bank_account_number, etc.) found in /data/data/com.pakage.name/ any.db (extension) file then we give this finding.
  - For POC of the file that contains sensitive data and note the path of that file as we have to mention this file name and path in our report.

## Finding 2: Insecure Data Storage
  - Check every other files with text editor after logging into the target app, If sensitive data (username, email_id, client_id, password, mobile_number, bank_account_number, etc.) found in /data/data/com.pakage.name/ any other file, then we give finding.
  - For POC of the file that contains sensitive data and note the path of that file as we have to mention this file name and path in our report.

Tip: Make a zip of /data/data/com.pakage.name/ and transfer and unzip into PC and open files into Visual Studio Code, search keywords into folder. (Device must be rooted)

## Finding 3: Root Detection Not Implemented
  - Open root browser and go to "data/data/com.application.name/" and take POC of this screen, after that open the application folder and take another POC here (showing all folders of the application).

## Finding 4: Application Debuggable is Enabled
  - Get target application apk into kali linux, and decompile using apktool
  - Run the command `apktool d sample.apk` into kali.
  - Go to the extracted folder and open “AndroidManifest.xml” and Find this code: `android:debuggable="true"`
  - It must be false, If the value is set to `true` then it’s Finding.

## Finding 5: Application Data Backup is Enabled
  - Decompile and open the `AndroidManifest.xml` file and Find this code: `android:allowBackup="true"`
  - It must be false, If the value is set to `true` then it’s Finding.

## Finding 6: Application UsesClearTextTraffic Enabled
  - Decompile and open the `AndroidManifest.xml` file and Find this code: `android:usesCleartextTraffic="true"`
  - It must be false, If the value is set to `true` then it’s Finding.
  
## Finding 7: Application Exported is Enabled
  - Decompile and open the `AndroidManifest.xml` file and Find this code: `android:exported="true"`
  - It must be false, If the value is set to `true` then it could be Finding then you need to use drozer to call that specific activity and check if it opens by drozer or not.
  - To check Use `Drozer` run this commands. (Drozer Agent app must be installed and ON in the device)
```
Starting a session:
$ adb forward tcp:31415 tcp:31415
$ drozer console connect                    : If device connected with USB
$ drozer console connect --server <IP>      : If device cnnected with Wifi_ADB

Retrieving package information:
dz> run app.package.list -f <app name>
dz> run app.package.info -a <package name>

Identifying the attack surface:
dz> run app.package.attacksurface <package name>

Exploiting Activities:
dz> run app.activity.info -a <package name> -u
dz> run app.activity.start --component <package name> <component name>
dz> run app.activity.start --component <package name> <component name> --extra <type> <key> <value>

Exploiting Content Provider (OPTIONAL):
dz> run app.provider.info -a <package name>
dz> run scanner.provider.finduris -a <package name>
dz> run app.provider.query <uri>
dz> run app.provider.update <uri> --selection <conditions> <selection arg> <column> <data>
dz> run scanner.provider.sqltables -a <package name>
dz> run scanner.provider.injection -a <package name>
dz> run scanner.provider.traversal -a <package name>

Exploiting Broadcast Receivers (OPTIONAL):
dz> run app.broadcast.info -a <package name>
dz> run app.broadcast.send --component <package name> <component name> --extra <type> <key> <value>
dz> run app.broadcast.sniff --action <action>

Exploiting Service (OPTIONAL):
dz> run app.service.info -a <package name>
dz> run app.service.start --action <action> --component <package name> <component name>
dz> run app.service.send <package name> <component name> --msg <what> <arg1> <arg2> --extra <type> <key> <value> --bundle-as-obj

```
9. If drozer can open any activity that contains any sensitive user data then the exported
activity is vulnerable means it’s Finding 7.
  
## Finding 8: Insecure Logging and Unintended Data Storage
  - Connect the adb terminal with device/emulator using wifi adb or with USB.
  - Clear the app's storage and cache before running logcat.
  - Now, run the cmd `adb logcat` or `adb logcat > logs.save` to save captured logs, but it won't show you and result on terminal if you run 2nd cmd.
  - Now, Open the targeted app and use every functionality such as loging with different methods, creating profiles, editing profiles, entering sensitive details, etc.

12. Go to the terminal and run the command “adb logcat” and press enter, now open the
app enter the credentials and log into the app. Explore the app by visiting every page.
13. Now stop the logcat by pressing ctrl+z. And search the logs for any sensitive data. If any
sensitive data is found in the logs, then its Finding 8.

## Finding 9: Successful Reverse Engineering

Steps:
1. Get the apk in your normal Windows/Linux Computer and upload the apk on this online
decompilers to decompile the apk by visiting this link or this link.
2. Now download this decompiled apk, zip folder and unzip it.
3. Search for classes.dex file, and open it using the Jadx GUI Application. To download the
Jadx GUI go to this link.
4. In the Jadx GUI, open every folder and search for MainActivity.class file and check the java or
kotlin code.
5. If you haven’t found the MainActivity.class file, then open any activity which seems
important for the application and check its code.





Vulnerabilities covered in this app:

    Root Detection
    Emulator Detection
    Insecure Data Storage – Shared Prefs - 1
    Insecure Data Storage - Shared Prefs - 2
    Insecure Data Storage - SQLite
    Insecure Data Storage – Temp Files
    Insecure Data Storage – SD Card
    Keyboard Cache
    Insecure Logging
    Input Validations – XSS
    Input Validations – SQLi
    Input Validations – WebView
    Unprotected Android Components – Activity
    Unprotected Android Components –Service
    Unprotected Android Components – Broadcast Receivers
    Unprotected Android Components – Content Providers (Coming Soon)
    Hard coding issues
    Network intercepting – HTTP
    Network intercepting – HTTPS
    Network intercepting – Certificate Pinning
    Misconfigured Network_Security_Config.xml
    Android Debuggable
    Android allowBackup
    Custom URL Scheme
    Broken Cryptography
    QR Code Scanning (Coming Soon)
    Fingerprint Authentication (Coming Soon)



Refrance:
  https://mas.owasp.org/MASTG/Tools/0x08a-Testing-Tools/
  
  https://lunarmonk.wordpress.com/tag/android/
  
  https://www.axcelsec.com/2018/01/mobile-penetration-testing-android.html
  
  https://www.linkedin.com/pulse/hacking-android-apps-through-exposed-components-tal-melamed
  
  https://oscp.medium.com/complete-android-pentesting-guide-203ed34035e3
  
  http://securityhorror.blogspot.com/p/android-pentest-guide.html

androgoat owasp vulnerability assessment
