# Connect to Power BI Service
Connect-PowerBIServiceAccount 

# Get all Power BI workspaces in the organization
$Workspaces = Get-PowerBIWorkspace -Scope Organization -All

# Initialize an empty array to hold report user access details
$ReportUserAccessDetails = @()

# Loop through each workspace, get reports and user access details
foreach ($Workspace in $Workspaces) {
    try {
        # Attempt to get reports in the workspace
        $Reports = Get-PowerBIReport -WorkspaceId $Workspace.Id -ErrorAction Stop

        foreach ($Report in $Reports) {
            foreach ($User in $Workspace.Users) {
                $ReportUserAccessDetails += [PSCustomObject]@{
                    Workspace = $Workspace.Name
                    ReportName = $Report.Name
                    ReportId = $Report.Id
                    User = $User.UserPrincipalName
                    AccessRight = $User.AccessRight
                }
            }
        }
    } catch {
        # Catch and ignore the error, continue with next workspace
        Write-Warning "Unable to access workspace: $($Workspace.Name), Error: $($_.Exception.Message)"
    }
}

# Export the details to a CSV file
$ReportUserAccessDetails | Export-CSV -Path "C:\Users\hakeem.lawrence\OneDrive\Business Intelligence\PowerBIReportMembersWRights.csv" -NoTypeInformation
