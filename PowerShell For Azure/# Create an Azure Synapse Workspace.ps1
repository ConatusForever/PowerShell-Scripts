# Create an Azure Synapse Workspace

az login

az group create --name AzAnalyticsGroup --location eastus

az synapse workspace create --name azwksp `
--resource-group AzAnalyticsGroup `
--storage-account AzStorage `
--file-system AzFiles `
--sql-admin-login-user HakeemL `
--sql-admin-login-password 'Password#1' `
--location eastus