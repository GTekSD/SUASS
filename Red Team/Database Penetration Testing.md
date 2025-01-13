#
Database Penetration Testing
### Module Objective 
This module will help you learn various techniques of a comprehensive penetration testing
methodology for assessing security of database servers and instances in a target network. It will discuss the various database penetration techniques such as sniffing database traffic, retrieving the database information, etc.
You will learn to perform penetration tests for different databases including MY SQL, MS SQL, and Oracle, as well as learn to ensure the security of these databases.

## Information Reconnaissance
Information reconnaissance is the first phase of pen testing the database that will help you to learn methods of gathering and analyzing information about different databases. to help in identifying the database types and versions, and develop a testing plan accordingly.

### Scan for Default Ports Used by Databases
Any system, device, and application on a network will make use of ports to connect to the internet or other intra-network devices. Similarly, different databases use different types of ports to provide users with ability to store and manage data. As testers, you must have knowledge of different ports that databases use, as it helps in determining the type of database present on the network. Scanning for ports will help the testers to find status of the database and the ports available for probe. Identifying the ports will allow them to detect the services running on the databases. Use port scanning tools, such as Nmap, to identify different ports in database.

Database | Default Ports 
---------|---------------
Oracle | 1521
Microsoft SQL Server | 1433
MySQL | 3306
PostgreSQL | 5432

- Nmap  
  Source: https://www.nmap.org  
  Nmap ("Network Mapper") is a free and open source (license) utility for network discovery and security auditing. You can use the Nmap tool with the following command to find the type of database running on a port:
  ```
  nmap -p <port number> -Pn <Target IP Address>
  ```

### Sniff Database-related Traffic on the Local Wire  
The testers use various network data capturing tools to capture the data packets and analyze them to find the data packets coming from and to the database. With the process of sniffing, you can determine the number of database connections and filter the database traffic by using the specific ports’ different databases’ uses to connect to the internet or the server. Use packet sniffing tools, such as Wireshark, to sniff the data packets. 

- Wireshark  
  Source: https://www.wireshark.org  
  Wireshark is a network protocol analyzer. It lets users capture and interactively browse the traffic running on a target network. Wireshark can read live data from Ethernet, Token-Ring, FDDI, serial (PPP and SLIP), 802.11 wireless LAN, ATM connections (if the OS on which it’s running allows Wireshark to do so), and any device supported on Linux by recent versions of libpcap. AirPcap can be integrated with Wireshark for complete WLAN traffic analysis, visualization, drill-down, and reporting.

  You can use the following filters to find database specific traffic: 
  - Use filter tcp.port==1521 to filter Oracle SQL *Plus specific traffic 
  - Use filter tcp.port==1433 to filter SQL specific server traffic 
  - Use filter tcp.port==3306 to filter MySQL specific traffic

### Discover Databases on Network  
The testers must find if a database exists on the network, type of database, and methods of accessing the database. This will help them in customizing the tests according to database type, finding the type of servers and applications running on them, and performing different tests.

You can use different network and database discovery tools, such as AppDetectivePro, ManageEngine Applications Manager, McAfee Database Security, IBM Security Guardium, Database Performance Analyzer, Imperva SecureSphere, and Spiceworks Inventory to find databases present on a network. 

- AppDetectivePro  
  Source: https://www.trustwave.com  
  AppDetectivePRO is database vulnerability assessment software that businesses use to identify and remediate vulnerabilities, configuration errors, rogue installations, and access issues in their database deployments.  
  Use the AppDetectivePRO tools to find all the databases present on the network and find their types and versions.

## Database Enumeration: Oracle  
In this section, you will learn about the process of enumerating Oracle Database and to scan for default Oracle Database ports, capture traffic, and identify the database version.

### Scan for other Default Ports Used by the Oracle Database 
Source: http://www.red-database-security.com  
Following are the default ports used for various products, such as Oracle Database and Oracle Application Server:

