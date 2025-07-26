@echo off
setlocal enabledelayedexpansion
title ms-cmd URI Installer
color 0A

echo [+] Downloading registry file...
curl -L -o "%temp%\mscmd.reg" "https://raw.githubusercontent.com/githuber124/cmdregedit/refs/heads/main/mscmd.reg"
if exist "%temp%\mscmd.reg" (
    echo [!] Registry file downloaded successfully.
) else (
    echo [X] Failed to download registry file.
    pause
    exit /b
)

echo [!] Importing registry file...
reg import "%temp%\mscmd.reg"
if %errorlevel%==0 (
    echo [!] Registry imported successfully.
) else (
    echo [X] Failed to import registry.
    pause
    exit /b
)

echo [+] Creating directory and downloading handler executable...
mkdir "C:\mscmd" >nul 2>&1
curl -L -o "C:\mscmd\handler.exe" "https://github.com/githuber124/cmdregedit/raw/refs/heads/main/handler.exe"
if exist "C:\mscmd\handler.exe" (
    echo [!] Handler downloaded successfully.
) else (
    echo [X] Failed to download handler.
    pause
    exit /b
)

echo [!] Testing ms-cmd URI: echo hello world
start "" "ms-cmd:echo hello world"

echo [!] Setup complete.
pause
exit /b
