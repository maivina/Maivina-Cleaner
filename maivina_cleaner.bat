@echo off
chcp 65001 >nul
title Maivina Cleaner v1.0
:: ================= ADMIN CHECK =================
cls
echo.
echo   Checking administrator privileges...
timeout /t 1 >nul

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo   ╔══════════════════════════════════╗
    echo   ║   ERROR: Run as Administrator.   ║
    echo   ╚══════════════════════════════════╝
    echo.
    pause
    exit /b
) 
:: ================= MENU =================
:menu
cls
echo                                                       ⠀⠀⠀     ⣀⡀
echo  (1) Clean Temp and System Cache                     ⠀⠀⠀⠀     ⣿⠙⣦⠀⠀⠀⠀⠀⠀⣀⣤⡶⠛⠁⠳
echo                                                       ⠀⠀⠀     ⢻⠀⠈⠳⠀⠀⣀⣴⡾⠛⠁⣠⠂⢠⠇
echo  (2) Sweep Leftover Files ^& Crash Dumps                 ⠀⠀⠀ ⠀ ⠈⢀⣀⠤⢤⡶⠟⠁⢀⣴⣟⠀⠀⣾
echo                                                           ⠀⠀⠀⠠⠞⠉⢁⠀⠉⠀⢀⣠⣾⣿⣏⠀⢠⡇
echo  (3) Clear User Cache                       ⠀               ⡰⠋⠀⢰⠃⠀⠀⠉⠛⠿⠿⠏⠁⠀⣸⠁
echo                                                           ⠀⣄⠀⠀⠏⣤⣤⣀⡀⠀⠀⠀⠀⠀⠾⢯⠁
echo  (4) Reset Network Cache and Flush DNS                  ⠀⠀ ⣻⠃⠀⣰⡿⠛⠁⠀⠀⠀⢤⣀⡀⠀⠺⢧
echo                                                           ⡠⠋⡤⠠⠋⠀⠀⢀⠐⠁⠀⠈⣙⢯⡃⠀⢈⡻⣦
echo  (5) Clear Windows Event Logs                            ⢰⣷⠇⠀⠀⠀⢀⡠⠃⠀⠀⠀⠀⠈⠻⢯⡄⠀⢻⣿⣷
echo                                                           ⠉⠲⣶⣶⢾⣉⣐⡚⠋⠀⠀⠀⠀⠀⠘⠀⠀⡎⣿⣿⡇
echo  (6) Run Windows Disk Cleanup                ⠀⠀⠀⠀          ⠀  ⣸⣿⣿⣿⣷⡄⠀⠀⢠⣿⣴⠀⠀⣿⣿⣿⣧
echo                                                             ⢀⣴⣿⣿⣿⣿⣿⠇⠀⢠⠟⣿⠏⢀⣾⠟⢸⣿⡇
echo  (7) RUN ALL CLEAN (1 to 6)                                ⢠⣿⣿⣿⣿⠟⠘⠁⢠⠜⢉⣐⡥⠞⠋⢁⣴⣿⣿⠃
echo                                                            ⣾⢻⣿⣿⠃⠀⠀⡀⢀⡄⠁⠀⠀⢠⡾⠁
echo  (X) Exit                      ⠀⠀                          ⠃⢸⣿⡇⠀⢠⣾⡇⢸⡇⠀⠀⠀⡞
echo                                                         ⠀⠀ ⠀⠈⢿⡇⡰⠋⠈⠙⠂⠙⠢⠁⠁
echo                                                               ⠈
set /p "choice= maivina cleaner ツ > "   

if /i "%choice%"=="1" goto clean
if /i "%choice%"=="2" goto sweep
if /i "%choice%"=="3" goto cache
if /i "%choice%"=="4" goto network
if /i "%choice%"=="5" goto logs
if /i "%choice%"=="6" goto driver
if /i "%choice%"=="7" goto all
if /i "%choice%"=="X" exit
if /i "%choice%"=="x" exit

:: Clear the choice variable and loop back
set "choice="
goto menu

