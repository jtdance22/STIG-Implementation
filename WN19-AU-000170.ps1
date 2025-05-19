<#
.SYNOPSIS
    Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior. 
    Audit Group Membership records information related to the group membership of a user's logon token. 

.NOTES
    Author          : Justin Dance
    LinkedIn        : linkedin.com/in/justin-dance-a3105120a
    GitHub          : github.com/jtdance22
    Date Created    : 05-19-2025
    Last Modified   : 05-19-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN19-AU-000170

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    
    PS C:\> .\WN19-AU-000170.ps1 
#>

# Use AuditPol to configure 'Group Membership' for Success and Failure
$auditCategory = "Logon/Logoff"
$auditSubcategory = "Group Membership"

# Apply the setting
auditpol /set /subcategory:"$auditSubcategory" /success:enable /failure:enable

# Confirm the change
Write-Output "'Group Membership' audit policy set to: Success and Failure"


auditpol /get /category:"Logon/Logoff"
