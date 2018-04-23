#Connecting to Azure RMS Serivce
Connect-AadrmService -Credential (Get-Credential "admin@<YOUR_TENANT>.onmicrosoft.com")

#Create Read-Only Policy Template
#Define Policy Template Names (English & French)
$Names = @{}
$Names[1033] = "Company123 - Confidential Content"
$Names[1036] = "Company123 - Content Confedential"

#Define Policy Template Descriptions (English & French)
$Descriptions = @{}
$Descriptions[1033] = "The content protected by this template is read-only"
$Descriptions[1036] = "Le contenu protégé par ce modèle est en lecture seule"

#Rights Definitions
$RD1 = New-AadrmRightsDefinition –EmailAddress engineering@company123.com -Rights "VIEW","EXPORT"
$RD2 = New-AadrmRightsDefinition –EmailAddress Sherif.Talaat@company123.com -Rights "OWNER"

#Creating Policy Template
$temp = Add-AadrmTemplate -Name $Names -Descriptions $Descriptions -RightsDefinitions $RD1,$RD2 -ContentExpirationOption AfterDays -ContentValidityDuration 14 -LicenseValidityDuration 0

#Update Template Property
Set-AadrmTemplateProperty -TemplateId $temp.TemplateId -Status Published