:: ================= HEADER FUNCTION =================
:header
echo.
echo  ════════════════════════════════════════
echo   %~1
echo  ════════════════════════════════════════
goto :eof

:: ================= DONE FUNCTION =================
:done
echo.
echo  Done. Press any key to return to menu.
pause >nul
set "choice="
goto menu

:: ================= 1 CLEAN =================
:clean
call :header "1 - CLEAN TEMP AND SYSTEM CACHE"
echo.
echo  Cleaning Windows Temp...
del /f /s /q "%WinDir%\Temp\*" 2>nul
for /d %%x in ("%WinDir%\Temp\*") do rd /s /q "%%x" 2>nul
echo  Windows Temp cleaned.

echo  Cleaning User Temp...
del /f /s /q "%Temp%\*" 2>nul
for /d %%x in ("%Temp%\*") do rd /s /q "%%x" 2>nul
echo  User Temp cleaned.

echo  Cleaning AppData Temp...
del /f /s /q "%AppData%\Temp\*" 2>nul
for /d %%x in ("%AppData%\Temp\*") do rd /s /q "%%x" 2>nul
echo  AppData Temp cleaned.

echo  Cleaning LocalLow Temp...
del /f /s /q "%HomePath%\AppData\LocalLow\Temp\*" 2>nul
for /d %%x in ("%HomePath%\AppData\LocalLow\Temp\*") do rd /s /q "%%x" 2>nul
echo  LocalLow Temp cleaned.

echo  Cleaning Windows Update Cache...
net stop wuauserv >nul 2>&1
echo  Windows Update service stopped.
rd /s /q "%WinDir%\SoftwareDistribution" >nul 2>&1
echo  SoftwareDistribution folder removed.
net start wuauserv >nul 2>&1
echo  Windows Update service started.

echo  Cleaning Thumbnail Cache...
del /f /s /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" 2>nul
echo  Thumbnail cache cleaned.

echo  Cleaning Recycle Bin...
rd /s /q "%SystemDrive%\$Recycle.bin" 2>nul
echo  Recycle Bin cleaned.

goto done

:: ================= 2 SWEEP =================
:sweep
call :header "2 - SWEEP LEFTOVERS AND CRASH DUMPS"
echo.
echo  Sweeping Prefetch...
del /f /s /q "%WinDir%\Prefetch\*" 2>nul
for /d %%x in ("%WinDir%\Prefetch\*") do rd /s /q "%%x" 2>nul
echo  Prefetch cleaned.

echo  Sweeping Minidumps...
del /f /s /q "%WinDir%\Minidump\*" 2>nul
for /d %%x in ("%WinDir%\Minidump\*") do rd /s /q "%%x" 2>nul
echo  Minidumps cleaned.

echo  Sweeping Memory Dump...
del /f /q "%WinDir%\MEMORY.DMP" 2>nul
echo  Memory dump cleaned.

echo  Sweeping Windows Error Reports...
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\ReportQueue\*" 2>nul
del /f /s /q "%UserProfile%\AppData\Local\Microsoft\Windows\WER\ReportQueue\*" 2>nul
rd /s /q "%ProgramData%\Microsoft\Windows\WER\ReportArchive" 2>nul
md "%ProgramData%\Microsoft\Windows\WER\ReportArchive" 2>nul
echo  Windows Error Reports cleaned.

echo  Sweeping DirectX Shader Cache...
del /f /s /q "%UserProfile%\AppData\Local\D3DSCache\*" 2>nul
del /f /s /q "%LocalAppData%\AMD\DxCache\*" 2>nul
del /f /s /q "%LocalAppData%\NVIDIA\GLCache\*" 2>nul
del /f /s /q "%LocalAppData%\NVIDIA\ComputeCache\*" 2>nul
echo  DirectX shader cache cleaned.

goto done

:: ================= 3 CACHE =================
:cache
call :header "3 - CLEAR USER CACHE"
echo.
echo  Clearing IE / Edge Legacy Cache...
del /f /s /q "%UserProfile%\AppData\Local\Microsoft\Windows\INetCache\*" 2>nul
for /d %%x in ("%UserProfile%\AppData\Local\Microsoft\Windows\INetCache\*") do rd /s /q "%%x" 2>nul
echo  IE/Edge cache cleared.

