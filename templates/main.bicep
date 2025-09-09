param environmentName string
param location string = resourceGroup().location

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: '${environmentName}-plan'
  location: location
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
  properties: {}
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: '${environmentName}-web'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}
