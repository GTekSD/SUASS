# Mr Robot CTF - Based on the Mr. Robot show, can you root this box?

[![image](https://github.com/GTekSD/SUASS/assets/55411358/e368defa-d2ce-4917-b6a2-1054956ea8a3)](https://tryhackme.com/room/mrrobot)


### Task 1 Connect to our network

To deploy the Mr. Robot virtual machine, you will first need to connect to our network.
Answer the questions below

Connect to our network using OpenVPN. Here is a mini walkthrough of connecting:

Go to your access page and download your configuration file.

Use an OpenVPN client to connect. In my example I am on Linux, on the access page we have a windows tutorial.
```
┌──(gteksd㉿PHENTHESTER)-[~/Downloads]
└─$ sudo openvpn GTekSD.ovpn
```
(change "GTekSD.ovpn" to your config file)

When you run this you see lots of text, at the end it will say Initialization Sequence Completed

You can verify you are connected by looking on your access page. Refresh the page

You should see a green tick next to Connected. It will also show you your internal IP address.

You are now ready to use our machines on our network!

Now when you deploy material, you will see an internal IP address of your Virtual Machine.


### Task 2 Hack the machine

![image](https://github.com/GTekSD/SUASS/assets/55411358/4195d313-b5b4-4e32-98c4-2962a74f6c1e)


Can you root this Mr. Robot styled machine? This is a virtual machine meant for beginners/intermediate users. There are 3 hidden keys located on the machine, can you find them?

Credit to Leon Johnson for creating this machine. This machine is used here with the explicit permission of the creator <3 
Answer the questions below

```
┌──(gteksd㉿PHENTHESTER)-[~]
└─$ curl http://10.10.221.160/key-1-of-3.txt
073403c8a58a1f80d943455fb30724b9
```

What is key 1?
```
073403c8a58a1f80d943455fb30724b9
```

```
robot@linux:-$ cat key-2-of-3.txt
cat key-2-of-3.txt
822c73956184f694993bede3eb39f959
```
What is key 2?
```
822c73956184f694993bede3eb39f959
```

```
nmap> !cat /root/key-3-of-3.txt
!cat /root/key-3-of-3.txt
04787ddef27c3dee1ee161b21670b4e4
```

What is key 3?
```
04787ddef27c3dee1ee161b21670b4e4
```


   -----------------

## Let's Start
