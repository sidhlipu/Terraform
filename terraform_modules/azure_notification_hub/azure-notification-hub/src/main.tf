resource "azurerm_notification_hub_namespace" "notification_hub_ns" {
  name                = var.azurerm_ns_name
  resource_group_name = var.azurerm_resource_group
  location            = var.azurerm_resource_group_location
  namespace_type      = var.azurerm_ns_type

  sku_name = var.azurerm_sku
}



resource "azurerm_notification_hub" "notification_hub" {
  name                = var.azurerm_notification_hub_name
  namespace_name      = azurerm_notification_hub_namespace.notification_hub_ns.name
  resource_group_name = var.azurerm_resource_group
  location            = azurerm_notification_hub_namespace.notification_hub_ns.location

}


resource "azurerm_notification_hub_authorization_rule" "notification_hub_rule" {
  name                  = var.azurerm_notification_hub_rule_name
  notification_hub_name = azurerm_notification_hub.notification_hub.name
  namespace_name        = azurerm_notification_hub_namespace.notification_hub_ns.name
  resource_group_name   = var.azurerm_resource_group
  manage                = true
  send                  = true
  listen                = true
}
