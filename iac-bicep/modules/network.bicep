param rgName string
param location string
param vnetName string
param addressSpace array
param subnetName string
param subnetPrefix string

resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: { addressPrefixes: addressSpace }
    subnets: [
      {
        name: subnetName
        properties: { addressPrefix: subnetPrefix }
      }
    ]
  }
}

output vnetId string = vnet.id
