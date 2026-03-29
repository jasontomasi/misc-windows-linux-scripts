@echo off
net start "VMwareHostd"
net start "VMUSBArbService"
net start "VMware NAT Service"
net start "VMnetDHCP"
net start "VMAuthdService"
"C:\Program Files (x86)\VMware\VMware Workstation\vmware.exe"
exit