echo  Clearing Cookies...
del /f /s /q "%UserProfile%\AppData\Local\Microsoft\Windows\INetCookies\*" 2>nul
echo  Cookies cleared.

echo  Clearing History...
del /f /s /q "%UserProfile%\AppData\Local\Microsoft\Windows\History\*" 2>nul
echo  History cleared.

echo  Clearing URL Cache...
certutil -URLCache * delete 2>nul
echo  URL cache cleared.

echo  Clearing Teams Cache...
del /f /s /q "%UserProfile%\AppData\Roaming\Microsoft\Teams\Cache\*" 2>nul
del /f /s /q "%UserProfile%\AppData\Roaming\Microsoft\Teams\blob_storage\*" 2>nul
del /f /s /q "%UserProfile%\AppData\Roaming\Microsoft\Teams\databases\*" 2>nul
echo  Teams cache cleared.

echo  Clearing Office Cache...
del /f /s /q "%UserProfile%\AppData\Local\Microsoft\Office\16.0\OfficeFileCache\*" 2>nul
del /f /s /q "%UserProfile%\AppData\Local\Microsoft\Office\16.0\Caches\*" 2>nul
echo  Office cache cleared.

echo  Clearing Icon Cache...
del /f /q "%UserProfile%\AppData\Local\IconCache.db" 2>nul
del /f /s /q "%UserProfile%\AppData\Local\Microsoft\Windows\Explorer\iconcache_*.db" 2>nul
echo  Icon cache cleared.

goto done

:: ================= 4 NETWORK =================
:network
call :header "4 - RESET NETWORK CACHE AND FLUSH DNS"
echo.
echo  Flushing DNS...
ipconfig /flushdns
echo  DNS flushed.

echo  Clearing ARP Cache...
arp -d * >nul 2>&1
echo  ARP cache cleared.

echo  Clearing NetBIOS cache...
nbtstat -R 2>nul
echo  NetBIOS cache cleared.

echo  Flushing BranchCache...
netsh branchcache flush 2>nul
echo  BranchCache flushed.

goto done

:: ================= 5 LOGS =================
:logs
call :header "5 - CLEAR WINDOWS EVENT LOGS"
echo.
echo  Clearing all event logs...
for /f "tokens=*" %%G in ('wevtutil el 2^>nul') do (
    wevtutil cl "%%G" 2>nul
    echo  Cleared: %%G
)
echo  All event logs cleared.

echo  Clearing CBS Logs...
del /f /q "%WinDir%\Logs\CBS\*.log" 2>nul
echo  CBS logs cleared.

echo  Clearing DISM Logs...
del /f /q "%WinDir%\Logs\DISM\*.log" 2>nul
echo  DISM logs cleared.

echo  Clearing System Logs...
del /f /q "%SystemDrive%\*.log" 2>nul
echo  System logs cleared.

goto done

:: ================= 6 DRIVER & OLD FILES =================
:driver
call :header "6 - CLEAN DRIVER AND OLD FILES"
echo.
echo  Cleaning Old Driver Files...
rd /s /q "%SystemDrive%\AMD" 2>nul
echo  AMD driver folders removed.
rd /s /q "%SystemDrive%\NVIDIA" 2>nul
echo  NVIDIA driver folders removed.
rd /s /q "%SystemDrive%\INTEL" 2>nul
echo  INTEL driver folders removed.

echo  Cleaning Miscellaneous Files...
del /f /s /q "%SystemDrive%\*.log" 2>nul
echo  Log files removed.
del /f /s /q "%SystemDrive%\*.tmp" 2>nul
echo  Temp files removed.
del /f /s /q "%SystemDrive%\*.old" 2>nul
echo  Old files removed.
del /f /s /q "%SystemDrive%\*.bak" 2>nul
echo  Backup files removed.
del /f /s /q "%SystemDrive%\*.dmp" 2>nul
echo  Dump files removed.

