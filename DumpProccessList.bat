TITLE DumpRunningProccessListAndLocation
cls
echo "Ny4rlk0 https://github.com/ny4rlk0/Windows-Cache-Cleaner/"
echo " "
echo "Press Enter to continue!"
pause
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
powershell "gwmi win32_process | select CommandLine | select-string -pattern ".exe" > C:\users\%username%\Desktop\RunningProccess.txt"
::Kodu buraya yaz::
