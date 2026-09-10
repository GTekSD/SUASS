# 🚀 Universal Guide: Running a Fully Offline AI Assistant

> Learn how to set up a 100% private, local AI assistant on your computer for **everyday tasks**, **studies**, **reasoning**, **cybersecurity**, and **coding** — with **zero subscription fees**, **no rate limits**, **no data leaks**, and **no internet connection required**!

---

## 📌 Overview

This guide provides a complete roadmap for running artificial intelligence locally on your PC or Mac. Whether you are a student writing essays, a cybersecurity analyst querying logs, a everyday user looking for a private assistant, or a developer coding in VS Code, you can run powerful open-source AI models without sending a single byte of data to the cloud.

---

## 🎯 Key Benefits

* 🔒 **100% Private & Secure**: Your personal data, sensitive documents, and code never leave your computer.
* ⚡ **Zero Cloud Latency & Unlimited Use**: No rate limits, no daily prompt caps, and no monthly API bills.
* ✈️ **Works Completely Offline**: Use your AI on airplanes, during internet outages, or in high-security environments.
* 💰 **100% Free & Open-Source**: Powered by community models with no hidden fees or subscriptions.
* 🕵️ **Auditable Security**: Includes live network monitoring tools to verify zero external data transmission.

---

## 📋 System Requirements & Model Recommendations

Match your computer's RAM (memory) to the right AI model for your specific needs:

### 💡 Model Selection Matrix by Use Case & Hardware

| Hardware / RAM | Primary Use Case | Recommended Model | Ollama Command |
| :--- | :--- | :--- | :--- |
| **8 GB RAM or less** <br> *(Standard Laptops)* | **General / Everyday & Studies** | Llama 3.2 (3B) | `ollama run llama3.2` |
| | **Thinking & Reasoning** | DeepSeek R1 (1.5B) | `ollama run deepseek-r1:1.5b` |
| | **Coding & Scripts** | Qwen 2.5 Coder (1.5B) | `ollama run qwen2.5-coder:1.5b` |
| **16 GB RAM** <br> *(Power Users & Workstations)* | **General Use & Writing** | Qwen 2.5 (14B) / Mistral (7B) | `ollama run qwen2.5:14b` |
| | **Thinking & Complex Math** | DeepSeek R1 (7B or 8B) | `ollama run deepseek-r1:7b` |
| | **Cybersecurity & Threat Analysis** | Foundation Security (8B) | `ollama run FenkoHQ/Foundation-Sec-8B` |
| | **Coding & Refactoring** | Qwen 2.5 Coder (7B) / DeepSeek Coder | `ollama run qwen2.5-coder:7b` |
| **32 GB+ RAM / GPU** <br> *(High Performance / Enterprise)* | **Enterprise, Agents & Workflows** | **NVIDIA Nemotron 3.5 Lightning** *(Top Tier)* | `ollama run nemotron-3.5-lightning` |
| | **Enterprise Reasoning & Helpfulness** | **NVIDIA Nemotron 70B** | `ollama run nemotron` |
| | **Deep Reasoning & Logic** | DeepSeek R1 (32B) | `ollama run deepseek-r1:32b` |
| | **Advanced Architecture & Coding** | Qwen 2.5 Coder (32B) | `ollama run qwen2.5-coder:32b` |

---

## 🗺️ Quick Setup Overview

