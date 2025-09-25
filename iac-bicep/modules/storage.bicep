param rgName string
param location string
param storageName string
param skuName string

resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageName
  location: location
  sku: { name: skuName }
  kind: 'StorageV2'
}

output storageId string = storage.id
