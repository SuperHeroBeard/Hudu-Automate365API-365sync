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

#Create AzureAD App for Hudu Sync
$AppName = "Hudu Sync"
    if(!($myApp = Get-AzureADApplication -Filter "DisplayName eq '$($appName)'"  -ErrorAction SilentlyContinue))
    {
        $myApp = New-AzureADApplication -DisplayName $appName  
# Application Password Credentials (ClientSecret)
$startDate = Get-Date
$endDate = $startDate.AddYears(5)
$aadAppKeyPwd = New-AzureADApplicationPasswordCredential -ObjectId $AADApplication.ObjectId -CustomKeyIdentifier "Primary" -StartDate $startDate -EndDate $endDate
$aadAppKeyPwd
$AppDetailsOutput = "$AADApplicationName Details:
=========================================================
Application Name: 	$appName
Application Id:   	$($myApp.AppId)
Secret Key:       	$($PasswordCredential.Value)
"
	Write-Host
	Write-Host $AppDetailsOutput
}
else {
	        Write-Host
	        Write-Host -f Yellow Azure AD Application $appName already exists.
}