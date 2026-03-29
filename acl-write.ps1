##  To change acl for eventlog .etl files
Clear-Host
$winlogpath = $env:SystemRoot + "\System32\Winevt\Logs\"
$peskiesknown = @("snmptrap", "schedule", "eventlog")
$Account = $env:computername+"\eqc_admin"

Get-Childitem $winlogpath -Filter "*.etl" -recurse | foreach ($_) {


        #The ACL objects do not like being used more than once, so re-create them on the Process block
        $DirOwner = New-Object System.Security.AccessControl.DirectorySecurity
        $DirOwner.SetOwner([System.Security.Principal.NTAccount]$Account)

        $FileOwner = New-Object System.Security.AccessControl.FileSecurity
        $FileOwner.SetOwner([System.Security.Principal.NTAccount]$Account)
        
        $DirAdminAcl = New-Object System.Security.AccessControl.DirectorySecurity
        $FileAdminAcl = New-Object System.Security.AccessControl.DirectorySecurity
        $AdminACL = New-Object System.Security.AccessControl.FileSystemAccessRule('Builtin\Administrators','FullControl','ContainerInherit,ObjectInherit','InheritOnly','Allow')
        $FileAdminAcl.AddAccessRule($AdminACL)
        $DirAdminAcl.AddAccessRule($AdminACL)


        #Diags
        Write-host "Curfile: " $winlogpath$_
        Write-host "Account: " $Account





        Try {
            $AttemptAccess = Get-Item -LiteralPath $winlogpath$_ -Force -ErrorAction Stop

            # Check whether object is a file

            If (-NOT $_.PSIsContainer) {

                If ($PSCmdlet.ShouldProcess($_, 'Set File Owner')) {
                    Try {
                        $_.SetAccessControl($FileOwner)
                    } Catch {
                        Write-Warning "Couldn't take ownership of $($_.FullName)! Taking FullControl of $($_.Directory.FullName)"
                        $_.Directory.SetAccessControl($FileAdminAcl)
                        $_.SetAccessControl($FileOwner)
                    }
                }
            } Else {

                If ($PSCmdlet.ShouldProcess($_, 'Set Directory Owner')) {                        
                    Try {
                        $_.SetAccessControl($DirOwner)
                    } Catch {
                        Write-Warning "Couldn't take ownership of $($_.FullName)! Taking FullControl of $($_.Parent.FullName)"
                        $_.Parent.SetAccessControl($DirAdminAcl) 
                        $_.SetAccessControl($DirOwner)
                    }
                }

                If ($Recurse) {
                    [void]$PSBoundParameters.Remove('FullName')
                    Get-ChildItem $_ -Force | Set-Owner @PSBoundParameters
                }
            }
        }
        

        Catch {
            Write-Warning "$($_): $($_.Exception.Message)"
               }
    }


# Remove-Item $_.fullname
