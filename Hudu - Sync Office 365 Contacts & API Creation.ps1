#Connect to AzureAD
if (Get-Module -Name AzureAd) {
    Write-Host "AzureAD is installed"
    Import-Module AzureAD
}
    else {
        Install-Module AzureAD -Force -Confirm:$false
        Import-Module AzureAD 
        }
            Connect-AzureAD



