#Create New Azure Storage Account
New-AzureStorageAccount -StorageAccountName "pshdclstrstorage" -Location "East US"

#Create New Azure Storage Container
$StorageAccountName = "pshdclstrstorage"
$StorageAccountKey = Get-AzureStorageKey pshdclstrstorage | %{$_.Primary}
$storageContext = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey
New-AzureStorageContainer -Name "storageforcluster" -Context $storageContext

#Create New Azure HDInsight Cluster
$ClusterName = "pshdclstr"
$ClusterStorageAccountName = "pshdclstrstorage.blob.core.windows.net"
$ClusterStorageContainer = "storageforcluster"
$ClusterSize = 1
New-AzureHDInsightCluster -Name $ClusterName -Location "East US" -DefaultStorageAccountName $ClusterStorageAccountName -DefaultStorageAccountKey $StorageAccountKey -DefaultStorageContainerName $ClusterStorageContainer -ClusterSizeInNodes $ClusterSize

#Get the newly created cluster information
Get-AzureHDInsightCluster -Name $ClusterName


