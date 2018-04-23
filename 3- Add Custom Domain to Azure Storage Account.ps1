## Add Custom Domain to Storage Account (ARM)

#Switch to AzureResourceManager Mode
Switch-AzureMode AzureResourceManager

Set-AzureStorageAccount –ResourceGroupName "CAI-WebFarm" –Name mylabstorageaccount –CustomDomainName "storage.company123.com"