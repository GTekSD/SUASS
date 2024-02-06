# Network Security FAQ

## BEAST - Browser Exploit Against SSL/TLS.

It is an attack against network vulnerabilities in TLS 1.0 and older SSL protocols. The attack was first performed in 2011 by security researchers Thai Duong and Juliano Rizzo but the theoretical vulnerability was discovered in 2002 by Phillip Rogaway.

### How Does the BEAST Attack Work

The Transport Layer Security (TLS) protocol is a successor to Secure Sockets Layer (SSL). Both are cryptographic protocols that let you use different cipher suites to encrypt the communication between a web browser and a web server. This makes it impossible for someone to listen in on the communication and steal confidential data.

Attackers may be able to tap into the conversation between a web server and a web browser using man-in-the-middle attack techniques. If they do and if there is no encryption, they have access to all the information exchanged between the web server and web browser: passwords, credit card numbers, etc.

However, even encryption might have its weaknesses and be broken. This is exactly the case with the BEAST attack. The researchers found that TLS 1.0 (and older) encryption can be broken quickly, giving the attacker an opportunity to listen in on the conversation.

If your server supports TLS 1.0, the attacker can make it believe that this is the only protocol that the client can use. This is called a protocol downgrade attack. Then, the attacker can use the BEAST attack to eavesdrop.

### Technical Details of BEAST

The TLS protocol uses symmetric encryption with block ciphers. Symmetric encryption means that the same key is needed to encrypt and decrypt the message. Block ciphers mean that information is encrypted in blocks of data that have fixed length. If there is not enough data for the last block, that last block is padded. Some popular block ciphers are DES, 3DES, and AES.

If the same data and the same key always gave the same encrypted content, an attacker could easily break any encryption. That is why TLS uses initialization vectors. This means, that encryption is seeded using random content. This way, if you use the same data and the same key many times, every time you end up with different encrypted content.

However, it would not be efficient to use random data to seed every block in a block cipher. That is why SSL/TLS also uses cipher block chaining (CBC). Blocks are chained with one another using a logical XOR operation. In practice, this means that the value of each block depends on the value of the previous block. So, an encrypted value representing some original data depends on the previous block of that data.

### The Attack Technique

The basic principle of breaking codes is: everything can be broken, it’s just a matter of how long it takes. The same principle applies to SSL/TLS ciphers. A good cipher is not impossible to break. It is simply impractical to break – impossible to break in a sensible amount of time using current computing resources.

The attacker could break a block cipher by trying different combinations and seeing if they get the same result with the same initialization vector (which they know). However, they can only check that for a whole block at a time, and a block can have, for example, 16 bytes. This means that for the block to be checked, the attacker would have to test 25616 combinations (3.4028237e+38) for every block.

What the BEAST attack does is make this much simpler: the attacker only needs to guess a single byte at a time. This can be done if the attacker can predict most of the data (for example, HTML code) and needs just one piece of secret information, for example, a password. The attacker can then test the encryption carefully, selecting the right length of the data, so that they have just one byte of information in a block that they do not know. And then, they can test the block just for 256 combinations of this byte. Then, they repeat the process for the next byte, soon coming up with the entire password.

### Is BEAST a Practical Attack?

A BEAST attack is not easy to perform. The attacker must use a different exploit to become a man-in-the-middle and to inject content into the stream. The researchers who discovered this vulnerability used a Java applet but an attacker can also use JavaScript. Even if the attacker tricks the user into running vulnerable Java or JavaScript code, the web application is by default protected using same-origin policy and this makes injection impossible (unless the web application has server-side CORS headers that override the default policy).

The difficulty of the attack is why this vulnerability is rarely exploited, despite a third of the websites still supporting the vulnerable TLS 1.0 protocol (according to our statistics). However, it is possible and therefore you should protect yourself against it.

### How to Discover if Your Web Server Is Vulnerable to BEAST

Discovering whether your web server is vulnerable to BEAST is very easy. If it supports TLS 1.0 or any version of SSL, it is vulnerable to BEAST.

You can easily discover if your web server supports TLS 1.0 or any version of SSL using Acunetix or manually. The advantage of using Acunetix is: you will also find all your web vulnerabilities that other tools won’t discover. And what’s the point of fixing just one vulnerability and not even knowing about others, which may be just as dangerous?

BEAST shows the major difference between web vulnerabilities and network vulnerabilities: network vulnerabilities are very easy to detect even using free tools and the only way to eliminate them is to upgrade affected software or hardware. Web vulnerabilities must be detected by specialized software like Acunetix and they can be eliminated by fixing application code.

### How to Fix the BEAST Vulnerability

Originally, the RC4 cipher was recommended for use to mitigate BEAST attacks (because it is a stream cipher, not a block cipher). However, RC4 was later found to be unsafe. Currently, PCI DSS (Payment Card Industry Data Security Standard) prohibits the use of this cipher. Therefore, you should never use this method to protect yourself from BEAST.

Just as with other network vulnerabilities, there is just one simple fix to BEAST: turn off TLS 1.0 and older protocols. Here is how you can do it for the most popular web server software. What we recommend is also disabling TLS version 1.1 and leaving just TLS 1.2 running (all major browsers such as Google Chrome, Firefox, and Safari support TLS 1.2).

#### Apache Web Server

Edit the SSLProtocol directive in the ssl.conf file, which is usually located in /etc/httpd/conf.d/ssl.conf. For example, if you have:
```
SSLProtocol all -SSLv3
```
change it to:
```
SSLProtocol TLSv1.2
```
Then, restart httpd.

#### NGINX

Edit the ssl_protocols directive in the nginx.conf file. For example, if you have:
```
ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
```
change it to:
```
ssl_protocols TLSv1.2;
```
Then, restart nginx.

#### Microsoft IIS

To disable TLS 1.0 in Microsoft IIS, you must edit the registry settings in the Microsoft Windows operating system.

  1. Open the registry editor
  2. Find the key HKLM SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server
  3. Change the DWORD value of the Enabled entry to 0.
  4. Create a DisabledByDefault entry and change the DWORD value to 1.

Repeat the above steps for all versions of SSL and TLS 1.1 (if you want to go along with our recommendation and disable it, too).

## POODLE - Padding Oracle on Downgraded Legacy Encryption

The POODLE attack (Padding Oracle on Downgraded Legacy Encryption) exploits a vulnerability in the SSL 3.0 protocol (CVE-2014-3566). This vulnerability lets an attacker eavesdrop on communication encrypted using SSLv3. The vulnerability is no longer present in the Transport Layer Security protocol (TLS), which is the successor to SSL (Secure Socket Layer).

What Can an Attacker Do with POODLE?

The POODLE vulnerability lets the attacker eavesdrop on encrypted communication. This means that the attacker can steal confidential data that is transmitted, for example, passwords or session cookies, and then impersonate the user. This can have very serious consequences, including losing control over the web application (for example, if the attacker impersonates an admin).

The attack is not very easy because it needs to be successful in three stages:

    In the first stage, the attacker must perform a successful man-in-the-middle attack (MITM). The attacker can now listen to all communication between the client and the server as well as add to this communication (impersonate the client or the server). However, if this is a secure connection, communication is encrypted using SSL/TLS, so the attacker cannot understand what is being sent.
    In the second stage, the attacker must convince the server to use the old SSL 3.0 protocol. The attacker can do this by dropping connections – after a number of such drop-outs, the server will try an older protocol, thinking that the client cannot use a newer protocol such as TLS 1.2. This is called a protocol downgrade attack or downgrade dance.
    In the third stage, when the client and the server are communicating using SSL 3.0, the attacker can use the POODLE attack to decrypt selected parts of the communication and steal confidential information.
    To make sure that the POODLE attack succeeds, the attacker should also be able to trick the user browser into running JavaScript, for example, using social engineering.


### How Does POODLE Work?

The POODLE attack is possible due to several features of the SSL/TLS protocol. You can read more about how these protocols work in our article series on SSL/TLS. For now, all you need to know is that SSL/TLS lets the server and the browser use sets of different algorithms to encrypt communication – these are called cipher suites.

The POODLE vulnerability affects cipher suites that include symmetric encryption together with block ciphers, for example, AES or DES algorithms. In such cases, the client and the server first agree on a secret key using asymmetric encryption (a private key and a public key). Then, all communication is encrypted symmetrically using this key. In the case of block ciphers, data is encrypted in blocks of fixed length, for example, 8 bytes or 16 bytes.

Cipher suites that are vulnerable to POODLE also use cipher-block chaining (CBC mode). This means that the value of each block depends on the value of the previous block – it is calculated by using the logical operation XOR. Also, a random data block is added at the start – this is called an initialization vector. This is necessary so that every time data is encrypted, it looks different (and therefore the attacker cannot figure out the data based on similarities).

