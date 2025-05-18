<#
.SYNOPSIS
    Windows Server 2019 Remote Desktop Services must require secure Remote Procedure Call (RPC) communications.
.NOTES
    Author          : Justin Dance
    LinkedIn        : linkedin.com/in/justin-dance-a3105120a
    GitHub          : github.com/jtdance22
    Date Created    : 05-18-2025
    Last Modified   : 05-18-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN19-CC-000370

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    
    PS C:\> .\WN19-CC-000370.ps1 
#>

# Registry path for the policy
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"

# Policy value name and desired setting
$valueName = "fEncryptRPCTraffic"
$valueData = 1  # 1 = Enabled, 0 = Disabled

# Create registry path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the policy
New-ItemProperty -Path $regPath -Name $valueName -Value $valueData -PropertyType DWord -Force

# Confirm the change
Write-Output "'Require secure RPC communication' policy has been set to Enabled."
