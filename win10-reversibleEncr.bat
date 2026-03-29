@echo on

powershell -Command "((Get-Content %TEMP%\secpol.cfg) -replace 'ClearTextPassword = 1', 'ClearTextPassword = 0') | Set-Content %TEMP%\secpol.cfg"

secedit /configure /db c:\windows\security\local.sdb /cfg %TEMP%\secpol.cfg /areas SECURITYPOLICY

pause

