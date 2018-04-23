$ClusterName = "pshdclstr"

#Specify the Jar file location
$JarFilePath = "/example/jars/hadoop-mapreduce-examples.jar"

#Define the Job class name within the JarFile
$ClassName = "wordcount"

#Define the MapReduce Job
$wordCountJob = New-AzureHDInsightMapReduceJobDefinition -JarFile $JarFilePath -ClassName $ClassName -Arguments "/example/data/gutenberg/ulysses.txt", "/example/data/WordCountOutput2"

$wordCountJob | Start-AzureHDInsightJob -Cluster $ClusterName | Wait-AzureHDInsightJob -WaitTimeoutInSeconds 3600 | %{Get-AzureHDInsightJobOutput -Cluster $ClusterName -JobId $_.JobId -StandardError}


$StorageAccountName = "pshdclstrstorage"
$StorageAccountKey = Get-AzureStorageKey pshdclstrstorage | %{$_.Primary}
$storageContext = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey
Get-AzureStorageBlobContent -Container storageforcluster -Blob "example/data/WordCountOutput2/part-r-00000" -Context $storageContext -Force

Get-Content "./example/data/WordCountOutput2/part-r-00000" | findstr "book"
