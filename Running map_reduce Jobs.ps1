##Running map\reduce Jobs##
#initiate a map\reduce job
$wordCountJob = New-AzureHDInsightMapReduceJobDefinition -JarFile "wasb:///example/jars/hadoop-mapreduce-examples.jar" -ClassName "wordcount" -Arguments "wasb:///example/data/gutenberg/ulysses.txt", "wasb:///example/data/WordCountOutput2"

#Run map\reduce job
$wordCountJob | Start-AzureHDInsightJob -Cluster pshdclstr | Wait-AzureHDInsightJob -WaitTimeoutInSeconds 3600 | %{ Get-AzureHDInsightJobOutput -Cluster pshdclstr -JobId $_.JobId -StandardError} 

#Retrieve the map\reduce job results
$StorageAccountName = "pshdclstrstorage"
$StorageAccountKey = Get-AzureStorageKey pshdclstrstorage | %{$_.Primary}
$storageContext = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey
Get-AzureStorageBlobContent -Container pshdclstr -Blob example/data/WordCountOutput2/part-r-00000 -Context $storageContext -Force 
cat ./example/data/WordCountOutput2/part-r-00000 | findstr "book"
