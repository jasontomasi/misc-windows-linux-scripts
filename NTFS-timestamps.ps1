$target = "C:\UTILITIES\setup\"

New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem -Name NTFSDisableLastAccessUpdate -Value 00000001 ` -PropertyType DWORD -Force | Out-Null

attrib /S /D -r -h -s +v $target

Get-ChildItem $target | % {$_.CreationTime = '01/11/1960 06:00:00'}
Get-ChildItem $target | % {$_.LastWriteTime = '01/11/1970 06:00:00'}
Get-ChildItem $target | % {$_.LastAccessTime = '01/11/1980 06:00:00'}


