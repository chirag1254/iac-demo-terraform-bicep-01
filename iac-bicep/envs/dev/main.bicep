param rgName string = 'iac-modular-rg'
param location string = 'eastus'
targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
}

module networkModule '../../modules/network.bicep' = {
  name: 'networkDeploy'
  scope: rg
  params: {
    rgName: rg.name
    location: location
    vnetName: 'iac-modular-vnet'
    addressSpace: ['10.0.0.0/16']
    subnetName: 'app-subnet'
    subnetPrefix: '10.0.1.0/24'
  }
}

module storageModule '../../modules/storage.bicep' = {
  name: 'storageDeploy'
  scope: rg
  params: {
    rgName: rg.name
    location: location
    storageName: 'iacmodularstorage01'
    skuName: 'Standard_LRS'
  }
}
