<div align="center">

# 🦊 Maivina Cleaner & Dynamic Launcher

*A portable, automated Windows maintenance utility paired with a dynamic shortcut launcher.*

![Platform](https://img.shields.io/badge/Platform-Windows-0078D6?logo=windows&logoColor=white)
![Built With](https://img.shields.io/badge/Built%20With-Windows%20Batch-4D4D4D)
![Cleaner](https://img.shields.io/badge/System-Cleaner-00A86B)
![Maintenance](https://img.shields.io/badge/Utility-Maintenance-blue)
![Cache](https://img.shields.io/badge/Cleans-Cache-orange)
<br>
![Network](https://img.shields.io/badge/Resets-Network-cyan)
![Admin](https://img.shields.io/badge/Privileges-Administrator-red)
![Portable](https://img.shields.io/badge/Installation-None-success)
![Offline](https://img.shields.io/badge/Internet-Not%20Required-success)
![Version](https://img.shields.io/badge/Version-v1.0-blue)

</div>

---

## 📑 Table of Contents

* [📸 Interface Preview](#-interface-preview)
* [📖 Overview](#-overview)
* [🚀 Key Features](#-key-features)
* [📁 Repository Structure](#-repository-structure)
* [🛠️ Installation & Usage](#️-installation--usage)
* [🧠 Under the Hood](#-under-the-hood)
* [📄 License](#-license)

---

## 📸 Interface Preview

<div align="center">

[![Maivina Cleaner Interface](Screenshot.jpg)](Screenshot.jpg)
<br>
*(Maivina Cleaner v1.0 Main Terminal)*

</div>

---

## 📖 Overview

Windows shortcut files (`.lnk`) natively struggle with relative paths, often breaking when a tool is moved between folders or drives. This project provides a robust solution: a lightweight launcher that automatically detects its physical directory, rewrites the target shortcut's internal paths dynamically, and launches the main utility—all within a fraction of a second.

Paired with the launcher is **Maivina Cleaner v1.0**, a highly aggressive system cleanup script designed to sweep temporary caches, flush DNS, and remove leftover crash dumps.

---

## 🚀 Key Features

* ⚡ **Dynamic Path Resolution:** Automatically detects the current physical directory and updates the target shortcut's `TargetPath` and `WorkingDirectory` using COM objects.
* 🎵 **Asynchronous Audio Engine:** Utilizes PowerShell background runspaces to trigger a custom console beep (800Hz) upon launch without freezing the script execution or blocking the UI.
* 🧹 **Deep System Cleanup:** 
    * Clears Windows Temp, User Temp, and AppData caches.
    * Sweeps leftover Prefetch files, Crash Dumps, and Windows Error Reports.
    * Clears User Cache (Cookies, History, IE/Edge Legacy, Office, Teams).
    * Resets Network Cache, flushes DNS, and clears ARP/NetBIOS cache.
    * Wipes Windows Event Logs and old driver folders.
* 🛡️ **Built-in Admin Verification:** Automatically checks for necessary Administrator privileges before executing system-level commands.

---

## 📁 Repository Structure

For the launcher to function correctly, the core file structure must be maintained exactly as shown below:

```text
Maivina-Cleaner/
├── dynamic_path_&_lunch.bat
├── maivina_cleaner.bat
├── fox.bat.lnk
└── README.md
