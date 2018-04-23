## Creating Azure SQL Database Server (ARM)

Switch-AzureMode AzureResourceManager

# Create PSCredential Object
$Username = "SherifT"
$Password = "pass@word1" | ConvertTo-SecureString -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential($Username,$Password)

# Create Azure SQL Database Server
$AzureDatabaseServer = New-AzureSqlServer –ResourceGroupName "DevTestFarm" –ServerName "DevTestSQLServer" -SqlAdministratorCredentials $Cred -Location "West US" -ServerVersion "12.0" –verbose