echo  Cleaning Windows Old Folder...
rd /s /q "%SystemDrive%\Windows.old" 2>nul
echo  Windows.old folder removed.

echo  Cleaning Temp Folders Completely...
rd /s /q "%WinDir%\Temp" 2>nul
rd /s /q "%WinDir%\Prefetch" 2>nul
rd /s /q "%Temp%" 2>nul
rd /s /q "%AppData%\Temp" 2>nul
rd /s /q "%HomePath%\AppData\LocalLow\Temp" 2>nul
echo  All temp folders removed.

echo  Recreating Temp Folders...
md "%WinDir%\Temp" 2>nul
md "%WinDir%\Prefetch" 2>nul
md "%Temp%" 2>nul
md "%AppData%\Temp" 2>nul
md "%HomePath%\AppData\LocalLow\Temp" 2>nul
echo  Temp folders recreated.

goto done

:: ================= 7 RUN ALL =================
:all
cls
echo.
echo  ╔══════════════════════════════════════════════════════════════════════════════╗
echo  ║                  RUNNING FULL CLEAN SEQUENCE  (1 to 6)                       ║
echo  ╚══════════════════════════════════════════════════════════════════════════════╝

echo.
echo  [STEP 1/6] Temp and System Cache...
echo  Cleaning Windows Temp...
del /f /s /q "%WinDir%\Temp\*" 2>nul
for /d %%x in ("%WinDir%\Temp\*") do rd /s /q "%%x" 2>nul
echo  Windows Temp cleaned.
echo  Cleaning User Temp...
del /f /s /q "%Temp%\*" 2>nul
for /d %%x in ("%Temp%\*") do rd /s /q "%%x" 2>nul
echo  User Temp cleaned.
echo  Cleaning AppData Temp...
del /f /s /q "%AppData%\Temp\*" 2>nul
for /d %%x in ("%AppData%\Temp\*") do rd /s /q "%%x" 2>nul
echo  AppData Temp cleaned.
echo  Cleaning LocalLow Temp...
del /f /s /q "%HomePath%\AppData\LocalLow\Temp\*" 2>nul
for /d %%x in ("%HomePath%\AppData\LocalLow\Temp\*") do rd /s /q "%%x" 2>nul
echo  LocalLow Temp cleaned.
echo  Stopping Windows Update service...
net stop wuauserv >nul 2>&1
echo  Windows Update service stopped.
echo  Removing SoftwareDistribution folder...
rd /s /q "%WinDir%\SoftwareDistribution" >nul 2>&1
echo  SoftwareDistribution folder removed.
echo  Starting Windows Update service...
net start wuauserv >nul 2>&1
echo  Windows Update service started.
echo  Cleaning Thumbnail Cache...
del /f /s /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" 2>nul
echo  Thumbnail cache cleaned.
echo  Cleaning Recycle Bin...
rd /s /q "%SystemDrive%\$Recycle.bin" 2>nul
echo  Recycle Bin cleaned.
echo  Step 1 completed.

echo.
echo  [STEP 2/6] Leftovers and Crash Dumps...
echo  Sweeping Prefetch...
del /f /s /q "%WinDir%\Prefetch\*" 2>nul
echo  Prefetch cleaned.
echo  Sweeping Minidumps...
del /f /s /q "%WinDir%\Minidump\*" 2>nul
echo  Minidumps cleaned.
echo  Sweeping Memory Dump...
del /f /q "%WinDir%\MEMORY.DMP" 2>nul
echo  Memory dump cleaned.
echo  Sweeping Windows Error Reports...
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\ReportQueue\*" 2>nul
del /f /s /q "%UserProfile%\AppData\Local\Microsoft\Windows\WER\ReportQueue\*" 2>nul
echo  Windows Error Reports cleaned.
echo  Sweeping DirectX Shader Cache...
del /f /s /q "%UserProfile%\AppData\Local\D3DSCache\*" 2>nul
del /f /s /q "%LocalAppData%\AMD\DxCache\*" 2>nul
del /f /s /q "%LocalAppData%\NVIDIA\GLCache\*" 2>nul
echo  DirectX shader cache cleaned.
echo  Step 2 completed.

