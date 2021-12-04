TITLE NYA Take Back Resources 
cls
@echo off
if _%1_==_payload_  goto :payload

:getadmin
    echo %~nx0: Asking for Admin permission from main frame.
    set vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
goto :eof

:payload

::Kodu buraya yaz::
net.exe stop superfetch
sc config sysmain start=disabled
FOR /D %%p IN ("C:\Users\%username%\AppData\Local\Temp\*") DO rmdir "%%p" /s /q
del C:\Users\%username%\AppData\Local\Temp /S /Q /F
del C:\Users\%username%\AppData\Local\Temp /S /Q /A:H
FOR /D %%p IN ("C:\Users\%username%\AppData\Local\Temp\*") DO rmdir "%%p" /s /q
del C:\Temp /S /Q /F
del C:\Temp /S /Q /A:H
FOR /D %%p IN ("C:\Temp\*") DO rmdir "%%p" /s /q
del C:\Windows\Temp /S /Q /F
del C:\Windows\Temp /S /Q /A:H
rd /s /q %systemdrive%\$RECYCLE.BIN
FOR /D %%p IN ("C:\Windows\Logs") DO rmdir "%%p" /s /q
del C:\Windows\Logs /S /Q /F
del C:\Windows\Logs /S /Q /A:H
FOR /D %%p IN ("C:\Windows\Prefetch") DO rmdir "%%p" /s /q
del C:\Windows\Prefetch /S /Q /F
del C:\Windows\Prefetch /S /Q /A:H
FOR /D %%p IN ("C:\Windows\debug") DO rmdir "%%p" /s /q
del C:\Windows\debug /S /Q /F
del C:\Windows\debug /S /Q /A:H
del /s /f /q /a:h %userprofile%\Recent\*.*
DISM /Online /Cleanup-Image /RestoreHealth
schtasks /delete /tn * /f
sc stop “SysMain”
sc config “SysMain” start=disabled
ipconfig /flushdns
::Kodun sonu::
