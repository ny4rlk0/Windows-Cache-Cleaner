TITLE Partly Restore Hijacked System
cls
@echo off
echo This will not work if you did not removed virus and thing that autostarts it!
echo This computer needs to be connected to internet so this batch file repairs the Windows!
echo It will download required files from Microsoft's server!
echo Ny4rlk0 https://github.com/ny4rlk0/Windows-Cache-Cleaner/
echo "                                                       "
pause
if _%1_==_payload_  goto :payload

:getadmin
    echo %~nx0: Asking for Admin permission from main frame. ~ny4rlk0
    set vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
goto :eof

:payload

::Kodu buraya yaz::
powershell "gwmi win32_process | select CommandLine | select-string -pattern ".exe" > "%HOMEDRIVE%\users\%username%\Desktop\ProccessDump.txt"
ipconfig /displaydns >> %HOMEDRIVE%\users\%username%\Desktop\DNSDump.txt
RD /S /Q "%WinDir%\System32\GroupPolicy"
RD /S /Q "%WinDir%\System32\GroupPolicyUsers"
gpupdate /force
sc config "SysMain" start=auto
sc config "UsoSvc" start=auto
sc config "wuauserv" start=auto
sc config "WaasMedicSvc" start=auto
sc config "mpssvc" start=auto
sc config "SecurityHealthService" start=auto
sc config "DoSvc" start=auto
sc config "SgrmBroker" start=auto
sc config "uhssvc" start=auto
sc config "InstallService" start=auto
sc config "WinDefend" start=auto
sc config "WdNisSvc" start=auto
sc config "WlanSvc" start=auto
sc config "wscsvc" start=auto
netsh interface tcp set global autotuninglevel=highlyrestricted
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PolicyAgent" /v "AssumeUDPEncapsulationContextOnSendRule" REG_DWORD /d 2 /f
ipconfig /flushdns
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\WaasMedicSvc" /v Start /f /t REG_DWORD /d 2
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /f /t REG_DWORD /d 2
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc" /v Start /f /t REG_DWORD /d 2
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\DisableAntiSpyware" /v Start /f /t REG_DWORD /d 0
sc start "UsoSvc"
sc start "wuauserv"
sc start "WaasMedicSvc"
sc start "SysMain"
sc start "mpssvc"
sc start "DoSvc"
sc start "SgrmBroker"
sc start "uhssvc"
sc start "InstallService"
sc start "WinDefend"
sc start "WdNisSvc"
sc start "WdNisSvc"
sc start "wscsvc"
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /RestoreHealth
powershell "Set-ExecutionPolicy Unrestricted"
powershell "Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register """$($_.InstallLocation)\AppXManifest.xml"""}"
powershell "Set-ExecutionPolicy restricted"
shutdown -r -t 0
::Kodu buraya yaz::
