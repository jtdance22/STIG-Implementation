<#
.SYNOPSIS
This setting ensures the system uses algorithms that are FIPS-compliant for encryption, hashing, and signing. FIPS-compliant algorithms meet specific standards established by the U.S. Government and must be the algorithms used for all OS encryption functions.

.NOTES
    Author          : Justin Dance
    LinkedIn        : linkedin.com/in/justin-dance-a3105120a
    GitHub          : github.com/jtdance22
    Date Created    : 05-19-2025
    Last Modified   : 05-19-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN19-SO-000360

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    
    PS C:\> .\WN19-SO-000360.ps1 
#>

# Registry path for the FIPS policy
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\FipsAlgorithmPolicy"

# Value name and data
$valueName = "Enabled"
$valueData = 1  # 1 = Enabled, 0 = Disabled

# Ensure the registry key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $regPath -Name $valueName -Value $valueData -PropertyType DWord -Force

# Confirmation
Write-Output "'System cryptography: Use FIPS compliant algorithms' policy has been set to Enabled."
