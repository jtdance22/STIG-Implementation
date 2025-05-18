<#
.SYNOPSIS
    Unattended systems are susceptible to unauthorized use and should be locked when unattended. The screen saver should be set at a maximum of 15 minutes and be password protected. This protects critical and sensitive data from exposure to unauthorized personnel with physical access to the computer. This script checks if the timeout value is set between 0 and 900 seconds. If not, sets maximum timeout to 900 seconds (15 minutes).

.NOTES
    Author          : Justin Dance
    LinkedIn        : linkedin.com/in/justin-dance-a3105120a
    GitHub          : github.com/jtdance22
    Date Created    : 05-18-2025
    Last Modified   : 05-18-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN19-SO-000120

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    
    PS C:\> .\WN19-SO-000120.ps1 
#>

# Set desired inactivity timeout (in seconds)
$desiredTimeout = 900  # must be > 0 and <= 900

# Validate value
if ($desiredTimeout -le 0 -or $desiredTimeout -gt 900) {
    Write-Error "Invalid timeout value. It must be between 1 and 900 seconds."
    exit 1
}

# Define the registry path and value name
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$valueName = "InactivityTimeoutSecs"

# Check if path exists, create if it doesn't
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the timeout value
New-ItemProperty -Path $regPath -Name $valueName -Value $desiredTimeout -PropertyType DWord -Force

# Confirm the change
Write-Output "'Interactive logon: Machine inactivity limit' set to $desiredTimeout seconds."
