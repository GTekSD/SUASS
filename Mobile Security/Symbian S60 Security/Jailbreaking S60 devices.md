# Jailbreaking Symbian S60 Devices

This guide will show you how to **jailbreak** or hack your [Symbian S60](https://en.wikipedia.org/wiki/S60_platform) device.

All the files needed are shown throughout the tutorial, but you can also find everything [here on MEGA](https://mega.nz/folder/jH4QAL5J#jUQJTDDSmU-5z_GJBCMJAg).

## About

Jailbreaking allows you to:

- Install **any SIS apps**, even unsigned ones (no certificate errors)
- Access **private system folders**
- Dump [Java ME](https://en.wikipedia.org/wiki/Java_Platform,_Micro_Edition) apps
- Apply **patches** (e.g., silence the camera shutter or remap shortcut keys)

> Jailbreaking is not required for Series 60 1st or 2nd Edition, as they didn’t have platform security.

---

## Tutorial

### Trend Micro Mobile Security Method

#### 1. Allowing unsigned installations (Eseries only)

> **Only for Nokia Eseries devices. If you're not using one, skip this step.**

- Open the App Manager (`Installations` or `Tools` folder)
- Go to `Options → Settings` → Set `Software installation` to `All`

#### 2. Installing X-plore

Download and install [x-plore_s60_3rd_1_64.sisx](https://mega.nz/folder/jH4QAL5J#jUQJTDDSmU-5z_GJBCMJAg/file/TShiDDIb)

> If installation fails, set phone's date to **2022** and try again.

#### 3. Extracting tmquarantine

- Download [tmquarantine.zip](https://mega.nz/folder/jH4QAL5J#jUQJTDDSmU-5z_GJBCMJAg/file/eDok3TiT)
- Send to phone and extract to `C:/` using X-plore

You should now see: `C:/tmquarantine` with 4 files inside.

#### 4. Installing Mobile Security

- Download [Mobile Security.sis](https://mega.nz/folder/jH4QAL5J#jUQJTDDSmU-5z_GJBCMJAg/file/HeoUXLbJ)
- Set phone date to **2012** before installation
- If prompted to reboot, **select No**

#### 5. Restoring the quarantine

- Open **Mobile Security**
- Go to `Options → Quarantine list → Mark all → Options → Restore → Yes`
- Uninstall Mobile Security after this step

#### 6. Installing ROMPatcher+

- Download [RomPatcherPlus_3.1_LiteVersion.sisx](https://mega.nz/folder/jH4QAL5J#jUQJTDDSmU-5z_GJBCMJAg/file/PaxGzJAK)
- Install on your phone

#### 7. Applying patches

- Open **ROMPatcher+**
- Apply:
  - `Install Server RP+`
  - `Open4All RP+`
- Go to `Options → Add to Auto` for both

> If `Install Server RP+` shows a red cross:
> - Download [installserver.exe for Symbian 9.1](https://mega.nz/folder/jH4QAL5J#jUQJTDDSmU-5z_GJBCMJAg/file/3HwgCJpS) or [Symbian 9.2](https://mega.nz/file/n81CmIrQ#b5YFGAxxxFmhPohXiungAadTE1SF4Jx-JnOsAc0hxKM)
> - Copy to `C:/sys/bin` via X-plore (enable Open4All first)
> - You **do not** need to apply the Install Server patch in that case

---

> ⚠️ **Note:** This method works **only on Nokia phones**. If you're using LG, Samsung, or Sony Ericsson, it will fail with an "Unsupported Device" error. Use the alternate Symantec method below.

---

### Alternate Method: Symantec Symbian Hack

- Works on all **Symbian S60 (3rd Ed+)**, including non-Nokia phones
- Insert a **SIM card** in phone (or Norton will complain)
- Install X-plore
- Download [NortonHackLDD.zip](https://mega.nz/folder/jH4QAL5J#jUQJTDDSmU-5z_GJBCMJAg/file/eX4EQQSY)
- Extract and install `NortonSymbianHackLDD.sis`
- Open Norton → `AntiVirus → Quarantine list → Restore all → Yes`
- Uninstall Norton
- Delete `C:\shared\`, set phone date to **2012**
- Follow steps 6 & 7 from the previous method (ROMPatcher+)

> You can remove the SIM card after jailbreaking.

---

### Alternate Method: CProfDriver_SISX.ldd Hack (No SIM required)

- Works on almost all **Symbian S60 (3rd Ed+)** phones
- If Norton or Trend Micro method fails or both patches show red crosses in ROMPatcher+

#### Steps:

1. Download the full package: [.sis program package](https://phoneky.com/applications/?s=download&id=y0y15175)
2. Set date to **05/11/2007**
3. Install `drakkariou_iw6pb2qz.sis` → choose OS version
4. Launch **X-plore**, press `0` or go to `Tools → Configuration`, check first 4 boxes
5. Minimize X-plore, open **HelloCarbide** → `Options → Menu1 → Yes`
6. Back in X-plore, extract `installserver.exe` and `CProfDriver_SISX.ldd` from `Hack.zip` to `C:/sys/bin`
7. Restart phone

- Use **CapsOff** to see hidden folders
- Use **CapsOn** to hide them again
- Set date back and try installing unsigned apps

---

# Symbian^3 Research and Development
---

## 🛡️ Security & Hacking Perspectives

### 🔐 1. **Certificate System Exploits**

* Symbian relies on **Symbian Signed** certificates for app validation.
* The **main hack vector** is bypassing this by:

  * Installing a **custom installserver.exe**
  * Exploiting **antivirus quarantines** (unsafe restore paths)
  * Overwriting `swicertstore.dat` to trust fake root CAs

> ❗ Teaching point: Even an old system like Symbian had a strong PKI-based app signing model — it’s a good study for understanding mobile security models.

---

### 🧬 2. **System Partition Access via Antivirus Quarantine**

* Files in quarantine were typically moved to `C:/tmquarantine`, `C:/shared/`, etc.
* These quarantine paths **bypassed Symbian Platform Security (PlatSec)**.
* This was exploited to place LDD drivers and installserver binaries in `C:/sys/bin/`.

> ✅ A clever attack chain example:
> Untrusted app → Antivirus → Restore LDD to `sys/bin` → Kernel-level patch applied.

---

### 📁 3. **File System Hierarchy of Symbian^3**

Understand important directories:

| Path           | Purpose                           |
| -------------- | --------------------------------- |
| `C:/sys/bin/`  | Kernel-level binaries, drivers    |
| `C:/private/`  | App sandboxed data                |
| `C:/resource/` | Certificates, UI resources        |
| `E:/`          | User-accessible storage (microSD) |
| `Z:/`          | ROM (read-only), core OS files    |

> 🔐 **Security insight**: Symbian enforced **capabilities** (e.g., AllFiles, DiskAdmin).
> A hacked device bypasses these restrictions — **any app can access everything**.

---

### 🦠 4. **Malware Risks in Java ME (J2ME) Apps**

* Many `.jar` games and apps send **premium-rate SMS** silently.
* These are hard to detect without analyzing the `.jar` or using a proxy to monitor SMS traffic.

> 📌 Tip: Decompile suspicious `.jar` using `JD-GUI`, `CFR`, or `jadx`.

---

### ⚠️ 5. **Risks of Persistent Modding**

* Modifying system files (e.g., `installserver.exe`, `swicertstore.dat`) can:

  * Cause bootloops
  * Break app installations
  * Lead to inability to reset the phone normally

> ✅ Tip: Keep a backup of the working state and always have a reset combo (3-finger or JAF box if possible)

---

### 🧠 6. **Useful SysMods & Patches for ROMPatcher+**

| Patch               | Use                                                           |
| ------------------- | ------------------------------------------------------------- |
| `InstallServer RP+` | Install unsigned apps                                         |
| `Open4All RP+`      | Access all file system areas                                  |
| `NoBatteryWarning`  | Removes low battery popups                                    |
| `C2Z`               | Redirects `Z:/` calls to `C:/`, allowing modding of ROM files |
| `DisableCPC`        | Stops capability checks by apps                               |
| `Auto Rotate`       | Forces auto screen rotation                                   |
| `Disable Logs`      | Disables call/SMS logs for privacy (e.g., burner usage)       |

> 📌 Some patches may require custom `.ldd` drivers. Always match with firmware version.

---

### 🛠️ 7. **Tools You Should Know**

| Tool                  | Purpose                                                 |
| --------------------- | ------------------------------------------------------- |
| **ROMPatcher+**       | Kernel-level patch loader                               |
| **HelloCarbide**      | Memory patch tool (used for privilege escalation)       |
| **SafeManager**       | Secure file manager that can bypass system restrictions |
| **X-plore**           | Advanced file manager with system access                |
| **SISContents (PC)**  | Extract/edit `.sis/.sisx` installers, re-sign apps      |
| **SISEditor (phone)** | Sign apps with custom certs directly on device          |

> ✅ Tip: Use SISContents to insert `installserver.exe` into legit-looking installers (like games) for stealthy mods.

---

## 🎨 Modding & Personalization

### 🖼️ 1. **UI Skinning via MIF Editing**

* `.mif` files are vector-based image containers
* You can theme your phone by editing icons, menus, transitions
* Tools: `mifconv`, `SVG-to-MIF`, Hex editors

### 🎨 2. **Fonts Mod**

* Drop custom font files into `C:/resource/fonts/`
* Use `.ttf` fonts like Roboto, Ubuntu, or even Comic Sans (if you're brave)

> ⚠️ **Warning**: Bad fonts can cause a bootloop. Keep a backup font in `E:/fonts/` to recover if needed.

---

### 🎵 3. **Startup/Shutdown Custom Sounds**

* Replace files in:

  * `Z:/data/sounds/startup.mp3`
  * `Z:/data/sounds/shutdown.mp3`
* Use `C2Z` patch or move to `C:/data/...` and override with custom patch

---

## 💡 Hidden Features & Tips

* **USB OTG support** on some models (like Nokia N8)
* You can **launch `.sisx` files via file managers** from SD card
* Boot into Safe Mode: hold `Menu` during power-on
* `*#92702689#` → view total usage time (good for verifying used phones)
