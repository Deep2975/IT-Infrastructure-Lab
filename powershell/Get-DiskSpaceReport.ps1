<#
.SYNOPSIS
    Reports free and used space for local file-system drives.
#>

[CmdletBinding()]
param(
    [string]$OutputFolder = "$PSScriptRoot\..\reports"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $OutputFolder)) {
    New-Item -ItemType Directory -Path $OutputFolder -Force | Out-Null
}

$report = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3" |
    ForEach-Object {
        $sizeGB = [math]::Round($_.Size / 1GB, 2)
        $freeGB = [math]::Round($_.FreeSpace / 1GB, 2)

        [pscustomobject]@{
            Drive       = $_.DeviceID
            VolumeName  = $_.VolumeName
            SizeGB      = $sizeGB
            FreeGB      = $freeGB
            UsedPercent = if ($sizeGB -gt 0) {
                [math]::Round((($sizeGB - $freeGB) / $sizeGB) * 100, 1)
            } else { 0 }
        }
    }

$file = Join-Path $OutputFolder "$($env:COMPUTERNAME)-disk-space.csv"
$report | Export-Csv -Path $file -NoTypeInformation -Encoding UTF8
$report | Format-Table -AutoSize
Write-Host "Report saved to: $file"
