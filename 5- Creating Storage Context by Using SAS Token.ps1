#Switch to AzureResourceManager Mode
Switch-AzureMode AzureResourceManager

$StorageAccountName = "mylabstroageaccount"

#Generating SAS Token
$SASToken = New-AzureStorageContainerSASToken –Name VHDs –Permission rwdl –ExpiryTime(Get-Date).AddDays(5)

#Creating the Sotrage Context using the SAS Toekn (ASM)
$StorageContext = New-AzureStorageContext -StorageAccountName $StorageAccountName -SasToken $SASToken