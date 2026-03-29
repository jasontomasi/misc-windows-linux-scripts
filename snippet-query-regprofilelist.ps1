$basepath = $env:userprofile + "\Desktop\"
$dumpfolder = $basepath + "DUMPS\"
$regproffilename = $dumpfolder + $env:computername + "_REGUSERS_" + $(get-date -f dd-MM-yyyy) + ".csv"
$regproflist = Get-ChildItem -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\" -Recurse

# & md $dumpfolder

write-host "Base: " $basepath
write-host "Dump: "$dumpfolder
write-host "File: " $regproffilename
write-host "Reg: " $regproflist

foreach ($regvalue in $regproflist) {
    ($regvalue | Get-ItemProperty).Psobject.Properties | Where-Object { $_.Name -match 'ProfileImagePath' -or $_.Name -match 'Sid' } | Select-Object Name, Value
$Exportregvalues | Add-Member -MemberType NoteProperty -name NAME -Value "$_.Name"
$Exportregvalues | Add-Member -MemberType NoteProperty -name SID -Value "$_.Value"
$Exportregvalues | Export-Csv -Path $regproffilename -Append -NoTypeInformation
}
