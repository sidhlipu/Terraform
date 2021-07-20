# Azure Notificatio Hub

**Build:**

code is tested with 2.54.0 version of provider

# Resource Group
This module doesn't create a resource group.  Either an existing resource group name and location can be provided or use the  [Resource group module](https://bitbucket.honeywell.com/projects/HCETMR/repos/azure-resource-group/browse) to create new resource group.

# Refer the example directory for the usage examples

# Module Usage
```hcl

module "rg" {
  source                  =  "https://artifactory-na.honeywell.com/artifactory/hceterraformregistry-deploy-generic-stable-local/azure-resource-group-0.1.14.zip"
  resource_group_name      = "notification-hub-rg"
  resource_group_location  = "East US"
}


module notificationhub{
  source                             = "https://artifactory-na.honeywell.com/artifactory/hceterraformregistry-deploy-generic-stable-local/azure-notification-hub-0.1.1.zip"
  azurerm_ns_type                    = "NotificationHub"
  azurerm_ns_name                    = "notification-hub-ns"
  azurerm_sku                        = "Free"
  azurerm_notification_hub_name      =  "samplenotificationhub"
  azurerm_notification_hub_rule_name =  "testrule"
  azurerm_resource_group = module.rg.resource_group_name
  azurerm_resource_group_location =  module.rg.resource_group_location
}


```

# Module OutPut referance
```hcl
output "notification_hub_id" {
  value = module.notificationhub.notification_hub_id
}

output "notification_hub_ns_id" {
  value = module.notificationhub.notification_hub_ns_id
}
```