###  Is MAC-Then-Encrypt?

To understand POODLE, you must first understand MAC and MAC-then-Encrypt.

The SSL/TLS protocol not only guarantees that the data is confidential. It also guarantees that the data has not been tampered with. For example, you do not want someone to be able to inject their own account number when you try to transfer money between accounts in an online bank.

To guarantee that the data is not corrupt, every encrypted fragment of data has a checksum – a MAC (message authentication code). The MAC can only be calculated if you have the encryption key. If the MAC is wrong, it means that someone has tampered with the message.

The SSL 3.0 protocol uses the MAC-then-Encrypt approach. This means that first, the algorithm calculates the MAC value, then it adds that MAC value at the end of the data, and then it encrypts the whole thing, including padding.

### What Is Padding?

A block cipher needs all data to be a multiple of the block size. For example, if the block size is 8, data must have 64, 80, or 336 bytes (a multiple of 8). If it is not a multiple of 8, it needs to be padded with unimportant data just to reach the right length.

Most web server implementations use the following padding technique:

  - The last byte of the last block must always contain the padding length. That value represents the number of previous bytes that are padded. For example, if 4 bytes are padded, the value of the block is: xx-xx-xx-yy-yy-yy-yy-04 (yy represents padding). This is an SSL requirement.
  - In most implementations, the values of all padding bytes are the same as the length value. For example, if 4 out of 8 bytes are padded, the value of the block is: xx-xx-xx-04-04-04-04-04.
  - If the length of the data is a multiple of the block size, for example, 336, there must be an extra block added with only padding: 07-07-07-07-07-07-07-07. This is necessary because if the last byte did not represent padding, the algorithm cannot recognize padding from real data.

Note that SSL does not check padding bytes (except the padding length), so as long as the last byte is between 00 and 07, the block will be accepted. For example, an xx-xx-xx-12-34-56-78-04 block will be accepted.

### What Is a Padding Oracle?

The padding oracle is a situation when the attacker knows or can guess why the data that they sent to the server is rejected: whether it is because the padding was incorrect or whether the MAC was wrong.

Imagine the following situation:

  1. The attacker receives data from the browser and knows that this data contains a password. The attacker knows that this is an HTTP POST request and knows exactly where the password is located in this request.
  2. The attacker modifies the encrypted data and sends it to the server.
  3. The server responds to the attacker saying that the data is wrong. However, it can respond with two types of errors: it may tell the attacker that the padding was wrong or that the MAC was wrong. This makes the POODLE attack possible.

Padding oracles are used for other attacks, too. Some protocols don’t respond directly but may, for example, first check the padding and only later check the MAC. In those cases, if the attacker gets a quick response, it’s a padding error, but if the response takes a bit longer, it’s a MAC error.

### The Anatomy of the POODLE Attack

To perform a typical POODLE attack and steal a web session cookie, the attacker does the following:

  1. The attacker tricks the victim’s browser into running JavaScript code that lets the attacker perform the attack.
  2. The attacker’s JavaScript code tricks the user browser into sending multiple legitimate requests to the server. These requests include the session cookie.
  3. The JavaScript code modifies the connection URL (adding extra characters) so that the length of the data sent to the server is a multiple of the block size (for example, 8). This means that the last block will contain only padding (see the explanation above).
  4. The attacker knows which blocks of data contain the session cookie. For example, the data may have 10 blocks and the attacker knows that the third and fourth blocks contain the session cookie value.
  5. The attacker copies the entire third block to the last block and sends it to the server many times, changing something in the connection URL every time so that the MAC is different.
  6. After at most 256 times, the message will be accepted. This means that the last byte of the third block, after decryption, will be the number 07, which signifies correct padding.
  7. Now the attacker knows the decrypted last byte and they can combine it with previous blocks using XOR operations to obtain the real last byte of the third block.
  8. The attacker can then make the connection URL one byte longer and repeat the steps above to get the next piece of the cookie. And then repeat again for the fourth block of data.
  9. If the cookie length is 16, the attacker will know the cookie after no more than 4096 requests, which takes at most a few minutes.


### How to Know if Your Web Server Is Vulnerable to POODLE

To know if your web server is vulnerable to POODLE, you only need to know if it supports SSL 3.0. You can find out if your web server supports SSL 3.0 using Acunetix. You can also do it manually, but with Acunetix you can also find web vulnerabilities and much more.

There were also old implementations of the TLS protocol that were vulnerable to POODLE. However, all modern TLS implementations are safe.

