@echo off
pscp -p -r -2 -4 -sftp -v -i C:\UTILITIES\KEY-1-private.ppk V:\BACKUP\*.zip backup@192.168.137.66:/var/backups/
exit
