## Assign Network Security Group to Subnet (ARM)
Switch-AzureMode AzureResourceManager

$vNET = Get-AzureVirtualNetwork -ResourceGroupName "DevTestRG" -Name "DevTestvNET" 

Set-AzureVirtualNetworkSubnetConfig -VirtualNetwork $vNET -Name Internal -AddressPrefix 10.0.0.0/24 -NetworkSecurityGroup $NSG