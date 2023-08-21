#PowerShell Automation | Get ALl Power BI Users | Export as CSV to Folder

$Workspaces = Get-PowerBIWorkspace -Scope Organization -All
$Workspaces |
    foreach-object {
        $Workspace = $_.name
        foreach ($User in $_.Users) {
            [PSCustomObject]@{
                workspace = $Workspace
                User = $User.UserPrincipalName
            }
        }
    } | Export-CSV -Path "C:\Users\hakeem.lawrence\OneDrive\Business Intelligence\PowerBIGroupMembers.csv" -NoTypeInformation