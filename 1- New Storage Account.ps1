## Create new Azure storage account (ARM)

#Switch to AzureResourceManager Mode
Switch-AzureMode AzureResourceManager

#Authenticate to Azure Subscription
Add-AzureAccount

#Create New Azure Resource Group
New-AzureResourceGroup -Name "CAI-WebFarm" -Location "West Europe"

#New Storage Account
New-AzureStorageAccount -ResourceGroupName "CAI-WebFarm" -Name "mylabstorageaccount" -Location "West Europe" -Type "Standard_LRS"