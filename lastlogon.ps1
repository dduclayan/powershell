<#
SYNOPSIS
.This code will pull all ad users and their lastlogontimestamp
#>

$filename = "ADLastLogOn" + (get-date -format "-MM-dd-yyyy-hhmmtt")

Invoke-Command -ComputerName <your-dc-computer-name> {Get-aduser -filter * -properties lastlogon | select samaccountname, @{n='lastlogon';e={[datetime]::FromFileTime($_.lastlogon)}}} | select -Property * -ExcludeProperty PSComputerName, RunspaceId | export-csv C:\Users\$env:USERNAME\downloads\$filename.csv
