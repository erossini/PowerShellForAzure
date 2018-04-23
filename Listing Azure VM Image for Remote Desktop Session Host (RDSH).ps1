# List Azure VM Image for Remote Desktop Session Host (RDSH)
$RDSH_Image = Get-AzureVMImage | `
Where Label -like "Windows Server Remote Desktop Session Host*" | `
Select Label, ImageName, PublishedDate, RecommendedVMSize | `
Sort PublishedDate -Descending | `
Select -First 1 | fl

$RDSH_Image