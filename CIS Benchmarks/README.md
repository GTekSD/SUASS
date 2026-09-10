# Center for Internet Security (CIS) Benchmarks: An Enterprise Field Guide for Cybersecurity Professionals

![CIS Security Guide](https://img.shields.io/badge/Focus-CIS%20Benchmarks%20%26%20Nessus-blue.svg)
![Target Audience](https://img.shields.io/badge/Audience-Beginner%20%2F%20Junior%20Security%20Engineers-green.svg)
![Document Version](https://img.shields.io/badge/Version-3.0-orange.svg)

Welcome to the **Practical CIS Benchmarks & Compliance Audit Field Guide**. This document is written from the perspective of an active enterprise cybersecurity professional. It bridges the gap between theoretical security frameworks and real-world enterprise compliance, scanning, and hardening workflows.

---

## 📋 Table of Contents
1. [Overview: CIS Controls vs. CIS Benchmarks](#1-overview-cis-controls-vs-cis-benchmarks)
2. [Anatomy of a CIS Benchmark Document](#2-anatomy-of-a-cis-benchmark-document)
3. [Where to Download CIS Benchmarks & Resources](#3-where-to-download-cis-benchmarks--resources)
4. [Nessus Audit Files (`.audit`): Acquisition & Customization](#4-nessus-audit-files-audit-acquisition--customization)
5. [Step-by-Step: Performing CIS Compliance Scans in Tenable Nessus](#5-step-by-step-performing-cis-compliance-scans-in-tenable-nessus)
6. [Scoring, Evaluation, and Compliance Marking](#6-scoring-evaluation-and-compliance-marking)
7. [Enterprise Workflow: Real-World Hardening & Audit Lifecycle](#7-enterprise-workflow-real-world-hardening--audit-lifecycle)
8. [Troubleshooting & Pro Tips for Junior Engineers](#8-troubleshooting--pro-tips-for-junior-engineers)

---

## 1. Overview: CIS Controls vs. CIS Benchmarks

A common point of confusion for beginners is the difference between **CIS Controls**, **CIS Benchmarks**, and **CIS Hardening Rules**.

```
+-----------------------------------------------------------------------+
|                         CIS CONTROLS (v8)                             |
| High-level strategic defensive actions (e.g., Control 4: Secure Config)|
+-----------------------------------------------------------------------+
                                  |
                                  v
+-----------------------------------------------------------------------+
|                        CIS BENCHMARKS                                 |
| Technical, OS/Device-specific configuration standards (e.g., Win11)  |
+-----------------------------------------------------------------------+
                                  |
                                  v
+-----------------------------------------------------------------------+
|                    AUDIT FILES & REMEDIATION                          |
| Automated scripts (.audit, GPO, Ansible) enforcing the settings       |
+-----------------------------------------------------------------------+
```

### Key Differences Matrix

| Concept | What It Is | Example | Target Audience |
| :--- | :--- | :--- | :--- |
| **CIS Controls** | 18 high-level cybersecurity recommendations (safeguards) prioritized by Implementation Groups (IG1, IG2, IG3). | *Control 4: Secure Configuration of Enterprise Assets and Software* | CISO, Security Directors, IT Management |
| **CIS Benchmarks** | Detailed, platform-specific technical hardening documentation (over 100+ technologies supported). | *CIS Microsoft Windows Server 2022 Benchmark v3.0.0* | Security Engineers, Systems Administrators |
| **CIS Hardening / Audit Files** | Implementation scripts, Group Policy Objects (GPOs), or automated scanner files (`.audit`, `.json`, `.yml`). | *Tenable `.audit` file for Windows Server 2022* | Vulnerability Managers, SOC Analysts, SysAdmins |

---

## 2. Anatomy of a CIS Benchmark Document

Every CIS Benchmark standard is divided into **Profiles** and structured **Recommendations**.

### Profile Levels

1. **Level 1 (L1) - Base / General Use**:
   - Designed to provide practical security benefits without significantly impacting usability, performance, or service availability.
   - Intended for all production enterprise environments.
2. **Level 2 (L2) - High Security / Defense-in-Depth**:
   - Designed for environments where security is paramount (e.g., banking, healthcare, SCADA, classified networks).
   - May reduce operational functionality or cause performance degradation if not tested carefully.
3. **STIG Profile**:
   - Aligned specifically with Defense Information Systems Agency (DISA) Security Technical Implementation Guides (STIGs) for government/defense compliance.

### Structure of a Single Benchmark Recommendation

Each item in a CIS Benchmark PDF follows a strict schema:

* **Recommendation ID & Title**: e.g., `2.3.1.1 (L1) Ensure 'Accounts: Rename administrator account' is set to 'Enabled'`
* **Profile Applicability**: Indicates whether it belongs to Level 1, Level 2, or Domain Controller / Member Server.
* **Assessment Status**:
  * **Automated**: The setting can be automatically evaluated via a compliance scanner (like Nessus).
  * **Manual**: Requires human intervention, interviews, or visual verification.
* **Description**: Detailed operational explanation of the setting.
* **Rationale**: *Why* this rule exists and the risk/attack vector it mitigates (e.g., password spraying, lateral movement).
* **Impact**: Operational warnings or side effects of enforcing the control.
* **Audit Procedure**: Manual step-by-step command line, PowerShell, registry check, or GUI verification instructions.
* **Remediation Procedure**: Exact steps required to apply the recommended setting (e.g., GPO path, registry update, `chmod`/`chown` commands).
* **Default Value**: Out-of-the-box vendor default configuration.
* **References**: Mappings to MITRE ATT&CK, NIST SP 800-53, ISO 27001, and CIS Controls v8.

---

## 3. Where to Download CIS Benchmarks & Resources

As a security practitioner, bookmark these primary official repositories:

| Resource | Description | Official Link |
| :--- | :--- | :--- |
| **CIS Benchmarks PDF Catalog** | Download free PDF versions of all official CIS Benchmarks (Registration required). | [https://www.cisecurity.org/cis-benchmarks](https://www.cisecurity.org/cis-benchmarks) |
| **CIS WorkBench Platform** | Community hub to access draft benchmarks, submit feedback, and participate in discussion groups. | [https://workbench.cisecurity.org/](https://workbench.cisecurity.org/) |
| **Tenable Compliance Audits Repository** | Official store to download `.audit` files for Nessus, Tenable.io, and Tenable.sc. | [https://www.tenable.com/downloads/compliance-audits](https://www.tenable.com/downloads/compliance-audits) |
| **CIS Controls Mapping Tools** | Download Excel matrices mapping CIS Benchmarks to NIST, PCI-DSS, ISO 27001, and SOC 2. | [https://www.cisecurity.org/controls/cis-controls-navigator](https://www.cisecurity.org/controls/cis-controls-navigator) |
| **CIS SecureSuite (Paid/Enterprise)** | Automated CIS-CAT Pro tools, XML/XCCDF exports, and pre-built GPOs/Ansible content. | [https://www.cisecurity.org/cis-securesuite](https://www.cisecurity.org/cis-securesuite) |

---

## 4. Nessus Audit Files (`.audit`): Acquisition & Customization

Nessus evaluates system compliance using specialized, proprietary XML-formatted text files with the `.audit` extension.

### 4.1 Where to Download `.audit` Files
1. **Directly inside Nessus**: Nessus comes pre-loaded with hundreds of built-in CIS Audit templates that are updated continuously via plugin feeds.
2. **Tenable Download Portal**: Visit [Tenable Compliance Audits](https://www.tenable.com/downloads/compliance-audits) to manually download `.audit` files for offline or customized deployment.

### 4.2 Structure of a Nessus `.audit` Check
Below is an example snippet of a custom check inside a `.audit` file evaluating Windows Password History:

```xml
<check_type: "Windows" version: "2">
  <group_policy: "Password Policy">
    <custom_item>
      type: PASSWORD_POLICY
      description: "2.1.1 (L1) Ensure 'Enforce password history' is set to '24 or more password(s)'"
      info: "This policy setting determines the number of renewed, unique passwords that must be associated with a user account before an old password can be reused."
      solution: "Configure the GPO to set 'Enforce password history' to '24 or more password(s)'."
      reference: "800-53|IA-5(1),CIS_Control_v8|5.2,LEVEL|1S"
      see_also: "https://workbench.cisecurity.org/"
      value_type: POLICY_SET
      value_data: "24"
      password_policy: ENFORCE_PASSWORD_HISTORY
    </custom_item>
  </group_policy>
</check_type>
```

### 4.3 Customizing `.audit` Files for Enterprise Exceptions
In real enterprise environments, applying default CIS recommendations 100% blindly will break applications. You will frequently need to customize `.audit` files:

1. **Open the `.audit` file** in a text editor (e.g., VS Code or Notepad++).
2. **Search for the recommendation ID** (e.g., Minimum Password Length).
3. **Modify `value_data`**:
   - Default CIS rule: `value_data: [14..MAX]`
   - Organization standard exception (e.g., 12 characters approved by CISO): change to `value_data: [12..MAX]`.
4. **Disable unwanted rules**: Comment out or delete specific `<custom_item>` blocks if your organization has formally granted an exception.
5. **Save and re-upload** to Nessus as a **Custom Compliance Audit Template**.

---

## 5. Step-by-Step: Performing CIS Compliance Scans in Tenable Nessus

Running a compliance scan requires **authenticated/credentialed administrative access** because Nessus must query deep system configurations (Registry, GPO, `/etc/pam.d/`, `/etc/ssh/sshd_config`, database tables).

```
+------------------+         Encrypted SSH / SMB / WinRM         +-------------------+
|  Nessus Scanner  | -----------------------------------------> | Target OS / Host  |
|  (Admin Creds)   | <----------------------------------------- | (Evaluates Reg/CFG|
+------------------+     Returns Config State (Pass/Fail)       +-------------------+
```

### Step 1: Create a New Policy Compliance Scan
1. Log in to **Tenable Nessus**.
2. Navigate to **My Scans** -> Click **New Scan** (top right).
3. Under the **Policy Compliance** tab, select **Policy Compliance Auditing** (or **Advanced Compliance Audit**).

### Step 2: Configure Basic Settings
* **Name**: `CIS Compliance Audit - Windows Server 2022 - Production`
* **Targets**: Enter IP addresses, CIDR ranges, or FQDNs (e.g., `192.168.10.0/24`).

### Step 3: Configure Target Credentials (CRITICAL)
Without proper administrative credentials, compliance scans will fail completely or return false positives.

* **For Windows Targets**:
  * Navigation: **Credentials** tab -> **Windows**.
  * **Authentication Method**: Password, Kerberos, or Hash.
  * **Username/Password**: Domain Admin or dedicated local Service Account with Local Administrator privileges.
  * Ensure `Remote Registry Service` is running on target hosts and `WinRM` or `SMB (TCP 445)` is accessible through firewalls.
* **For Linux/Unix Targets**:
  * Navigation: **Credentials** tab -> **SSH**.
  * **Authentication Method**: SSH Key or Password.
  * **Elevate Privileges**: Set **Elevate Privileges With** to `sudo` or `su` (Nessus needs root to read secure files like `/etc/shadow` and `/etc/gshadow`).

### Step 4: Attach Audit Files
1. Navigate to the **Compliance** tab in your scan configuration.
2. Choose one of two options:
   * **Built-in CIS Category**: Search for `CIS Microsoft Windows Server 2022` or `CIS Ubuntu Linux 22.04 LTS`.
   * **Upload Custom Audit File**: Click **Add File** and select your modified `.audit` file created in Section 4.3.
3. Set the target **Profile** (e.g., `Level 1 Workstation`, `Level 1 Server`, or `Level 2 Domain Controller`).

### Step 5: Execute & Verify Scan Execution
1. Click **Save**, then click **Launch** (Play button).
2. **Check Credential Verification First**:
   - Once the scan finishes, look for Plugin ID `21745` (*Authentication Success*) or Plugin ID `10919` (*Credentialed Checks Not Performed*).
   - If Plugin `10919` or `35832` triggers, your compliance results are invalid due to access denial.

---

## 6. Scoring, Evaluation, and Compliance Marking

### 6.1 Compliance Status Definitions

When Nessus completes a compliance scan, findings are categorized into four primary statuses:

```
+-------------------------------------------------------------------------------+
|                             SCAN RESULT STATUSES                              |
+---------------------+---------------------------------------------------------+
| [ PASSED ]          | Target state matches the exact baseline requirement.   |
| [ FAILED ]          | Configured setting deviates from baseline.             |
| [ WARNING / MANUAL ]| Item cannot be verified programmatically; manual audit.|
| [ EXEMPT / WAIVED ] | Business exception formally approved by CISO/Risk Team.  |
+---------------------+---------------------------------------------------------+
```

1. **PASSED (Green)**:
   - System configuration strictly meets or exceeds the required specification.
2. **FAILED (Red)**:
   - System configuration deviates from standard (e.g., Password length is 8 instead of 14).
   - **Action**: Generates a task for SysAdmin/DevOps remediation.
3. **WARNING / MANUAL CHECK (Yellow / Orange)**:
   - Setting cannot be validated purely via automated script (e.g., verifying physical lock controls or organizational policy documentation).
   - **Action**: Security Analyst must manually verify and update auditor records.
4. **EXEMPT / ACCEPTED RISK**:
   - The finding was marked failed by the tool, but an official risk exception form exists signed by leadership.

### 6.2 Compliance Percentage Calculation

Compliance score is calculated as:

$$	ext{Compliance Score (\%)} = \left( rac{	ext{Passed Rules}}{	ext{Total Rules Evaluated} - 	ext{Exempt Rules}} 
ight) 	imes 100$$

> **Enterprise Target Standard**: Most enterprises mandate a **85% to 95%** compliance rate across critical infrastructure assets, recognizing that 100% compliance is rarely achievable without operational disruption.

---

## 7. Enterprise Workflow: Real-World Hardening & Audit Lifecycle

In real enterprise security operations, applying CIS Benchmarks is an ongoing, cross-functional lifecycle involving Security, System Administrators, IT Operations, and Risk Management teams.

```
 +-----------------------------------------------------------------+
 | 1. GAP ANALYSIS                                                 |
 |    Run baseline Nessus audit against unhardened staging systems|
 +-----------------------------------------------------------------+
                                  |
                                  v
 +-----------------------------------------------------------------+
 | 2. POLICY TAILORING & STAKEHOLDER REVIEW                        |
 |    Define organizational standards (L1/L2) with SysAdmins       |
 +-----------------------------------------------------------------+
                                  |
                                  v
 +-----------------------------------------------------------------+
 | 3. AUTOMATED HARDENING IMPLEMENTATION                           |
 |    Deploy GPOs, Ansible Playbooks, Puppet, or PowerShell DSC   |
 +-----------------------------------------------------------------+
                                  |
                                  v
 +-----------------------------------------------------------------+
 | 4. STAGING TESTING & OPERATIONAL VALIDATION                     |
 |    Verify application health in QA/Staging environments        |
 +-----------------------------------------------------------------+
                                  |
                                  v
 +-----------------------------------------------------------------+
 | 5. PRODUCTION DEPLOYMENT & CONTINUOUS SCANNING                  |
 |    Enforce in Prod; schedule weekly automated Nessus scans     |
 +-----------------------------------------------------------------+
                                  |
                                  v
 +-----------------------------------------------------------------+
 | 6. REMEDIATION & EXCEPTION MANAGEMENT                           |
 |    Raise tickets (Jira/ServiceNow); document formal exceptions  |
 +-----------------------------------------------------------------+
```

### Detailed Phase Breakdown

#### Phase 1: Policy Baseline Definition & Tailoring
* Security team downloads the latest CIS Benchmark PDF for target technology.
* Conduct a joint review meeting with IT Infrastructure / DevOps leads.
* Review rules line-by-line to select Level 1 vs. Level 2 requirements.

#### Phase 2: Automated Enforcement Code Creation
Never manually harden servers one by one! Enterprise operations use Infrastructure as Code (IaC) and Configuration Management tools:
* **Windows Environments**: Build Centralized Group Policy Objects (GPOs) or Microsoft Intune Policies using CIS GPO Kits.
* **Linux Environments**: Use open-source CIS Ansible Roles (e.g., `ansible-lockdown` roles on GitHub) or SaltStack/Puppet.
* **Cloud Infrastructure (AWS/Azure/GCP)**: Enforce via Terraform, AWS Config rules, or Azure Policy definitions.

#### Phase 3: Staging & Regression Testing
* Apply hardening configs to a staging/QA environment.
* Execute application integration and performance tests to ensure baseline hardening doesn't break business applications.

#### Phase 4: Production Scan & Remediation Tracking
* Schedule automated weekly compliance scans in Nessus.
* Export failure findings into **Jira** or **ServiceNow Security Operations (SecOps)** tasks.
* Assign tickets to system owners with strict Remediation SLAs (e.g., Critical/High misconfigurations resolved within 14-30 days).

#### Phase 5: Exception & Waiver Processing
If a business-critical legacy app breaks when a CIS setting is applied (e.g., legacy app requires TLS 1.1 or specific local privileges):
1. System owner submits a **Risk Acceptance Form**.
2. Security team evaluates compensatory controls (e.g., isolating host behind internal firewall, strict network segmentation, enhanced log monitoring).
3. CISO or VP of Security signs off on temporary exception (valid for 6-12 months).
4. Analyst updates Nessus custom audit file or marks host as exempt in reporting matrix.

---

## 8. Troubleshooting & Pro Tips for Junior Engineers

### 💡 Tip 1: Avoid Production-Breaking Hardening Rules
Be extremely cautious when applying these high-risk CIS rules in production without prior staging test:

| Rule Category | Potential Production Impact | Safe Practice |
| :--- | :--- | :--- |
| **Disabling SMBv1 / NTLM** | May break legacy file shares, legacy printers, or older domain authentication. | Audit NTLM/SMBv1 traffic in event logs first before disabling completely. |
| **Strict User Rights Assignment** | Disabling "Deny log on through Remote Desktop Services" or modifying service account rights can lock out backup agents. | Map all third-party backup/monitoring service accounts prior to GPO push. |
| **Enforcing TLS 1.2+ Only** | Legacy API integrations or older database connectors will fail to connect. | Enable SSL/TLS audit logging on web application servers first. |
| **Rename Local Admin Account** | Hardcoded automation scripts or legacy IT scripts targeting `Administrator` username will fail. | Update all LAPS (Local Administrator Password Solution) and deployment scripts simultaneously. |

### 💡 Tip 2: Common Nessus Authentication Errors & Troubleshooting

* **Plugin ID 21745 (*Authentication Success*)**: Confirms successful login. Always verify this plugin is present in scan results.
* **Plugin ID 10919 (*Credentialed Checks Not Performed*)**: Indicates authentication failed entirely or privilege escalation was denied.
* **Plugin ID 35832 (*NTLM Authentication Failed*)**: Incorrect SMB username, domain, or password on Windows.
* **Linux Sudo Errors**: Ensure the service account user has `NOPASSWD` configured in `/etc/sudoers` for non-interactive scan execution:
  ```bash
  # Example sudoers entry for Nessus scan account
  nessus_audit ALL=(ALL) NOPASSWD: ALL
  ```

### 💡 Tip 3: How to Differentiate Vulnerability Scans vs. Compliance Scans

* **Vulnerability Scan**: Searches for missing security patches, software CVEs, open ports, and vulnerable software versions (e.g., Outdated Apache version CVE-2023-XXXXX).
* **Compliance Scan**: Evaluates system **configurations**, security policies, user privileges, registry settings, and system hardening regardless of patch level (e.g., Apache installed is updated, but directory indexing is enabled).

---

## 🎓 Recommended Further Learning & Certifications

To advance your career in Security Architecture and Compliance Auditing:
* **Certifications**:
  * **GIAC Critical Controls Certification (GCCC)**
  * **ISACA Certified Information Systems Auditor (CISA)**
  * **CompTIA Security+ / CySA+**
* **Free Hands-on Labs**:
  * Experiment with `ansible-lockdown` roles on GitHub to automate CIS hardening on Ubuntu/RHEL VMs.
  * Download Nessus Essentials (Free for up to 16 IP addresses) and practice auditing your local home lab VMs.

---
*Created for Junior Cybersecurity Analysts, Compliance Auditors, and Systems Hardening Engineers.*