Note that while POODLE is a network vulnerability, it also affects web servers and web browsers.

### How to Fix the POODLE Vulnerability

To protect your server against POODLE and BEAST, configure it to support only TLS 1.2 and no older protocols. All older SSL and TLS versions are now officially deprecated and all modern browsers such as Chrome, Firefox, and Internet Explorer support TLS 1.2.

#### Apache Web Server

Edit the SSLProtocol directive in the ssl.conf file, which is usually located in /etc/httpd/conf.d/ssl.conf. For example, if you have:
```
SSLProtocol all
```
change it to:
```
SSLProtocol TLSv1.2
```
Then, restart httpd.

#### NGINX

Edit the ssl_protocols directive in the nginx.conf file. For example, if you have:
```
ssl_protocols SSLv3 TLSv1 TLSv1.1 TLSv1.2;
```
change it to:
```
ssl_protocols TLSv1.2;
```
Then, restart nginx.

#### Microsoft IIS

To disable TLS 1.0 in Microsoft IIS, you must edit the registry settings in Microsoft Windows.

  1. Open the registry editor
  2. Find the key HKLM SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server
  3. Change the DWORD value of the Enabled entry to 0.
  4. Create a DisabledByDefault entry and change the DWORD value to 1.

Repeat the above steps for all versions of SSL and for TLS 1.1.


## The Heartbleed Bug

The Heartbleed Bug is a serious vulnerability in the popular OpenSSL cryptographic software library. This weakness allows stealing the information protected, under normal conditions, by the SSL/TLS encryption used to secure the Internet. SSL/TLS provides communication security and privacy over the Internet for applications such as web, email, instant messaging (IM) and some virtual private networks (VPNs).

The Heartbleed bug allows anyone on the Internet to read the memory of the systems protected by the vulnerable versions of the OpenSSL software. This compromises the secret keys used to identify the service providers and to encrypt the traffic, the names and passwords of the users and the actual content. This allows attackers to eavesdrop on communications, steal data directly from the services and users and to impersonate services and users.

### What versions of the OpenSSL are affected?

Status of different versions:

- OpenSSL 1.0.1 through 1.0.1f (inclusive) are vulnerable
- OpenSSL 1.0.1g is NOT vulnerable
- OpenSSL 1.0.0 branch is NOT vulnerable
- OpenSSL 0.9.8 branch is NOT vulnerable

Bug was introduced to OpenSSL in December 2011 and has been out in the wild since OpenSSL release 1.0.1 on 14th of March 2012. OpenSSL 1.0.1g released on 7th of April 2014 fixes the bug.

### Remediation

Upgrade to the latest version of OpenSSL

## SWEET32 - Birthday Attack

The Sweet32 is an attack first found by researchers at the French National Research Institute for Computer Science (INRIA). The attack targets the design flaws in some ciphers. These ciphers are used in TLS, SSH, IPsec, and OpenVPN. The Sweet32 attack allows an attacker to recover small portions of plaintext. It is encrypted with 64-bit block ciphers (such as Triple-DES and Blowfish), under certain (limited) circumstances. The SWEET32 attack can be used to exploit the communication that uses a DES/3DES based cipher suite. A man-in-the-middle attacker could use this flaw to recover some plaintext data. The attacker can steal large amounts of encrypted traffic between TLS/SSL server and client.

The SWEET32 attack affects the commonly used algorithm like AES (Advanced Encryption Standard), Triple-DES (Data Encryption Standard) and Blowfish for encrypting communication for TLS, SSH, IPsec and OpenVPN protocol. These algorithms break the data into blocks. As these algorithms generate small sized blocks, these blocks will be vulnerable to birthday attacks. Due to a flaw in the algorithm, there will be a situation where two block has the same key. An attacker can access the information by using XOR operation on the blocks to reveal the plain text.
Impact

### The impacts include:-

 - Man-in-the-middle attack: An attacker can perform a man-in-the-middle (MITM) attack on the communication channel to sniff data. These data can be used for malicious purposes.
 - Birthday attack: This attack exploits the birthday theory in probability theory. This attack uses the Pigeon-hole theory of probability. This attack finds the collision on the hash function used in the algorithm and exploits that vulnerability.

### Mitigation / Precaution

Beagle recommends the following fixes:-

 - Use OpenSSL security update RHSA-2016:1940.
 - Try to avoid the usage of legacy 64-bit block ciphers.
 - Servers and VPN should use 128-bit ciphers for encryption.


