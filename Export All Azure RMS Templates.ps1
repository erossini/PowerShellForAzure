#Connecting to Azure RMS Serivce
Connect-AadrmService -Credential (Get-Credential "admin@<YOUR_TENANT>.onmicrosoft.com")


#Export All Azure RMS Templates
$Templates = Get-AadrmTemplate

ForEach($t in $Templates)
{
    Export-AadrmTemplate -TemplateId $t.TemplateId -Path ("C:\AzureRMS\Templates\" + $t.Names[0].Value + ".xml")
}