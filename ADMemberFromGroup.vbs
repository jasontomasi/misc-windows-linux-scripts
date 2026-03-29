Dim objGroup, objUser, objFSO, objFile, strDomain, strGroup, Domain, Group

strDomain = Inputbox ("AD Domain:", "Data needed", "eqc.local")

strGroup = InputBox ("Group name:", "Data needed", "sg_it_servicedesk")

Set objFSO = CreateObject("Scripting.FileSystemObject")

' set path using a variable
Set objFile = objFSO.CreateTextFile("C:\" & strGroup & ".csv")

Set objGroup = GetObject("WinNT://" & strDomain & "/" & strGroup & ",group")

For Each objUser In objGroup.Members


'objFile.WriteLine objUser.Name & "," & objUser.Class


objFile.WriteLine objUser.FullName & "," & objUser.Name


Next
objFile.Close
Set objFile = Nothing
Set objFSO = Nothing
Set objUser = Nothing
Set objGroup = Nothing
Wscript.Echo "Please check the c: for your output file"