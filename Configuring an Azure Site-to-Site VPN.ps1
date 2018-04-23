## Configuring an Azure Site-to-Site VPN

#Add Gateway subnet to existing vNET (ARM)
$vNET = Get-AzureVirtualNetwork -ResourceGroupName "DevTestRG" -Name "DevTestvNET"
$vNET | Add-AzureVirtualNetworkSubnetConfig -Name "GatewaySubnet" -AddressPrefix "10.0.1.0/24" | Set-AzureVirtualNetwork

#Create Local network site (ARM)
New-AzureLocalNetworkGateway -Name CorpNet -ResourceGroupName DevTestRG -Location 'West Europe' -GatewayIpAddress '197.53.16.82' -AddressPrefix '192.168.10.0/24'

#Create Azure Public IP Address (ARM)
$GWPIP = New-AzurePublicIpAddress -Name GWPIP -ResourceGroupName DevTestRG -Location 'West Europe' -AllocationMethod Dynamic

#Get Azure Public IP Address (ARM)
Get-AzurePublicIpAddress -Name GWPIP-ResourceGroupName DevTestRG

#Create Azure Gateway IP configuration (ARM)
$vNET = Get-AzureVirtualNetwork -ResourceGroupName "DevTestRG" -Name "DevTestvNET"
$subnet = Get-AzureVirtualNetworkSubnetConfig -Name 'Gateway' -VirtualNetwork $vNet
$GWipconfig = New-AzureVirtualNetworkGatewayIpConfig -Name GWIPCONFIG -SubnetId $subnet.Id -PublicIpAddressId $GWPIP.Id

#Create Azure Gateway
New-AzureVirtualNetworkGateway -Name S2SGW -ResourceGroupName DevTestRG -Location 'West Europe' -IpConfigurations $GWipconfig -GatewayType Vpn -VpnType RouteBased

#Create Azure VPN connection (ARM)
$Gateway = Get-AzureVirtualNetworkGateway -Name S2SGW -ResourceGroupName DevTestRG
$LocalvNET = Get-AzureLocalNetworkGateway -Name CorpNet -ResourceGroupName DevTestRG

New-AzureVirtualNetworkGatewayConnection -Name CorpNetToAzure `
-ResourceGroupName DevTestRG `
-Location 'West Europe' `
-VirtualNetworkGateway1 $Gateway `
-LocalNetworkGateway2 $LocalvNET `
-ConnectionType IPsec `
-RoutingWeight 10 `
-SharedKey 'powerShellRocks!'

#Get Virtual Network Gateway Connection (ARM)
Get-AzureVirtualNetworkGatewayConnection -Name CorpNetToAzure -ResourceGroupName DevTestRG