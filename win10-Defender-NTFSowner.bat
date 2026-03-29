@echo on

takeown /A /R /D y /F "C:\ProgramData\Microsoft\Windows Defender"

icacls "C:\ProgramData\Microsoft\Windows Defender" /inheritance:d /T

icacls "C:\ProgramData\Microsoft\Windows Defender" /deny Intuitive:(F,MA)
icacls "C:\ProgramData\Microsoft\Windows Defender" /deny Administrators:(F,MA)
icacls "C:\ProgramData\Microsoft\Windows Defender" /deny SYSTEM:(F,MA)
pause
exit



