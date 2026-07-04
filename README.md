<div align="center">

# Maivina Cleaner

*A portable Windows maintenance utility with an intelligent dynamic launcher.*

![Platform](https://img.shields.io/badge/Platform-Windows-0078D6?logo=windows&logoColor=white)
![Built With](https://img.shields.io/badge/Built%20With-Windows%20Batch-4D4D4D)
![System](https://img.shields.io/badge/System-Cleaner-00A86B)
![Portable](https://img.shields.io/badge/Portable-Yes-success)
![Administrator](https://img.shields.io/badge/Admin-Required-red)
<br>
![Offline](https://img.shields.io/badge/Offline-Yes-success)
![Shell](https://img.shields.io/badge/Shell-CMD-black)
![Status](https://img.shields.io/badge/Status-Stable-brightgreen)
![Version](https://img.shields.io/badge/Version-v1.0-blue)
![License](https://img.shields.io/badge/License-MIT-purple)

</div>

---

## 📑 Table of Contents

- [📸 Interface Preview](#-interface-preview)
- [📖 Overview](#-overview)
- [✨ Features](#-features)
- [📁 Repository Structure](#-repository-structure)
- [🛠️ Installation & Usage](#️-installation--usage)
- [🧠 Under the Hood](#-under-the-hood)
- [⚠️ Warning](#️-warning)
- [📄 License](#-license)

---

# 📸 Interface Preview

<div align="center">

<img width="1001" height="429" alt="Screenshot 2026-07-04 230950" src="https://github.com/user-attachments/assets/d7df40e4-afb6-4a6b-bec4-a83ad387ffdc">

*Maivina Cleaner v1.0 Main Menu*

</div>

---

# 📖 Overview

**Maivina Cleaner** is a portable Windows maintenance utility written primarily in **Windows Batch**.

It provides an interactive console interface for cleaning temporary files, caches, crash dumps, event logs, network caches, and other unnecessary system data that accumulates over time.

The project also includes a **Dynamic Launcher**, which automatically updates shortcut (`.lnk`) paths whenever the project folder is moved. This eliminates broken shortcuts and allows the tool to remain completely portable.

No installation is required—simply extract the folder and run the launcher.

---

# ✨ Features

## 🧹 System Cleaning

- Clean Windows Temp
- Clean User Temp
- Clean AppData Temp
- Remove Thumbnail Cache
- Empty Recycle Bin
- Remove Windows Update Cache

## 📂 Leftover Cleanup

- Prefetch Cleanup
- Crash Dumps
- Windows Error Reports
- Shader Cache
- Driver Leftovers
- Windows.old Removal

## 🌐 Network Maintenance

- Flush DNS
- Clear ARP Cache
- Reset NetBIOS Cache
- Flush BranchCache

## 👤 User Cache Cleanup

- Internet Cache
- Cookies
- History
- URL Cache
- Teams Cache
- Office Cache
- Icon Cache

## 📜 System Maintenance

- Clear Windows Event Logs
- Remove CBS Logs
- Remove DISM Logs
- Remove Temporary Log Files

## 🚀 Dynamic Launcher

- Automatic Path Detection
- Automatic Shortcut Repair
- Dynamic Working Directory
- Portable Folder Support
- Asynchronous Startup Sound

## 🛡️ Safety

- Administrator Privilege Check
- Interactive Menu
- One-Click "Run All" Mode
- Portable Design

---

# 📁 Repository Structure

```text
Maivina-Cleaner/
│
├── dynamic_path_&_lunch.bat
├── maivina_cleaner.bat
├── fox.bat.lnk
├── README.md
└── LICENSE
```

---

# 🛠️ Installation & Usage

## Requirements

- Windows 10 or Windows 11
- Native Windows PowerShell
- Administrator privileges

---

### 1️⃣ Download

Download the latest **Cleaner.7z** package from the **Releases** page.

---

### 2️⃣ Extract

Extract the archive.

Keep these files together:

```text
dynamic_path_&_lunch.bat
maivina_cleaner.bat
fox.bat.lnk
```

---

### 3️⃣ Run

Double-click

```text
dynamic_path_&_lunch.bat
```

---

### 4️⃣ Administrator Permission

If Windows displays a **User Account Control (UAC)** dialog, click **Yes**.

---

### 5️⃣ Clean

Choose the desired maintenance option from the menu.

---

# 🧠 Under the Hood

The launcher combines **Windows Batch** and **PowerShell** to provide a fully portable experience.

### Dynamic Launcher

- Detects its current directory
- Updates `.lnk` TargetPath
- Updates WorkingDirectory
- Launches instantly
- Supports moving the folder anywhere

### Asynchronous Audio

Instead of blocking execution while playing a startup sound, PowerShell creates a background runspace.

```powershell
# Startup notification

$beepThread = [PowerShell]::Create().AddScript({
    [System.Console]::Beep(800,300)
})

$null = $beepThread.BeginInvoke()
```

The launcher continues immediately while the sound plays in the background.

---

# ⚠️ Warning

> [!WARNING]
>
> This utility permanently removes temporary files, caches, crash dumps, logs, and other unnecessary Windows data.
>
> Some operations cannot be undone.
>
> Review each menu option before running it.

---

# 📄 License

This project is licensed under the **MIT License**.

```text
MIT License

Copyright (c) 2026 Maivina

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.

IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
USE OR OTHER DEALINGS IN THE SOFTWARE.
```

---

<div align="center">

**⭐ If you find this project useful, consider giving it a Star! ⭐**

Made with ❤️ using Windows Batch & PowerShell.

</div>
