param postfix string
param sqlUser string
@secure()
param sqlPassword string

var serverName = 'sql-${postfix}'
var dbName = 'sqldb--${postfix}'

resource sqlServer 'Microsoft.Sql/servers@2014-04-01' = {
  name: serverName
  location: resourceGroup().location
  properties: {
    administratorLogin: sqlUser
    administratorLoginPassword: sqlPassword
  }
}

resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
  parent: sqlServer
  name: dbName
  location: resourceGroup().location
  properties: {
    createMode: 'Default'
    edition: 'Basic'
    requestedServiceObjectiveName: 'Basic'
  }
}
