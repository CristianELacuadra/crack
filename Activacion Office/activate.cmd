@echo off
net stop osppsvc

takeown /f "%PROGRAMFILES%\Common Files\Microsoft Shared\OFFICE14\Office Setup Controller\pkeyconfig-office.xrm-ms"
icacls "%PROGRAMFILES%\Common Files\Microsoft Shared\OFFICE14\Office Setup Controller\pkeyconfig-office.xrm-ms" /grant administrators:F /t
del /F /Q "%PROGRAMFILES%\Common Files\Microsoft Shared\OFFICE14\Office Setup Controller\pkeyconfig-office.xrm-ms"
copy "%~dp0pkeyconfig-office.xrm-ms" "%PROGRAMFILES%\Common Files\Microsoft Shared\OFFICE14\Office Setup Controller\pkeyconfig-office.xrm-ms"

takeown /f "%PROGRAMDATA%\Microsoft\OfficeSoftwareProtectionPlatform\tokens.dat"
icacls "%PROGRAMDATA%\Microsoft\OfficeSoftwareProtectionPlatform\tokens.dat" /grant administrators:F /t
del /F /Q "%PROGRAMDATA%\Microsoft\OfficeSoftwareProtectionPlatform\tokens.dat"
copy "%~dp0tokens.dat" "%PROGRAMDATA%\Microsoft\OfficeSoftwareProtectionPlatform\tokens.dat"

takeown /f "%PROGRAMDATA%\Microsoft\OfficeSoftwareProtectionPlatform\Cache" /r
icacls "%PROGRAMDATA%\Microsoft\OfficeSoftwareProtectionPlatform\Cache" /grant administrators:F /t
rd /s /Q "%PROGRAMDATA%\Microsoft\OfficeSoftwareProtectionPlatform\Cache"

cscript "%PROGRAMFILES%\Microsoft Office\Office14\ospp.vbs" /inpkey:6QFDX-PYH2G-PPYFD-C7RJM-BBKQ8
cscript "%PROGRAMFILES%\Microsoft Office\Office14\ospp.vbs" /act

cscript “%PROGRAMFILES%\Microsoft Office\Office14\ospp.vbs” / dstatus