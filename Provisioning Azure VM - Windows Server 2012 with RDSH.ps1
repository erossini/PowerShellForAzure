# Provision Azure VM - Windows Server 2012 with RDSH
$RemoteAppVM = New-AzureQuickVM -Windows `
-Name RemoteAppTemplate `
-ServiceName 'myRemoteAppTemplates' `
-ImageName $RDSH_Image.ImageName `
-Password Microsoft@123 `
-AdminUsername SherifT `
-AffinityGroup "AAGWE01" `
-InstanceSize $RDSH_Image.RecommendedVMSize

# Generate RDP file
$FileName = $RemoteAppVM.Name + ".rdp"
Get-AzureRemoteDesktopFile -ServiceName $RemoteAppVM.ServiceName -Name $RemoteAppVM.Name -LocalPath $home\Desktop\AzureRDPs\$FileName