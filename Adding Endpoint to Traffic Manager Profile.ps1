## Adding Endpoint to Traffic Manager Profile (ARM)
Switch-AzureMode AzureResourceManager

$T1 = 'website-ca.azurewebsites.net'
$T2 = 'website-ea.azurewebsites.net'

$ATMP = Get-AzureTrafficManagerProfile -Name DevTestTM -ResourceGroupName DevTestRG

Add-AzureTrafficManagerEndpointConfig -EndpointName "web-ca" -EndpointStatus Enabled -Target $T1 -TrafficManagerProfile $ATMP -Type ExternalEndpoints -Priority 1

Add-AzureTrafficManagerEndpointConfig -EndpointName "web-ea" -EndpointStatus Enabled -Target $T2 -TrafficManagerProfile $ATMP -Type ExternalEndpoints -Priority 2

Set-AzureTrafficManagerProfile -TrafficManagerProfile $ATMP