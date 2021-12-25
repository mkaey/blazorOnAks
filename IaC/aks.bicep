// az group create -n rg-blazorOnAks -l westeurope
// az ad sp create-for-rbac --name blazorOnAksGithub --role contributor --scopes /subscriptions/9bd80b22-3163-4980-aa11-f780fce86ad9/resourceGroups/rg-blazorOnAks --sdk-auth

param adminUserName string = 'aksAdmin'
@secure()
param sshRSAPublicKey string

var postfix = 'mkaey'
var aksName = 'aks-${postfix}'
var acrName = 'acr-${postfix}'

resource aksCluster 'Microsoft.ContainerService/managedClusters@2021-03-01' = {
  name: aksName
  location: resourceGroup().location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    kubernetesVersion: '1.22.4'
    dnsPrefix: 'mkaey'
    enableRBAC: true
    addonProfiles: {}
    agentPoolProfiles: [
      {
        name: 'agentpool'
        count: 1
        vmSize: 'Standard_B2MS'
        osType: 'Linux'
        mode: 'System'
      }
    ]
    linuxProfile: {
      adminUsername: adminUserName
      ssh: {
        publicKeys: [
          {
            keyData: sshRSAPublicKey
          }
        ]
      }
    }
  }
}

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2021-06-01-preview' = {
  name: acrName
  location: resourceGroup().location
  sku: {
    name: 'Basic'
  }
  properties: {
    publicNetworkAccess: 'Enabled'
    adminUserEnabled: true
  }
}
