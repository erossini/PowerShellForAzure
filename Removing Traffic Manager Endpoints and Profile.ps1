## Removing Endpoint to Traffic Manager Profile (ARM)
Switch-AzureMode AzureResourceManager

#Removing Traffic Manager EndPoints
$ATMP = Get-AzureTrafficManagerProfile -Name DevTestTM -ResourceGroupName DevTestRG

Remove-AzureTrafficManagerEndpointConfig -EndpointName "web-ca" -TrafficManagerProfile $ARMP 

Remove-AzureTrafficManagerEndpointConfig -EndpointName "web-ea" -TrafficManagerProfile $ARMP -ProfileName $ARMP 

Set-AzureTrafficManagerProfile -TrafficManagerProfile $ATMP

#Removing Traffic Manager Profile (ASM)
Remove-AzureTrafficManagerProfile –Name DevTestTM –Force