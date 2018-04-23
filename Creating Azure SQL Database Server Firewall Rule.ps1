Switch-AzureMode AzureResourceManager

## Creating New Azure SQL Database Server Firewall Rule (ARM)
$AzureDatabaseServer = Get-AzureSqlServer –ResourceGroupName "DevTestFarm" –ServerName "DevTestSQLServer"

# Create Firewall Rule for single IP Address
New-AzureSqlServerFirewallRule –ResourceGroupName "DevTestFarm" -ServerName $AzureDatabaseServer.ServerName -FirewallRuleName "myHomeComputer" -StartIpAddress "167.200.188.210" -EndIpAddress "167.200.188.210"

# Create Firewall Rule for Azure IP Addresses
New-AzureSqlServerFirewallRule -ServerName $AzureDatabaseServer.ServerName -FirewallRuleName "AllowAzureIPs" –AllowAllAzureIPs