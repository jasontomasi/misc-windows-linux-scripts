@echo off
REM Set your password in the line below
set DBPASSWORD=95120t^^95120t

echo Password will be set to: %DBPASSWORD%

@echo on
echo  SQL Server: reset password on SA account
echo  -----------------------------------------

echo ** Run this with Administrator privileges **

REM  (this stops the SQL server service)
net stop MSSQL$GOLDMINE
net stop MSSQLSERVER
net stop SQLEXPRESS

REM  (this starts the SQL server service in single-user mode)
net start MSSQL$GOLDMINE /f
net start MSSQLSERVER /f
net start SQLEXPRESS /f

REM  (this connects to the instance so we can issue commands to it)
sqlcmd -E -S %COMPUTERNAME%\MSSQL$GOLDMINE -Q "ALTER LOGIN sa enable; ALTER LOGIN sa WITH PASSWORD = '%DBPASSWORD%';"
sqlcmd -E -S %COMPUTERNAME%\MSSQLSERVER -Q "ALTER LOGIN sa enable; ALTER LOGIN sa WITH PASSWORD = '%DBPASSWORD%';"
sqlcmd -E -S %COMPUTERNAME%\SQLEXPRESS -Q "ALTER LOGIN sa enable; ALTER LOGIN sa WITH PASSWORD = '%DBPASSWORD%';"
sqlcmd -E -S %COMPUTERNAME%\GOLDMINE -Q "ALTER LOGIN sa enable; ALTER LOGIN sa WITH PASSWORD = '%DBPASSWORD%';"

REM  if we don't know the instance name, try to connect to the default instance and set a new password for the 'sa' account
sqlcmd -E -Q "ALTER LOGIN sa enable; ALTER LOGIN sa WITH PASSWORD = '%DBPASSWORD%';"

REM  (you can create a new SQL user account here)
REM  CREATE LOGIN intuitive WITH PASSWORD = 'putYourNewPasswordHere'REM 
REM  ALTER SERVER ROLE sysadmin ADD MEMBER intuitive
REM  EXEC sp_addsrvrolemember ‘intuitive, ‘sysadmin’REM 
REM  GO

REM  Restart the SQL server then start it normally (not single-user)
net stop MSSQL$GOLDMINE
net stop MSSQLSERVER
net stop SQLEXPRESS
net start MSSQL$GOLDMINE
net start MSSQLSERVER
net start SQLEXPRESS

set DBPASSWORD=""

pause
exit
