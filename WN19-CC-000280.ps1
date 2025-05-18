<#
.SYNOPSIS
    Inadequate log size will cause the log to fill up quickly. This may prevent audit events from being recorded properly and require frequent attention by administrative personnel. This script sets the Windows Server 2019 Security event log size to 196608 KB.

.NOTES
    Author          : Justin Dance
    LinkedIn        : linkedin.com/in/justin-dance-a3105120a
    GitHub          : github.com/jtdance22
    Date Created    : 05-18-2025
    Last Modified   : 05-18-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN19-CC-000280

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    
    PS C:\> .\WN19-CC-000280.ps1 
#>


# Define registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"
$valueName = "MaxSize"
$valueData = 0x00030000  # 196608 in decimal

# Check if the path exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -PropertyType DWord -Force

# Confirm the change
Write-Output "Registry value '$valueName' set to $valueData at '$registryPath'"
