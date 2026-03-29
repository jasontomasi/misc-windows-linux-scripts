# Disable the pesky services in the registry (effective on reboot)
if ((Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\services\Schedule' -Name "Start").Start -ne 4)
{set-itemproperty -Path 'HKLM:\SYSTEM\CurrentControlSet\services\Schedule' -Name "Start" -value 4}

if ((Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\services\snmptrap' -Name "Start").Start -ne 4)
{set-itemproperty -Path 'HKLM:\SYSTEM\CurrentControlSet\services\snmptrap' -Name "Start" -value 4}

if ((Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\services\eventlog' -Name "Start").Start -ne 4)
{set-itemproperty -Path 'HKLM:\SYSTEM\CurrentControlSet\services\eventlog' -Name "Start" -value 4}