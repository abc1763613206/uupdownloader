@echo off
if exist "%~dp0\files\src\UUPDUMP_translation.ini" del "%~dp0\files\src\UUPDUMP_translation.ini"
if exist "%~dp0UUPDUMP_translation.ini" copy "%~dp0UUPDUMP_translation.ini" "%~dp0\files\src\UUPDUMP_translation.ini"

REG QUERY HKU\S-1-5-19\Environment >NUL 2>&1 
IF %ERRORLEVEL% EQU 0 goto :HAS_ADMIN

set "command="""%~dp0files\src\uupdownloader.ahk""" """%~dp0""""
set "command=%command:'=''%"

set "filePath=%~dp0files\AutoHotkey.exe"
set "filePath=%filePath:'=''%"

powershell Start-Process -FilePath '%filePath%' -ArgumentList '%command%' -Verb RunAs
exit /b

:HAS_ADMIN
start "" "%~dp0files\AutoHotkey.exe" "%~dp0files\src\uupdownloader.ahk" "%~dp0"
exit /b
