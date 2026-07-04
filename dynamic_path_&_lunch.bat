@echo off
chcp 65001 >nul
title Dynamic Path ^& Launch
cls

echo.
echo  ╔══════════════════════════════════════════════╗
echo  ║  Updating Shortcut Paths Dynamically...      ║
echo  ╚══════════════════════════════════════════════╝
echo.

:: Get the current directory of this batch file (removes trailing backslash)
set "BASE_DIR=%~dp0"
set "BASE_DIR=%BASE_DIR:~0,-1%"

:: Define the target paths dynamically based on the current folder
set "LNK_PATH=%BASE_DIR%\fox.bat.lnk"
set "TARGET_BAT=%BASE_DIR%\maivina_cleaner.bat"

:: Check if the target batch file exists before trying to link to it
if not exist "%TARGET_BAT%" (
    echo  ERROR: Target file not found!
    echo  Ensure "%TARGET_BAT%" exists in:
    echo  "%BASE_DIR%"
    pause
    exit /b
)

:: PowerShell handles the binary modification of the .lnk file, 
:: executes an asynchronous beep on a background thread to prevent freezing, 
:: and launches the tool immediately.
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
    "$wshell = New-Object -ComObject WScript.Shell; " ^
    "$shortcut = $wshell.CreateShortcut('%LNK_PATH%'); " ^
    "$shortcut.TargetPath = '%TARGET_BAT%'; " ^
    "$shortcut.WorkingDirectory = '%BASE_DIR%'; " ^
    "$shortcut.Save(); " ^
    "$beepThread = [PowerShell]::Create().AddScript({ [System.Console]::Beep(800, 300) }); " ^
    "$null = $beepThread.BeginInvoke(); " ^
    "Start-Process -FilePath '%LNK_PATH%'"

exit /b