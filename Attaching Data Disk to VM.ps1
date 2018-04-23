## Attaching Data Disk to VM (ARM)

#Switch to AzureResourceManager Mode
Switch-AzureMode AzureResourceManager

# Create a VM object with the targeted VM config
$vmName = "WebSrv01"
$ResourceGroupName = "DevTestFarm"
$vm = Get-AzureVM –ResourceGroupName $ResourceGroupName –Name $vmName

#Add Azure Data Disk
$diskLocation = https://mylabstorageaccount.blob.core.windows.net/vhds/datadisk1.vhd
Add-AzureVMDataDisk -VM $VirtualMachine -Name "disk1" -VhdUri $diskLocation -LUN 2 -Caching ReadWrite -DiskSizeinGB 1 -CreateOption Empty

# Update the VM
Update-AzureVM –ResourceGroupName DevTestFarm –Name WebSrv01 –VM $vm1