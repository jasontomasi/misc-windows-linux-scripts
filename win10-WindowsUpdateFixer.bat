net stop bits
net stop wuauserv
net stop cryptSvc
net stop msiserver

del /F /Q /S C:\Windows\SoftwareDistribution\
del /F /Q /S C:\Windows\System32\catroot2\


net start bits
net start wuauserv
net start cryptSvc
net start msiserver
pause
exit