Service | Port | Product
--------|------|--------
Oracle HTTP Server listen port/Oracle HTTP Server port	|	80	|	Oracle Application Server
Oracle Internet Directory (non-SSL) 	|	389	|	Oracle Application Server 
Oracle HTTP Server SSL port 	|	443	|	Oracle Application Server 
Oracle Internet Directory (SSL)	|	636	|	Oracle Application Server
Oracle Net Listener/Enterprise Manager repository port	|	1521	|	Oracle Application Server/Oracle Database
Oracle Net Listener	|	1526	|	Oracle Database 
Oracle HTTP Server listen port/Oracle HTTP Server port	|	80	|	Oracle Application Server
Oracle Internet Directory (non-SSL) 	|	389	|	Oracle Application Server 
Oracle HTTP Server SSL port 	|	443	|	Oracle Application Server 
Oracle Internet Directory (SSL)	|	636	|	Oracle Application Server
Oracle Net Listener/Enterprise Manager repository port	|	1521	|	Oracle Application Server/Oracle Database
Oracle Net Listener 	|	1526	|	Oracle Database 
Oracle Names	|	1575	|	Oracle Database
Oracle Connection Manager (CMAN) 	|	1630	|	Oracle Rdb
Oracle JDBC for Rdb Thin Server	|	1701	|	Oracle Connection Manager 
Oracle Intelligent Agent 	|	1748	|	Oracle Application Server 
Oracle Intelligent Agent 	|	1754	|	Oracle Application Server 
Oracle Intelligent Agent	|	1808	|	Oracle Application Server
Oracle Intelligent Agent 	|	1809	|	Oracle Application Server 
Enterprise Manager Servlet port SSL	|	1810	|	Oracle Enterprise Manager
Oracle Connection Manager Admin (CMAN)	|	1830	|	Oracle Connection Manager (CMAN)
Enterprise Manager Agent port 	|	1831	|	Oracle Enterprise Manager 
Enterprise Manager RMI port 	|	1850	|	Oracle Enterprise Manager 
Oracle XML DB FTP port 	|	2100	|	Oracle Database
Oracle Intelligent Agent	|	1809	|	Oracle Application Server 
Enterprise Manager Servlet port SSL 	|	1810	|	Oracle Enterprise Manager
Oracle Connection Manager Admin (CMAN)	|	1830	|	Oracle Connection Manager (CMAN) 
Enterprise Manager Agent port	|	1831	|	Oracle Enterprise Manager 
Enterprise Manager RMI port 	|	1850	|	Oracle Enterprise Manager 
Oracle XML DB FTP port 	|	2100	|	Oracle Database 
Oracle GIOP IIOP	|	2481	|	Oracle Database 
Oracle GIOP IIOP for SSL 	|	2482	|	Oracle Database 
Oracle OC4J RMI 	|	3201	|	Oracle Application Server 
Oracle OC4J AJP	|	3301	|	Oracle Application Server 
Enterprise Manager Reporting port 	|	3339	|	Oracle Application Server 
Oracle OC4J IIOP	|	3401	|	Oracle Application Server 
Oracle OC4J IIOPS1 	|	3501	|	Oracle Application Server 
Oracle OC4J IIOPS2 	|	3601	|	Oracle Application Server 
Oracle OC4J JMS	|	3701	|	Oracle Application Server 
Oracle9iAS Web Cache Admin port 	|	4000	|	Oracle Application Server 
Oracle9iAS Web Cache invalidation port	|	4001	|	Oracle Application Server 
Oracle9iAS Web Cache Statistics port 	|	4002	|	Oracle Application Server 
Oracle Internet Directory (SSL)	|	4031	|	Oracle Application Server 
Oracle Internet Directory (non-SSL)	|	4032	|	Oracle Application Server 
OracleAS Certificate Authority (OCA)—server authentication	|	4400	|	Oracle Application Server 
OracleAS Certificate Authority (OCA)—mutual authentication	|	4401	|	Oracle Application Server 
Oracle HTTP Server SSL port	|	4443	|	Oracle Application Server 
Oracle9iAS Web Cache HTTP Listen (SSL) port	|	4444	|	Oracle Application Server 
Oracle TimesTen 	|	4662	|	Oracle TimesTen 
Oracle TimesTen 	|	4758	|	Oracle TimesTen 
Oracle TimesTen 	|	4759	|	Oracle TimesTen 
Oracle TimesTen 	|	4761	|	Oracle TimesTen 
Oracle TimesTen 	|	4764	|	Oracle TimesTen 
Oracle TimesTen	|	4766	|	Oracle TimesTen 
Oracle TimesTen	|	4767	|	Oracle TimesTen
Oracle Enterprise Manager Web Console 	|	5500	|	Oracle Enterprise Manager Web 
iSQL *Plus 10g	|	5560	|	Oracle iSQL *Plus
iSQL *Plus 10g	|	5580	|	Oracle iSQL *Plus RMI port 
Oracle Notification Service request port 	|	6003	|	Oracle Application Server 
Oracle Notification Service local port	|	6100	|	Oracle Application Server
Oracle Notification Service remote port 	|	6200	|	Oracle Application Server 
Oracle9iAS Clickstream Collector Agent 	|	6668	|	Oracle Application Server 
Java Object Cache port	|	7000	|	Oracle Application Server 
DCM Java Object Cache port	|	7100	|	Oracle Application Server 
Oracle HTTP Server Diagnostic port 	|	7200	|	Oracle Application Server 
Oracle HTTP Server port tunneling	|	7501	|	Oracle Application Server
Oracle HTTP Server listen port/Oracle HTTP Server port	|	7777	|	Oracle Application Server 
Oracle9iAS Web Cache HTTP listen (non-SSL) port	|	7779	|	Oracle Application Server
Oracle HTTP Server JServ port 	|	8007	|	Oracle Application Server 
Oracle XML DB HTTP port 	|	8080	|	Oracle Database
OC4J Forms/Reports Instance	|	8888	|	Oracle Developer Suite 
OC4J Forms/Reports Instance 	|	8889	|	Oracle Developer Suite 
Oracle Forms Server 6/6i	|	9000	|	Oracle Application Server
Oracle SOAP Server 	|	9998	|	Oracle Application Server
OS Agent	|	14000	|	Oracle Application Server 
Oracle TimesTen	|	15000	|	Oracle TimesTen
Oracle TimesTen 	|	15002	|	Oracle TimesTen
Oracle TimesTen 	|	15004	|	Oracle TimesTen
Log Loader	|	44000	|	Oracle Enterprise Manager

