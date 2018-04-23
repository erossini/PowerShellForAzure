##Working with Hive - Option 2##

#Create the job
$hiveJobDef = New-AzureHDInsightHiveJobDefinition -Query "select count(1) from airlines;"

#Run the job
$hiveJob = Start-AzureHDInsightJob -Cluster pshdclstr -JobDefinition $hiveJobDef 

Wait-AzureHDInsightJob -Job $hiveJob -WaitTimeoutInSeconds 3600

#Retrieve the results 
Get-AzureHDInsightJobOutput -Cluster pshdclstr -JobId $hiveJob.JobId

