@echo off
setlocal
title Uninstall ms-cmd URI Handler
color 0C

echo [!] Removing registry keys...
reg delete "HKEY_CLASSES_ROOT\ms-cmd" /f >nul 2>&1
if %errorlevel%==0 (
    echo [+] Registry key for ms-cmd removed.
) else (
    echo [!] Registry key may not exist or failed to remove.
)

echo [!] Deleting handler executable...
if exist "C:\mscmd\handler.exe" (
    del /f /q "C:\mscmd\handler.exe"
    echo [+] handler.exe deleted.
) else (
    echo [!] handler.exe not found.
)

echo [!] Attempting to remove directory C:\mscmd...
rd "C:\mscmd" >nul 2>&1
if exist "C:\mscmd" (
    echo [!] Could not delete directory (it may not be empty).
) else (
    echo [+] Directory removed.
)

echo [✓] Uninstall complete.
pause
exit /b
