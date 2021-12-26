$resourceGroupName = "rg-blazorOnAks"
$clusterName = "aks-mkaey"
$nodeResourceGroupName = "rg-delegate-$clusterName"
$registryName = "acrmkaey"
$subscriptionId = az account show --query id
$keyVaultName = "kv-mkaey"

# cluster managed identity
$managedIdentity = az aks show -g $resourceGroupName -n $clusterName --query identityProfile.kubeletidentity.clientId -o tsv

Import-Module -Name PSKubectlCompletion
Register-KubectlCompletion