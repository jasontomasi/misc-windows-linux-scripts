@echo on
takeown /A /R /D y /F e:\Windows\System32\config\
icacls e:\Windows\System32\config\ /grant Administrators:(F,MA) /inheritance:e /T
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
robocopy.exe e:\Windows\System32\config\ Z:\%MYDATE%\registry\ /e /zb /j /copyall /dcopy:DAT /sl /nooffload /eta /xf desktop.ini /xf thumbs.db /r:10 /w:2 /fp /x /np /log:c:\RESULTS.TXT
pause
exit
