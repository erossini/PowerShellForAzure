## Copying blobs between two storage accounts (ASM)

#Source Storage Information
$SrcStorageAccountName = "storage01"
$SrcStorageAccountKey = "SOURCE_STORAGE_ACCESS_KEY"
$SrcStorageContext = New-AzureStorageContext -StorageAccountName $SrcStorageAccountName -StorageAccountKey $SrcStorageAccountKey

#Destination Storage Information
$DestStorageAccountName = "storage02"
$DestStorageAccountKey = "SOURCE_STORAGE_ACCESS_KEY"
$DestStorageContext = New-AzureStorageContext -StorageAccountName $DestStorageAccountName -StorageAccountKey $DestStorageAccountKey

#Copy single blob from container to container
Start-AzureStorageBlobCopy -SrcBlob WI-EXCH-01-2014-11-27.vhd -SrcContainer vhds -Context $SrcStorageContext -DestContainer vhds -DestContext $DestStorageContext

#Copy all blob from container to another container
Get-AzureStorageBlob -Container vhds -Context $SrcStorageContext | Start-AzureStorageBlobCopy -DestContainer vhds -DestContext $DestStorageContext

#Copy blob from URI container to another container
$BlobUri = "https://Storage01.blob.core.windows.net/vhds/"
$BlobsCopy = Start-AzureStorageBlobCopy -AbsoluteUri $BlobUri -DestContainer vhds -DestContext $DestStorageContext

#Get Copy State
$BlobsCopy | Get-AzureStorageBlobCopyState