echo.
echo  [STEP 3/6] User Cache...
echo  Clearing IE/Edge Cache...
del /f /s /q "%UserProfile%\AppData\Local\Microsoft\Windows\INetCache\*" 2>nul
for /d %%x in ("%UserProfile%\AppData\Local\Microsoft\Windows\INetCache\*") do rd /s /q "%%x" 2>nul
echo  IE/Edge cache cleared.
echo  Clearing Cookies...
del /f /s /q "%UserProfile%\AppData\Local\Microsoft\Windows\INetCookies\*" 2>nul
echo  Cookies cleared.
echo  Clearing History...
del /f /s /q "%UserProfile%\AppData\Local\Microsoft\Windows\History\*" 2>nul
echo  History cleared.
echo  Clearing URL Cache...
certutil -URLCache * delete 2>nul
echo  URL cache cleared.
echo  Clearing Teams Cache...
del /f /s /q "%UserProfile%\AppData\Roaming\Microsoft\Teams\Cache\*" 2>nul
echo  Teams cache cleared.
echo  Clearing Office Cache...
del /f /s /q "%UserProfile%\AppData\Local\Microsoft\Office\16.0\OfficeFileCache\*" 2>nul
echo  Office cache cleared.
echo  Clearing Icon Cache...
del /f /q "%UserProfile%\AppData\Local\IconCache.db" 2>nul
echo  Icon cache cleared.
echo  Step 3 completed.

echo.
echo  [STEP 4/6] Network Reset and DNS Flush...
ipconfig /flushdns
echo  DNS flushed.
arp -d * >nul 2>&1
echo  ARP cache cleared.
nbtstat -R 2>nul
echo  NetBIOS cache cleared.
netsh branchcache flush 2>nul
echo  BranchCache flushed.
echo  Step 4 completed.

echo.
echo  [STEP 5/6] Event Logs...
echo  Clearing all event logs...
for /f "tokens=*" %%G in ('wevtutil el 2^>nul') do (
    wevtutil cl "%%G" 2>nul
)
echo  Event logs cleared.
echo  Clearing CBS Logs...
del /f /q "%WinDir%\Logs\CBS\*.log" 2>nul
echo  CBS logs cleared.
echo  Clearing DISM Logs...
del /f /q "%WinDir%\Logs\DISM\*.log" 2>nul
echo  DISM logs cleared.
echo  Clearing System Logs...
del /f /q "%SystemDrive%\*.log" 2>nul
echo  System logs cleared.
echo  Step 5 completed.

echo.
echo  [STEP 6/6] Driver and Old Files...
echo  Cleaning Old Driver Files...
rd /s /q "%SystemDrive%\AMD" 2>nul
rd /s /q "%SystemDrive%\NVIDIA" 2>nul
rd /s /q "%SystemDrive%\INTEL" 2>nul
echo  Driver folders cleaned.
echo  Cleaning Miscellaneous Files...
del /f /s /q "%SystemDrive%\*.tmp" 2>nul
del /f /s /q "%SystemDrive%\*.old" 2>nul
del /f /s /q "%SystemDrive%\*.bak" 2>nul
echo  Miscellaneous files cleaned.
echo  Cleaning Windows Old Folder...
rd /s /q "%SystemDrive%\Windows.old" 2>nul
echo  Windows.old removed.
echo  Cleaning Temp Folders...
rd /s /q "%WinDir%\Temp" 2>nul
rd /s /q "%Temp%" 2>nul
echo  Temp folders removed.
echo  Recreating Temp Folders...
md "%WinDir%\Temp" 2>nul
md "%Temp%" 2>nul
echo  Temp folders recreated.
echo  Step 6 completed.

echo.
echo  ╔══════════════════════════════════════════════════════════════════════════════╗
echo  ║                           FULL CLEAN COMPLETE                                ║
echo  ╚══════════════════════════════════════════════════════════════════════════════╝
echo.
echo  A restart is recommended to finalize all changes.
echo.
pause
set "choice="
goto menu