<#
.SYNOPSIS
    Collects basic hardware and operating-system details from the local computer.
.DESCRIPTION
    Read-only inventory example. Writes a CSV report to the chosen output folder.
#>

[CmdletBinding()]
param(
    [string]$OutputFolder = "$PSScriptRoot\..\reports"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $OutputFolder)) {
    New-Item -ItemType Directory -Path $OutputFolder -Force | Out-Null
}

$computer = Get-CimInstance -ClassName Win32_ComputerSystem
$os = Get-CimInstance -ClassName Win32_OperatingSystem
$bios = Get-CimInstance -ClassName Win32_BIOS

$report = [pscustomobject]@{
    ComputerName = $computer.Name
    Manufacturer  = $computer.Manufacturer
    Model         = $computer.Model
    RAM_GB        = [math]::Round($computer.TotalPhysicalMemory / 1GB, 2)
    OperatingSystem = $os.Caption
    Version       = $os.Version
    LastBoot      = $os.LastBootUpTime
    SerialNumber  = $bios.SerialNumber
    CollectedAt   = Get-Date
}

$file = Join-Path $OutputFolder "$($env:COMPUTERNAME)-inventory.csv"
$report | Export-Csv -Path $file -NoTypeInformation -Encoding UTF8
Write-Host "Report saved to: $file"
