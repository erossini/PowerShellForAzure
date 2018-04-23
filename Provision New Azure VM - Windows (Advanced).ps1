## Provision New Azure VM - Windows (Advanced) - (ARM)

#Switch to AzureResourceManager Mode
Switch-AzureMode AzureResourceManager

# Create PSCredential Object
$Username = "Enrico"
$Password = "Master@123" | ConvertTo-SecureString -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential($Username,$Password)

# Create VM Config Object
$vm1 = New-AzureVMConfig -VMName WebSrv01 -VMSize Basic_A1

# Configure VM Source Image
Set-AzureVMSourceImage -VM $vm1 -PublisherName MicrosoftWindowsServer -Offer WindowsServer -Skus 2012-R2-Datacenter -Version 4.0.20150726

# Configure VM Operating system
Set-AzureVMOperatingSystem -VM $vm1 -Windows -ComputerName "WebSrv01" -ProvisionVMAgent -EnableAutoUpdate -Credential $Cred

# Configure VM Network Interface
Add-AzureVMNetworkInterface -VM $vm1 -Id (Get-AzureNetworkInterface -ResourceGroupName DevTestFarm -Name nic1).Id -Primary

# Provision VM
New-AzureVM -ResourceGroupName DevTestFarm -VM $vm1 -Location "West Europe"
