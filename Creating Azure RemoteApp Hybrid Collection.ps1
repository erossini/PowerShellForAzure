# Create Azure RemoteApp Hybrid Collection
New-AzureRemoteAppCollection -CollectionName 'col1' `
-ImageName 'RemoteAppTemplateWithChrome' `
-Plan Basic `
-Description 'Chrome Application'
-VNetName 'S2SvNET' `
-SubnetName 'ARAsubnet' `
-Domain 'Company123.com' `
-Credentials (Get-Credential ServiceAccount@Company123.com'