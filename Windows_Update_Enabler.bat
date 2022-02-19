sc config "SysMain" start=auto
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
echo "Restart is required!"