1. [General Setup: Running a Fully Offline AI Assistant](#1-running-a-fully-offline-ai-assistant)
2. [Coder Guide: Running a Fully Offline AI Coding Assistant in VS Code](#2-running-a-fully-offline-ai-coding-assistant-in-vs-code)
3. [Network Security & Privacy Monitoring](#3-🛡️-network-security--privacy-monitoring)
4. [Hardened Docker Container Setup](#4-🐳-advanced-setup-hardened-docker-container)
5. [Ollama CLI Commands Cheat Sheet](#5-💡-ollama-cli-cheat-sheet)

---

## 1. Running a Fully Offline AI Assistant

Follow these steps to set up a universal AI assistant for general use, writing, studies, and reasoning.

### Step 1: Install Ollama (Backend LLM Runner)

Ollama is the engine that runs AI models directly on your hardware background service on `http://localhost:11434`.

1. Download the installer for your operating system:
   * 🖥️ **Windows / macOS / Linux**: [https://ollama.com/download](https://ollama.com/download)
2. Run the downloaded setup file and follow the standard instructions.

#### 🔍 Verification:
Open your Terminal (macOS/Linux) or Command Prompt / PowerShell (Windows) and type:

```bash
ollama --version
```

---

### Step 2: Download and Run Your AI Model

Choose a model based on what you want to do today:

* **For General Daily Chat & Studies:**
  ```bash
  ollama run llama3.2
  ```

* **For Step-by-Step Problem Solving & Deep Thinking:**
  ```bash
  ollama run deepseek-r1:7b
  ```

* **For Cybersecurity Operations & Threat Analysis:**
  ```bash
  ollama run FenkoHQ/Foundation-Sec-8B
  ```

* **For NVIDIA High-Performance Enterprise Workflows & Agents:**
  ```bash
  ollama run nemotron-3.5-lightning
  ```

#### 🔍 Verification:
Once downloaded, type a question directly into your terminal prompt:

```text
Explain quantum physics in simple terms for a 10-year-old.
```

If it answers, your AI is fully functional and running locally on your hardware! Type `/exit` to quit the interactive terminal prompt.

---

## 2. Running a Fully Offline AI Coding Assistant in VS Code

To pair your local AI with Visual Studio Code for real-time code completion, refactoring, and debugging, we use the **Continue** extension.

### 📦 Extension Information

* **Name**: Continue - open-source AI code agent
* **Id**: `Continue.continue`
* **Description**: The leading open-source AI code agent
* **Version**: `2.0.0`
* **Publisher**: Continue
* **VS Marketplace Link**: [https://marketplace.visualstudio.com/items?itemName=Continue.continue](https://marketplace.visualstudio.com/items?itemName=Continue.continue)

---

### Step-by-Step VS Code Configuration Guide

#### Step A: Download a Local Coding Model
Open your terminal and pull a dedicated coding model:

* **For laptops with 16GB+ RAM (Recommended):**
  ```bash
  ollama run qwen2.5-coder:7b
  ```
* **For laptops with 8GB RAM or less:**
  ```bash
  ollama run qwen2.5-coder:1.5b
  ```

#### Step B: Install Continue Extension in VS Code
1. Open **Visual Studio Code**.
2. Press `Ctrl + Shift + X` (Windows/Linux) or `Cmd + Shift + X` (macOS) to open the Extensions view.
3. Search for **Continue** (Publisher: `Continue`, ID: `Continue.continue`).
4. Click **Install**.

#### Step C: Connect Continue to Ollama
1. Click the **Continue** icon on the left sidebar activity panel in VS Code.
2. Click the ⚙️ **Gear Icon** at the bottom-right of the Continue panel to open `config.json`.
3. Paste or update your `config.json` with the following configuration:

```json
{
  "models": [
    {
      "title": "Local Qwen Coder",
      "provider": "ollama",
      "model": "qwen2.5-coder:7b"
    },
    {
      "title": "DeepSeek Reasoning",
      "provider": "ollama",
      "model": "deepseek-r1:7b"
    }
  ],
  "tabAutocompleteModel": {
    "title": "Autocomplete",
    "provider": "ollama",
    "model": "qwen2.5-coder:1.5b"
  }
}
```

#### Step D: Offline Verification Test
1. Disconnect your computer from Wi-Fi or Ethernet.
2. Open any code file in VS Code and highlight a block of code.
3. Press `Ctrl + L` (Windows/Linux) or `Cmd + L` (macOS) to open Continue.
4. Type `Refactor this code to make it more efficient` and press **Enter**.
5. If the code is generated while disconnected from the internet, your setup is complete!

---

## 3. 🛡️ Network Security & Privacy Monitoring

Want absolute mathematical proof that your AI (whether DeepSeek, Nemotron, or Qwen) isn't sending data across the internet? You can continuously monitor Ollama's network sockets using native terminal scripts *(inspired by NetworkChuck)*.

### 🪟 Windows (PowerShell)
Run this script in PowerShell to continuously inspect active TCP connections owned by Ollama:

```powershell
while($true) {
    Get-Process ollama -ErrorAction SilentlyContinue | ForEach-Object { 
        $id = $_.Id
        Write-Host "`nConnections for Ollama process $id" -ForegroundColor Green
        Get-NetTCPConnection | Where-Object OwningProcess -eq $id | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State 
    }
    Start-Sleep -Seconds 2
    Clear-Host
}
```
*Expected Result:* You should only see `127.0.0.1` / `localhost` bindings on port `11434`. No external IP addresses should appear.

### 🍎 macOS (Terminal)
Run this continuous monitoring loop in Terminal:

```bash
while true; do
    echo "$(date): Ollama Connections"
    lsof -i -P -n | grep ollama
    sleep 2
    clear
done
```

### 🐧 Linux (Terminal)
Monitor live network sockets bound to Ollama:

```bash
# Continuous monitoring using watch
watch -n 2 "lsof -i -P -n | grep ollama"

# Modern socket statistics alternative
ss -np | grep ollama
```

---

## 4. 🐳 Advanced Setup: Hardened Docker Container

For enterprise, financial, or corporate environments requiring strict isolation, run Ollama inside a restricted Docker container. This sandboxes the AI, drops kernel privileges, caps system memory, and mounts the container filesystem as **read-only**.

```bash
docker run -d   --name ollama   --gpus all   -v ollama:/root/.ollama   -p 11434:11434   --security-opt=no-new-privileges   --cap-drop=ALL   --cap-add=SYS_NICE   --memory=8g   --memory-swap=8g   --cpus=4   --read-only   ollama/ollama
```

### Key Security Flags Explained:
* `--security-opt=no-new-privileges`: Blocks processes inside the container from escalating root privileges.
* `--cap-drop=ALL`: Revokes all standard Linux kernel privileges.
* `--read-only`: Makes the root filesystem immutable to prevent unauthorized software modifications.
* `--memory=8g` & `--cpus=4`: Prevents the local AI from overwhelming system resources.

---

## 5. ⌨️ Essential VS Code Shortcuts for Continue

| Windows / Linux | macOS | Function |
| :--- | :--- | :--- |
| `Ctrl + L` | `Cmd + L` | Open Continue Chat with selected code |
| `Ctrl + I` | `Cmd + I` | Inline quick edit / prompt directly in editor |
| `Ctrl + Shift + L` | `Cmd + Shift + L` | Add selected code snippet to chat context |
| `Alt + Enter` | `Option + Enter` | Accept suggested tab autocomplete |

---

## 6. 💡 Ollama CLI Cheat Sheet

Manage your local models easily using terminal commands:

```bash
# View all installed models on your computer
ollama list

# See which model is actively loaded in RAM/VRAM
ollama ps

# Stop a running model to free up system RAM
ollama stop qwen2.5-coder:7b

# Download a model without running it immediately
ollama pull nemotron-3.5-lightning

# Remove a model to free up hard disk space
ollama rm qwen2.5-coder:7b
```

---

## ❓ Frequently Asked Questions (FAQ)

### 1. Can non-technical users use this guide?
Yes! Anyone can download Ollama, run `ollama run llama3.2` in their command prompt, and immediately start chatting privately with an AI assistant without writing any code.

### 2. Is running open-source models like DeepSeek or Nemotron safe locally?
Yes. When executed locally through Ollama, the model files consist purely of mathematical weights. They run within an isolated local execution environment and cannot run arbitrary malicious code or transmit your files externally.

### 3. What if my computer has no dedicated graphics card (GPU)?
Ollama will automatically run on your system CPU and RAM. While slightly slower than a dedicated GPU, standard CPU execution works great for 1.5B, 3B, and 7B models.

---

## 🔗 Useful Reference & Download Links

* 🦙 **Ollama Official Website**: [ollama.com](https://ollama.com)
* 📦 **Ollama Model Library**: [ollama.com/library](https://ollama.com/library)
* 🧩 **Continue Extension Marketplace**: [marketplace.visualstudio.com/items?itemName=Continue.continue](https://marketplace.visualstudio.com/items?itemName=Continue.continue)
* 🟢 **NVIDIA Nemotron Models**: [ollama.com/library/nemotron-3.5-lightning](https://ollama.com/library/nemotron-3.5-lightning)
* 🐳 **Ollama Docker Hub Image**: [hub.docker.com/r/ollama/ollama](https://hub.docker.com/r/ollama/ollama)
* 📹 **Security & Privacy Network Audit Inspiration**: *NetworkChuck - "Is DeepSeek Safe To Run (locally)"*
* **Other**: [https://lmstudio.ai/](https://lmstudio.ai/)  

---

⭐ **Enjoy and secure ur @$$ with private, and powerful offline AI assistant!**
