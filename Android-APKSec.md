# Android Penetration Testing

## Finding 1: Database Stored in Android Device Without Encryption
  - Install and use the app, executing all functions at least once. Data can be generated when entered by the user, sent by the endpoint, or shipped with the app.
  - Check both internal and external local storage for any files created by the application that contain sensitive data. (username, email_id, client_id, password, mobile_number, bank_account_number, etc.)
  - Determine whether SQLite databases (Only for .db extension files) are available and whether they contain sensitive information. SQLite databases are stored in `/data/data/<package-name>/databases`.
  - For POC of the file that contains sensitive data and note the path of that file as we have to mention this file name and path in our report.

## Finding 2: Insecure Data Storage
  - Install and use the app, executing all functions at least once. Data can be generated when entered by the user, sent by the endpoint, or shipped with the app.
  - Check Shared Preferences that are stored as XML files (in `/data/data/<package-name>/shared_prefs`) for sensitive information. Shared Preferences are insecure and unencrypted by default. Some apps might opt to use secure-preferences to encrypt the values stored in Shared Preferences. If sensitive data found, then we give finding.
  - For POC of the file that contains sensitive data and note the path of that file as we have to mention this file name and path in our report.

Tip: Make a zip of /data/data/com.pakage.name/ and transfer and unzip into PC and open files into Visual Studio Code, search keywords into folder. (Device must be rooted)

## Finding 3: Root Detection Not Implemented
  - Open root browser and go to "data/data/com.application.name/" and take POC of this screen, after that open the application folder and take another POC here (showing all folders of the application).

## Finding 4: Application Debuggable is Enabled
  - Get target application apk into kali linux, and decompile using apktool
  - Run the command `apktool d sample.apk` into kali.
  - Go to the extracted folder and open “AndroidManifest.xml” and Find this flag: `android:debuggable="true"`
  - It must be false, If the value is set to `true` then it’s Finding.

## Finding 5: Application Data Backup is Enabled
  - Decompile and open the `AndroidManifest.xml` file and Find this flag: `android:allowBackup="true"`
  - It must be false, If the value is set to `true` then it could be a Finding.

  - After executing all available app functions, attempt to back up via adb. If the backup is successful, inspect the backup archive for sensitive data. Open a terminal and run the following command:
  ```
  adb backup -apk -nosystem <package-name>
  adb backup "-apk -nosystem <package-name>"
  ```
  - ADB should respond now with "Now unlock your device and confirm the backup operation" and you should be asked on the Android phone for a password. This is an optional step and you don't need to provide one. 
  - Approve the backup from your device by selecting the Back up my data option. After the backup process is finished, the file .ab (ex: backup.ab) will be in your working directory. Run the following command to convert the .ab file to tar.
  ```
  dd if=backup.ab bs=24 skip=1|openssl zlib -d > backup.tar
  ```
  - In case you get the error `openssl:Error: 'zlib' is an invalid command.` you can try to use Python instead.
    ```
    dd if=backup.ab bs=1 skip=24 | python -c "import zlib,sys;sys.stdout.write(zlib.decompress(sys.stdin.read()))" > backup.tar
    ```

  - The Android Backup Extractor is another alternative backup tool. To make the tool to work, you have to download the Oracle JCE Unlimited Strength Jurisdiction Policy Files for JRE7 or JRE8 and place them in the JRE lib/security folder. Run the following command to convert the tar file:
```
java -jar abe.jar unpack backup.ab
```

  - if it shows some Cipher information and usage, which means it hasn't unpacked successfully. In this case you can give a try with more arguments:

```
abe [-debug] [-useenv=yourenv] unpack <backup.ab> <backup.tar> [password]
```

  - `[password]` is the password when your android device asked you earlier. For example here is: 123

```
java -jar abe.jar unpack backup.ab backup.tar 123
```

  - Extract the tar file to your working directory.
```
tar xvf mybackup.tar
```

## Finding 6: Application UsesClearTextTraffic Enabled
  - Decompile and open the `AndroidManifest.xml` file and Find this flag: `android:usesCleartextTraffic="true"`
  - It must be false, If the value is set to `true` then it’s Finding.
  
## Finding 7: Application Exported is Enabled
  - Decompile and open the `AndroidManifest.xml` file and Find this flag: `android:exported="true"`
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
  - Use all the mobile app functions at least once, then identify the application's data directory and look for log files (`/data/data/<package-name>`). Check the application logs to determine whether log data has been generated; some mobile applications create and store their own logs in the data directory.
  - Many application developers still use `System.out.println` or `printStackTrace` instead of a proper logging class. Therefore, your testing strategy must include all output generated while the application is starting, running and closing. To determine what data is directly printed by `System.out.println` or `printStackTrace`, you can use [Logcat](https://developer.android.com/tools/logcat).
  - Connect the adb terminal with device/emulator using wifi adb or with USB.
  - Clear the app's storage and cache before running logcat.
  - Now, run the cmd `adb logcat` or `adb logcat > logs.save` to save captured logs, but it won't show you and result on terminal if you run 2nd cmd.
  - Remember that you can target a specific app by filtering the Logcat output as follows:
  ```
  adb logcat | grep "$(adb shell ps | grep <package-name> | awk '{print $2}')"
  ```
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
