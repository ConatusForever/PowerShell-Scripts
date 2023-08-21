# Get a list of all reports 

connect-PowerBIServiceAccount

# where $rlg_dev is an id of a workspace

$Datasets = foreach ($report in (get-powerbidataset -WorkspaceId $rlg_dev)){
    [pscustomobject]@{
        ReportName = $report.name
        ReportId = $report.id
    }
}

$Dir = "C:\Users\hakeem.lawrence\Documents\Documents\Datasets.csv"

$Datasets | Export-Csv -Path $Dir -NoTypeInformation