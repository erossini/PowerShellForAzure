## Change Storage account replication option (ARM)

#Switch to AzureResourceManager Mode
Switch-AzureMode AzureResourceManager

Set-AzureStorageAccount –ResourceGroupName "CAI-WebFarm" –Name mylabstorageaccount -Type Standard_LRS