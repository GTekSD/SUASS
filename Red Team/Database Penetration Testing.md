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





