Switch-AzureMode AzureResourceManager

## Upgrade Azure SQL Database Server Version (ARM)
$UpgradeSchedule = (Get-Date).AddDays(1).TouniversalTime() 

Start-AzureSqlServerUpgrade -ResourceGroupName "DevTestFarm" -ServerName "devtestfarm-sql-01" -ServerVersion 12.0 –ScheduleUpgradeAfterUtcDateTime $UpgradeSchedule