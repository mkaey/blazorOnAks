# pod identities
$managedIdentity = az aks show -g $resourceGroupName -n $clusterName --query identityProfile.kubeletidentity.clientId -o tsv

# Assign roles to MI
az role assignment create --role "Managed Identity Operator" --assignee $managedIdentity --scope "/subscriptions/$subscriptionId/resourcegroups/$nodeResourceGroupName"
az role assignment create --role "Virtual Machine Contributor" --assignee $managedIdentity --scope "/subscriptions/$subscriptionId/resourcegroups/$nodeResourceGroupName"

# add pod identity provider
helm repo add aad-pod-identity https://raw.githubusercontent.com/Azure/aad-pod-identity/master/charts
helm install aad-pod-identity aad-pod-identity/aad-pod-identity

# enable mi on vmss
$vmssName = az vmss list -g $nodeResourceGroupName --query [0].name 
az vmss identity assign -g $nodeResourceGroupName -n $vmssName


# add keyvault provider
helm repo add csi-secrets-store-provider-azure https://raw.githubusercontent.com/Azure/secrets-store-csi-driver-provider-azure/master/charts
helm install csi-secrets-store-provider-azure/csi-secrets-store-provider-azure --generate-name --set secrets-store-csi-driver.syncSecret.enabled=true


# assign kv access to vmss
