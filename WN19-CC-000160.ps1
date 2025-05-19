<#
.SYNOPSIS
 Some features may communicate with the vendor, sending system information or downloading data or components for the feature. Turning off this capability will prevent potentially sensitive information from being sent outside the enterprise and will prevent uncontrolled updates to the system.
This setting prevents the client computer from printing over HTTP, which allows the computer to print to printers on the intranet as well as the Internet.

.NOTES
    Author          : Justin Dance
    LinkedIn        : linkedin.com/in/justin-dance-a3105120a
    GitHub          : github.com/jtdance22
    Date Created    : 05-19-2025
    Last Modified   : 05-19-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN19-CC-000160

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    
    PS C:\> .\WN19-CC-000160.ps1 
#>

# Registry path for the policy
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"

# Value name and data
$valueName = "DisableHTTPPrinting"
$valueData = 1  # 1 = Enabled (turn off HTTP printing), 0 = Disabled

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $regPath -Name $valueName -Value $valueData -PropertyType DWord -Force

# Confirmation message
Write-Output "'Turn off printing over HTTP' has been set to Enabled."
