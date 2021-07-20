module "rg" {
  source                  =  "https://artifactory-na.honeywell.com/artifactory/hceterraformregistry-deploy-generic-stable-local/azure-resource-group-0.1.14.zip"
  resource_group_name      = "sid-test-rg"
  resource_group_location  = "East US"
}


module notificationhub{
  source               ="../.."
  azurerm_ns_type                    = "NotificationHub"
  azurerm_ns_name                    = "sidtestns"
  azurerm_sku                        = "Free"
  azurerm_notification_hub_name      =  "samplenotificationhub"
  azurerm_notification_hub_rule_name =  "testrule"
  azurerm_resource_group = module.rg.resource_group_name
  azurerm_resource_group_location =  module.rg.resource_group_location
}


output "notification_hub_id" {
  value = module.notificationhub.notification_hub_id
}

output "notification_hub_ns_id" {
  value = module.notificationhub.notification_hub_ns_id
}
