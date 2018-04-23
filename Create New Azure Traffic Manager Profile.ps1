## Create New Azure Traffic Manager Profile (ARM)
Switch-AzureMode AzureResourceManager

New-AzureTrafficManagerProfile `
-Name DevTestTM `
-ResourceGroupName DevTestRG `
-ProfileStatus Enabled `
-Ttl 30 `
-RelativeDnsName 'DevTestLab' `
-TrafficRoutingMethod Weighted `
-MonitorProtocol HTTP `
-MonitorPort 80 `
-MonitorPath '/'