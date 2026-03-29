@echo off

net stop bits
net stop wuauserv
net stop cryptSvc
net stop msiserver

attrib /D /S -A -H -R -S "C:\Users\Intuitive\AppData\Local\Google\Chrome\User Data\Default\Cache\Cache_Data\"
attrib /D /S -A -H -R -S "C:\Windows\SoftwareDistribution\"
attrib /D /S -A -H -R -S "C:\Windows\System32\catroot2\"
attrib /D /S -A -H -R -S "C:\Windows\Temp\"
attrib /D /S -A -H -R -S "C:\TEMP\"
attrib /D /S -A -H -R -S "C:\Users\Intuitive\AppData\Local\Microsoft\Windows\INetCache\IE\"
attrib /D /S -A -H -R -S "C:\Windows\WinSxS\Temp\"
attrib /D /S -A -H -R -S "C:\Windows\Logs\DISM\"

del /F /S /Q "C:\Users\Intuitive\AppData\Local\Google\Chrome\User Data\Default\Cache\Cache_Data\"
del /F /S /Q "C:\Windows\SoftwareDistribution\"
del /F /Q /S "C:\Windows\System32\catroot2\"
del /F /S /Q "C:\Windows\Temp\"
del /F /S /Q "C:\TEMP\"
del /F /S /Q "C:\Users\Intuitive\AppData\Local\Microsoft\Windows\INetCache\"
del /F /S /Q "C:\Users\Intuitive\AppData\Local\Microsoft\Windows\INetCookies\"
del /F /S /Q "C:\Users\Intuitive\AppData\Local\Microsoft\Windows\History\"
del /F /S /Q "C:\Users\Intuitive\AppData\Local\Microsoft\Windows\WebCache\"
del /F /S /Q "C:\Users\Intuitive\AppData\Roaming\Telegram\tdata\user_data\cache\1\"
del /F /S /Q "C:\Users\Intuitive\AppData\Roaming\Telegram\tdata\user_data\media_cache\"
del /F /S /Q "C:\Windows\WinSxS\Temp\"
del /F /S /Q "C:\Windows\Logs\DISM\"

rmdir /S /Q "C:\Users\Intuitive\AppData\Local\Microsoft\Windows\INetCache\"
rmdir /S /Q "C:\Users\Intuitive\AppData\Local\Microsoft\Windows\INetCookies\"
rmdir /S /Q "C:\Users\Intuitive\AppData\Local\Microsoft\Windows\History\"
rmdir /S /Q "C:\Users\Intuitive\AppData\Local\Microsoft\Windows\WebCache\"
rmdir /S /Q "C:\Users\Intuitive\AppData\Roaming\Telegram\tdata\user_data\cache\1\"
rmdir /S /Q "C:\Users\Intuitive\AppData\Roaming\Telegram\tdata\user_data\media_cache\"
rmdir /S /Q "C:\TEMP\"
rmdir /S /Q "C:\Windows\WinSxS\Temp\"

c:\windows\SYSTEM32\cleanmgr.exe /d c:

exit
