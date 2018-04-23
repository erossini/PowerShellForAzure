#Connecting to Azure RMS Serivce
Connect-AadrmService -Credential (Get-Credential "admin@<YOUR_TENANT>.onmicrosoft.com")


#Enable Azure RMS Super User Feature
Enable-AadrmSuperUserFeature

#Add Azure RMS Super User
Add-AadrmSuperUser -EmailAddress admin@company123.com