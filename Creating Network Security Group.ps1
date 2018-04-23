## Creating Network Security Group (ARM)
Switch-AzureMode AzureResourceManager

$secRule1 = New-AzureNetworkSecurityRuleConfig -Name rdp-access-rule -Access Allow -Protocol Tcp -Direction Inbound -Priority 100 -SourceAddressPrefix '10.0.1.0/24' -SourcePortRange '*' -DestinationAddressPrefix '*' -DestinationPortRange '3389'

$NSG = New-AzureNetworkSecurityGroup -ResourceGroupName 'DevTestRG' -Location 'West Europe' -Name 'DevTestNSG' -SecurityRules $secRule1