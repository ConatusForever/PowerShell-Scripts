# Connect to Power BI Service
Connect-PowerBIServiceAccount 

# Get all Power BI workspaces in the organization
$Workspaces = Get-PowerBIWorkspace -Scope Organization -All

# Loop through each workspace and get user access details
$UserAccessDetails = foreach ($Workspace in $Workspaces) {
    foreach ($User in $Workspace.Users) {
        [PSCustomObject]@{
            Workspace = $Workspace.Name
            User = $User.UserPrincipalName
            AccessRight = $User.AccessRight # Added AccessRight field
        }
    }
}

# Export the details to a CSV file
$UserAccessDetails | Export-CSV -Path "C:\Users\hakeem.lawrence\OneDrive\Business Intelligence\PowerBIGroupMembersWRights.csv" -NoTypeInformation
