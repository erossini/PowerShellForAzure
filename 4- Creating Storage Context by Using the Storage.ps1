#Switch to AzureResourceManager Mode
Switch-AzureMode AzureResourceManager

## Generating Azure Storage Access Key (ARM)
$ResourceGroupName = "CAI-WebFarm"
$StorageAccountName = "mylabstroageaccount"
$StorageAccessKey = Get-AzureStorageAccountKey –ResourceGroupName $ResourceGroupName -Name $StorageAccountName | Select -ExpandProperty Key1

$StorageContext = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccessKey 