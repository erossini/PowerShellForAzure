# Create Azure RemoteApp Cloud Collection
New-AzureRemoteAppCollection -CollectionName 'col1' `
-ImageName 'RemoteAppTemplateWithChrome' `
-Plan Basic `
-Location 'North Europe' `
-Description 'Chrome Application'

# Track Status of Collection Provisioning Process
Get-AzureRemoteAppOperationResult -TrackingId 71a3dc4c-9818-494c-aa11-2f4a03e01e00 | fl