#Switch to AzureResourceManager Mode
Switch-AzureMode AzureResourceManager

## Creating new Storage Context 
$StorageAccountName = "storage01"
$StorageAccountKey = "SOURCE_STORAGE_ACCESS_KEY"
$StorageContext = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey

## Creating new Storage Share 
New-AzureStorageShare -Name "teamshare" -Context $StorageContext 

## Creating new Storage Directory 
New-AzureStorageDirectory -ShareName "teamshare" -Path "Documents" -Context $StorageContext 

## Uploading all files under Document folders 
ForEach($file in (Get-ChildItem -Path D:\Documents))
{
    Set-AzureStorageFileContent -ShareName "teamshare" -Path "documents" -Source $file.FullName -Context $StorageContext -Force 
}

## Mounting cloud-based share to Azure VM
New-PSDrive -Name "M" -Root "\\storage01.file.core.windows.net\coexshare01" -Credential (Get-Credential sherift) -PSProvider FileSystem -Persist