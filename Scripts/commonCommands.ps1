$resourceGroupName = "rg-blazorOnAks"
$clusterName = "aks-mkaey"
$nodeResourceGroupName = "rg-delegate-$clusterName"
$registryName = "acrmkaey"
$subscriptionId = az account show --query id

Import-Module -Name PSKubectlCompletion
Register-KubectlCompletion