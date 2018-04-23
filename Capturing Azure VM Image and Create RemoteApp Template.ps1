# Capture Azure VM Image
Save-AzureVMImage -ServiceName 'myRemoteAppTemplates' `
-Name 'RemoteAppTemplate' `
-ImageName "RemoteAppTemplatev1" `
-ImageLabel "my Azure RemoteApp Template" `
-OSState Generalized

# Create Azure RemoteApp Template Image
New-AzureRemoteAppTemplateImage -ImageName RemoteAppwithChrome -Location 'North Europe' -AzureVmImageName ' RemoteAppTemplatev1'

# Rename RemoteApp Template Image
Rename-AzureRemoteAppTemplateImage -ImageName RemoteAppTemplateWithChrome -NewName RemoteAppTemplateWithLOBs