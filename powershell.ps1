# Login to Azure (Comment this out if you are already logged in)
# Connect-AzAccount

# Variables
$resourceGroupName = "example-resources"
$location = "East US"
$storageAccountName = "examplestoraccount"

# Create Resource Group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create Storage Account
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName `
                                       -Name $storageAccountName `
                                       -Location $location `
                                       -SkuName "Standard_LRS" `
                                       -Kind "StorageV2" `
                                       -AccessTier "Hot"

# Retrieve Storage Account Key
$storageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName)[0].Value

# Output the Storage Account Key
Write-Output "Storage Account Primary Key: $storageAccountKey"