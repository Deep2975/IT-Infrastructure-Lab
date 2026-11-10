<#
.SYNOPSIS
    Exports selected Active Directory user properties to CSV.
.NOTES
    Requires the ActiveDirectory module and read access to the domain.
    Run only in a lab or an environment where you are authorised.
#>

[CmdletBinding()]
param(
    [string]$SearchBase,
    [string]$OutputPath = "$PSScriptRoot\ad-users.csv"
)

$ErrorActionPreference = "Stop"
Import-Module ActiveDirectory

$params = @{
    Filter = *
    Properties = @("Mail", "Department", "Title", "Enabled", "LastLogonDate")
}
if ($SearchBase) {
    $params.SearchBase = $SearchBase
}

Get-ADUser @params |
    Select-Object SamAccountName, Name, Enabled, Mail, Department, Title, LastLogonDate |
    Sort-Object SamAccountName |
    Export-Csv -Path $OutputPath -NoTypeInformation -Encoding UTF8

Write-Host "User report saved to: $OutputPath"
