@echo off

:: Check privileges 
net file 1>NUL 2>NUL
if not '%errorlevel%' == '0' (
	echo *** ERROR: THIS SCRIPT MUST BE RUN AS ADMINISTRATOR ***
    powershell Start-Process -FilePath "%0" -ArgumentList "%cd%" -verb runas >NUL 2>&1
    exit /b
)

if '%errorlevel%' == '0' (
	echo Script is running as Administrator
)

md C:\TEMP\

@echo on

setx TEMP "C:\TEMP"
setx TMP "C:\TEMP"

setx /m TEMP "C:\TEMP"
setx /m TMP "C:\TEMP"

pause
exit
