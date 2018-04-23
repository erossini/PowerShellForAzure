Switch-AzureMode AzureResourceManager

## Creating New Azure Database (ARM)
$AzureDatabaseServer = "SERVERNAME"

# Creating Azure SQL Database
New-AzureSqlDatabase -ResourceGroupName "DevTestFarm" -ServerName $AzureDatabaseServer -DatabaseName "DevTestDB" -Edition Standard -MaxSizeBytes 50gb -RequestedServiceObjectiveName s2