# Automatic Updates

## Enabling Automatic Updates for Pre-Windows 8 Machines

    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 1 /f 
    sc config wuauserv start= auto
    net start wuauserv
    wuauclt.exe /detectnow

## TODO: Enabling Automatic Updates for Window 8 and Above
