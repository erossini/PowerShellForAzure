#Create Azure Route Table (ARM)
$route1 = New-AzureRouteConfig -Name InternaltoFirewall -AddressPrefix 10.0.0.0/24 -NextHopType VirtualAppliance -NextHopIpAddress 10.10.10.254

$RT = New-AzureRouteTable -ResourceGroupName DevTestRG -Location 'West Europe' -Name DevTestRT -Route $route1

$vNet = Get-AzureVirtualNetwork -ResourceGroupName DevTestRG -Name DevTestvNet 

Set-AzureVirtualNetworkSubnetConfig -VirtualNetwork $vNet -Name Internal -AddressPrefix 10.0.0.0/24 -RouteTable $RT |Set-AzureVirtualNetwork

#Enable IP Forwarding on the Virtual Appliance VM (ARM)
$NICWAP1 = Get-AzureNetworkInterface -ResourceGroupName DevTestRG -Name NICWAP1

$NICWAP1.EnableIPForwarding = 1

Set-AzureNetworkInterface -NetworkInterface $NICWAP1