### Scan for Non-Default Ports Used by the Oracle Database 
Some other ports used by Oracle are as follows: 

Service	|	Port	|	Notes
--------|-------|------
SQL *Net	|	66	|	Oracle SQL *Net
SQL *Net 1 	|	1525	|	Registered as orasrv
tlisrv	|	1527	|	-
coauthor	|	1529	|	-
Oracle Remote Database 	|	1571	|	rdb-dbs-disp
oracle-em1 	|	1748	|	-
oracle-em2 	|	1754	|	-
Oracle-VP2 	|	1808	|	-
Oracle-VP1	|	1809	|	-
Oracle? 	|	2005	|	Registered as "berknet" for 2005 TCP, Oracle for 2005 UDP
Oracle GIOP 	|	2481	|	giop
Oracle GIOP SSL 	|	2482	|	giop-ssl
Oracle TTC 	|	2483	|	ttc. Oracle may use this port to replace 1521 in future
Oracle TTC SSL	|	2484	|	ttc-ssl
OEM Agent 	|	3872	|	Oem-agent 
Oracle RTC-PM port 	|	3891 	|	rtc-pm-port 
Oracle dbControl Agent 	|	3938	|	dbcontrol_agent 

### Check the Status of the TNS Listener Running at the Oracle Server  
The TNS Listener process is an independent process that connects to the database and resides in the software layers of both the client and server. TNS Listener establishes connections between the Oracle Server and a client app, allowing valid users who have permissions to control the database and OS to execute the arbitrary code.

To find the TNS Listener, testers can use port scanners such as Nmap. If the TNS Listener is not password protected, use the following command to get the SID:
```
tnscmd10g.pl status –h <ip-address>
```
The Oracle TNS Listener is the intermediary between a user/web server offering connection and the back-end database. The following files control the Listener: 

- `$ORACLE_ HOME/bin/lsnrctl`: This is the actual TNS Listener control program.
- `$ORACLE_HOME/network/admin/listener.ora`: This is the actual TNS Listener configuration file.
- `$ORACLE_ HOME/bin/tnslnsr`: This is the actual listening process. Figure 
![TNS Listener](https://github.com/user-attachments/assets/29a7183b-2d08-4e7a-b246-1953f79a3cf8)

### Enumerate the Database
Using the version of database, the testers can find if the client has failed to update the database and detect any known vulnerabilities that hackers can exploit. You can use the utility, such as TNSPING to find the version of the database and check if the listener is running.

- TNSPING  
TNSPING utility will help to detect the version of Oracle Database running on the target. This utility also helps in confirming that Oracle Listener is up and running. TNS (Transparent Network Substrate) is a listener used to establish and maintain remote connections. Run tnsping [target] command from command prompt.
```
tnsping [target] 
```
![Using TNSPING to identify version](https://github.com/user-attachments/assets/74ed6968-d142-44c3-88e0-8fa2e213f490)

- Tnscmd
Tnscmd directly communicates with the TNS Listener without any need of client and connection strings. Download and run tnscmd.pl script to gather Oracle TNS Listener information. You can use it to discover the Oracle version running on the target. Encoded in decimal, the VSNNUM field denotes the version of Oracle Database in use. You need to convert it into hex to determine the version of the database. For example, 186646784 = B200100=11.2.0.1.0.

Even if the user does not provide commands to tnscmd tool, it will ping the stated host by default and establish a bidirectional conversation. Use the following tnscmd script: 
- `(CONNECT_DATA=(COMMAND=services)` is the tns command. o “writing 91 bytes” represents the raw tns packet that is being sent to the TNS Listener.
- The `“=(DESCRIPTION=(ERR= etc.”` is the raw tns reply that is received from the tns listener.
- The attribute `VSNNUM` carries the version number of the Oracle Server in decimals. You can convert this value into hexadecimal to know the actual version number.

**Note:** tnscmd.pl script is available at http://www.red-database-security.com/scripts/tnscmd10g.pl.txt

![Using tnscmd to identify version](https://github.com/user-attachments/assets/a3b18f27-f4ee-4104-a4a6-2a18d5536897)

![Decimal to hex conversion](https://github.com/user-attachments/assets/5254aa94-453d-4915-b756-f647bdde03bc)

- Metasploit  
  Source: https://www.metasploit.com
We recommend you to determine Oracle Database version using tns mixin added to the Metasploit framework. Metasploit is the most popular tool used to develop as well as execute the exploit code against the remote target machine. Metasploit includes an Oracle version scanner that uses tns mixing, which will help the testers in finding the version of target database.

The following commands will help you to check whether a hacker can determine the Oracle version of their client’s system or not. The basic options required to execute this process are as follows: 
- **RHOSTS**: Represents the address range of target systems.
- **RPORT**: Indicates the target port.
- **THREADS**: Denotes the number of threats that are running in parallel on the target system.
![Using tns mixin to discover Oracle Database version](https://github.com/user-attachments/assets/b8d8ad75-9783-4232-8520-4db41de60e9e)

### Enumerating Oracle SID: 
- OraclePwGuess  
  Use the OraclePwGuess present in the Oracle Auditing Tools (OAT) to enumerate SID/multiple SIDs containing default usernames and passwords.
![Enumerating Oracle Database SID using OraclePwGuess](https://github.com/user-attachments/assets/c78405bf-f25d-4769-b71d-a5cde0347b31)

- Metasploit  
In the older version of Oracle (before 9.2.0.8), testers may obtain the Service ID (SID) of the database by sending a simple request. For all new versions of Oracle, you have to guess, Brute force, or determine the SID in other ways. Hence, we recommend the tester to guess the SID or determine it by using Metasploit.
![Enumerating Oracle Database SID using Metasploit](https://github.com/user-attachments/assets/5f3cf2a2-19f2-4533-9fd4-c1785701aa33)
You may use the Service ID (SID) obtainedto perform a Dictionary cyberattack.
![Brute forcing the Oracle Database using SIDs](https://github.com/user-attachments/assets/d9d4cd81-b791-4e21-86c6-6041fb717268)

### Using Error Messages  
In vulnerable apps, it is possible to retrieve database information via error messages. You may use the following SQL injection queries to retrieve version, usernames, user tables, etc. from the target Oracle Database. 

- Use this SQL injection query in the URL to throw an error message that will reveal the Oracle Database version used at the back end:
  ```
  ' or 1 = utl_inaddr.get_host_address((select banner from v$version where rownum=1))-
  ```
- Use this SQL injection query in URL to throw an error message that will reveal a list of all usernames in Oracle Database (11g):
  ```
  or 1=utl_inaddr.get_host_address((select sys.stragg (distinct username||chr(32)) from all_users))--
  ```
- Use this SQL injection query in URL to throw an error message that will reveal a list of all user tables and the number of rows in Oracle Database (11g):
  ```
  or 1=utl_inaddr.get_host_address((select sys.stragg (distinct username||chr(32)) from all_users))--
  ```

### Access Home Page  
The following steps will help you to access the home page of the Oracle Database. 
- Open web browser and enter the URL in the following format:  
  https://hostname:portnumber/em

- Where the hostname should be name of the host computer on which the database was installed and the portnumber will be the Enterprise Manager Console HTTP port number provided by installer. It helps you to enumerate version number and other sensitive information. While using a LUNIX or UNIX operating system, find the database control’s port number by navigating to the following path:
  `$ORACLE_HOME/install/portlist.ini file`

- If you are using Windows OS, then go to the Database Control Properties window through the following path:  
  `$ORACLE_HOME/Oracle_sid/sysman/config/emd.properties`

- Where Oracle_sid is your database instance’s system identifier, search for the `REPOSITORY_URL` to find your database control’s port number.

- After entering the URL, you will see a Sign in page. If you see Startup/Shutdown option on your database control, it represents that your database is down. Perform the following activities in such a case:
  - Click on the Startup/Shutdown option and enter host credentials followed by your database sign in credentials to start the database (by default, the database username will be SYS)
  - Now, click OK to start the database instance and then approve it by clicking on the YES option on the confirmation page.

- In the sign in page, enter the authorized user credentials that provide full access to the database.

  ![Accessing the Oracle Database home page](https://github.com/user-attachments/assets/898bd9df-34d0-411e-bb47-1d3ac7a1e186)

  **Note:** View Oracle_home/install/portlist.ini file to find port number for Database Control on Linux and Unix systems whereas view Database Control Properties window to find port number in Windows system.

### Access System Tables
The testers must check if any system tables of the Oracle Database are accessible, as it contains details about the database objects, users, errors, indexes, etc. You can enumerate the system tables using the SQL *Plus.

SQL *Plus runs .sql scripts against Oracle. We recommend you to run WinSID or a similar tool to look for the service name.  
Example: `SERVICE_NAME=test.domain`

To establish a connection to a remote server, go to the command prompt and type the following:  
`sqlplus user/password@test.domain` 

Then from the SQL> prompt, type the following commands: 
`@c:\sql\sql`  
(In this example, the script is located at c:\sql and is called sql.sql)
