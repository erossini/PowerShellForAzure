##Working with Hive - Option 1##
$ClusterName = "pshdclstr"

#identify the source storage
$StorageAccountName = "pshdclstrstorage"
$StorageAccountKey = Get-AzureStorageKey pshdclstrstorage | %{$_.Primary}
$storageContext = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey
Set-AzureStorageBlobContent -File "c:\\airlinedata.csv" -Container "data" -Blob "airlinesdata" -context $storageContext

#identify the cluster
Use-AzureHDInsightCluster -ClusterName $ClusterName

#create the query
$q= "CREATE EXTERNAL TABLE airlines(QUARTER string,UNIQUE_CARRIER string,UNIQUE_CARRIER_NAME string,CARRIER_NAME string,ORIGIN_AIRPORT_ID int,ORIGIN string,ORIGIN_CITY_NAME string,SERVICE_CLASS string,REV_PAX_ENP_110 float) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE LOCATION 'wasb://data@pshdclstrstorage.blob.core.windows.net/';"

#invoke the query
Invoke-Hive -Query $q

#invoke sample query to retrieve the table creation confirmation
Invoke-Hive -Query "show tables;"

#run a simple count on table
$q2 = "select count(1) from airlines"
Invoke-Hive -Query $q2  

#get the result of the undelying map\reduce job
Get-AzureHDInsightJob -Cluster pshdclstr -JobId "job_1421053567758_0019"

#another query sample to run
Invoke-Hive -Query "select * from airlines LIMIT 5;"
