#Creating Azure vNET (ARM)
Switch-AzureMode AzureResourceManager

New-AzureVirtualNetwork -ResourceGroupName "DevTestRG" -Location "West Europe" -Name "DevTestvNET" -AddressPrefix "10.0.0.0/16" -DnsServer "10.0.0.4"

#Adding subnet to Azure virtual network (ARM)
$vNET = Get-AzureVirtualNetwork -ResourceGroupName "DevTestRG" -Name "DevTestvNET"

$vNET | Add-AzureVirtualNetworkSubnetConfig -Name "subnet-1" -AddressPrefix "10.0.0.0/24" | Set-AzureVirtualNetwork