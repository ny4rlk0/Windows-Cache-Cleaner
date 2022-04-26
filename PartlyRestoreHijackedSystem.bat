TITLE GPEDIT.MSC RESET
cls
echo "This will not work if you did not removed virus and thing that autostarts it!"
echo "Ny4rlk0 https://github.com/ny4rlk0/Windows-Cache-Cleaner/"
@echo off
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
sc config "SysMain" start=auto
RD /S /Q "%WinDir%\System32\GroupPolicy"
RD /S /Q "%WinDir%\System32\GroupPolicyUsers"
gpupdate /force
sc config "UsoSvc" start=auto
sc config "wuauserv" start=auto
sc config "WaasMedicSvc" start=auto
netsh interface tcp set global autotuninglevel=highlyrestricted
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PolicyAgent" /v "AssumeUDPEncapsulationContextOnSendRule" REG_DWORD /d 2 /f
ipconfig /flushdns
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\WaasMedicSvc /v Start /f /t REG_DWORD /d 2
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\wuauserv /v Start /f /t REG_DWORD /d 2
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc /v Start /f /t REG_DWORD /d 2
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\DisableAntiSpyware /v Start /f /t REG_DWORD /d 1
sc start "UsoSvc"
sc start "wuauserv"
sc start "WaasMedicSvc"
sc start "SysMain"
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /RestoreHealth
shutdown -r -t 0
::Kodu buraya yaz::
