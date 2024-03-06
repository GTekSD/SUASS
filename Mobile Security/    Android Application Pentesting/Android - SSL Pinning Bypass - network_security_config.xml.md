## Bypass-Android-SSL-Pinning


First pull the android application from your device using adb

```
$ adb pull ./pathto/test.apk
```

Decompile the application using apktool

```
$ apktool d test.apk
```

Edit the `network_security_config.xml` file in `/base/res/xml` directory

network_security_config.xml
```xml
<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <domain-config>
        <domain includeSubdomains="true">api.testingdomain.com</domain>
        <domain includeSubdomains="true">staging-api.testingdomain.com</domain>
        <pin-set>
            <pin digest="SHA-256">YyKlrbMBaYz9er5JY/8asdfhpoXhUJY9ZZUycEPcDoU7w2s=</pin>
            <pin digest="SHA-256">AoqlvZFWR5AIer/asdfDL0AvjqxtHCydEHF0WdTRitLKCY=</pin>
        </pin-set>
    </domain-config>
</network-security-config>
```
Remove `<pin-set>...</pin-set>` and add the `trust-anchors`tag and make it look like below

```xml
<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <domain-config>
        <domain includeSubdomains="true">api.testingdomain.com</domain>
        <domain includeSubdomains="true">staging-api.testingdomain.com</domain>
        <trust-anchors>
            <certificates src="user" />
            <certificates src="system" />
        </trust-anchors>
    </domain-config>
</network-security-config>
```
cd to application root directory and build the application again using apktool

```
$ apktool b ./
```

apktool will save the new modified apk in `dist` directory, Now generate the private key using keytool.

```
$ keytool -genkey -v -keystore my-release-key.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 10000
Enter keystore password:  
Re-enter new password: 
What is your first and last name?
  [Unknown]:  test
What is the name of your organizational unit?
  [Unknown]:  test
What is the name of your organization?
  [Unknown]:  test
What is the name of your City or Locality?
  [Unknown]:  test
What is the name of your State or Province?
  [Unknown]:  test
What is the two-letter country code for this unit?
  [Unknown]:  US
Is CN=test, OU=test, O=test, L=test, ST=test, C=US correct?
  [no]:  yes

Generating 2,048 bit RSA key pair and self-signed certificate (SHA256withRSA) with a validity of 10,000 days
	for: CN=test, OU=test, O=test, L=test, ST=test, C=US
[Storing my-release-key.keystore]
```

Sign the modified application with the generated private key using jarsigner

```
$ jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore test.apk alias_name
```

Uninstall the old application from the device and install the new application

```
$ adb install test.apk
```

Done! now you can intercept the request with burpsuite.

