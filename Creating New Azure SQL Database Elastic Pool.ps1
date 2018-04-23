Switch-AzureMode AzureResourceManager

## Create Azure SQL Database Elastic Pool (ARM)
New-AzureSqlElasticPool -ResourceGroupName "DevTestFarm" `
-ServerName "devtestfarm-sql-01" `
-ElasticPoolName "DevTestElasticPool" `
-Edition "Standard" `
-Dtu 400 `
-DatabaseDtuMin 10  `
-DatabaseDtuMax 100