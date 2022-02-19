sc stop "SysMain"
sc config "SysMain" start=disabled
netsh interface tcp set global autotuninglevel=highlyrestricted
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PolicyAgent" /v "AssumeUDPEncapsulationContextOnSendRule" REG_DWORD /d 2 /f
ipconfig /flushdns
sc stop "WaasMedicSvc"
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\WaasMedicSvc /v Start /f /t REG_DWORD /d 4
sc stop "wuauserv"
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\wuauserv /v Start /f /t REG_DWORD /d 4
sc stop "UsoSvc"
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc /v Start /f /t REG_DWORD /d 4
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\DisableAntiSpyware /v Start /f /t REG_DWORD /d 1
echo "Restart is required!"
