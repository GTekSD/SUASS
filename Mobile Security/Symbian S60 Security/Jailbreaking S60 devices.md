# Jailbreaking Symbian S60 Devices

> **Note:** If you have **Nokia Belle Feature Pack 2**, such as on the [Nokia 808 PureView](https://en.wikipedia.org/wiki/Nokia_808_PureView), go to [its dedicated page](https://example.com/Jailbreaking_Nokia_Belle_FP2_devices).

---

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

## Have Fun!

If you need help, visit the [Talk page](https://example.com/Talk:Jailbreaking_S60_devices) or join us on [Discord](https://example.com/Main_Page#Discord_server).

Once finished, set your phone's date back to today.  
**Tip:** Disable patches in ROMPatcher+ before playing [N-Gage 2.0](https://en.wikipedia.org/wiki/N-Gage_(service)) games.

---

> _Originally compiled by community contributors. Educational purposes only._

