$path = 'c:\TEMP\'

$date1 = '14/12/1970 02:44:09 AM'
$date2 = '04/07/2000 11:07:32 PM'
$date3 = '14/12/1970 02:44:09 AM'

Get-ChildItem $path *.* | ForEach-Object {$_.CreationTime = $date1}
Get-ChildItem $path *.* | ForEach-Object {$_.LastWriteTime = $date2}
Get-ChildItem $path *.* | ForEach-Object {$_.LastAccessTime = $date3}
