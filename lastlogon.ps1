<#
SYNOPSIS
.This code will pull all ad users and their lastlogontimestamp
#>


Invoke-Command -ComputerName AD01 {Get-aduser -filter * -properties lastlogon | select samaccountname, @{n='lastlogon';e={[datetime]::FromFileTime($_.lastlogon)}}} | select -Property * -ExcludeProperty PSComputerName, RunspaceId | export-csv C:\Windowspowershell\reports\lastLogOnReport.csv
