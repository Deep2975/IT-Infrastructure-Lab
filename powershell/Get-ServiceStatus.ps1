<#
.SYNOPSIS
    Checks the status of selected Windows services.
#>

[CmdletBinding()]
param(
    [string[]]$Name = @("Spooler", "W32Time", "Dnscache"),
    [string]$OutputFolder = "$PSScriptRoot\..\reports"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $OutputFolder)) {
    New-Item -ItemType Directory -Path $OutputFolder -Force | Out-Null
}

$report = foreach ($serviceName in $Name) {
    $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

    if ($null -eq $service) {
        [pscustomobject]@{
            Name = $serviceName
            Status = "Not found"
            StartType = "Unknown"
        }
    } else {
        [pscustomobject]@{
            Name = $service.Name
            Status = $service.Status
            StartType = $service.StartType
        }
    }
}

$file = Join-Path $OutputFolder "service-status-$(Get-Date -Format yyyyMMdd-HHmmss).csv"
$report | Export-Csv -Path $file -NoTypeInformation -Encoding UTF8
$report | Format-Table -AutoSize
