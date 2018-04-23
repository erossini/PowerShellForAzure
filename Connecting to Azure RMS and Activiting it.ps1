#Connecting to Azure RMS Serivce
Connect-AadrmService -Credential (Get-Credential "admin@<YOUR_TENANT>.onmicrosoft.com")

#Get Azure RMS Configuration
Get-AadrmConfiguration

#Activating Azure RMS
If((Get-Aadrm) -eq 'Disabled')
{
    Enable-Aadrm
}
Else
{
    "Azure RMS is aleady enabled."
}

#Enable MS IPC v3 Platform
Enable-AadrmIPCv3Service

#Get Azure RMS support status for Devices
Get-AadrmDevicePlatform -All

