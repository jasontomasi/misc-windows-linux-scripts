Get-ChildItem -Path "c:\" -Recurse -Force |
  Where-Object { $_.LinkType -ne $null -or $_.Attributes -match "ReparsePoint" -and $_.Length -eq 1 } |
  ft FullName,Attributes,Linktype,Target > d:\downloads\SYMLINK-LIST.txt
