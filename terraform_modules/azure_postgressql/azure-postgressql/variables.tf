variable azurerm_resource_group {
  type    = string
}

variable azurerm_location {
  type    = string
}

variable azurerm_postgreserver_username {
  type    = string
}

variable azurerm_postgreserver_password {
  type    = string
}

variable azurerm_postgreserver_name {
  type    = string
}

variable azurerm_postgreserver_sku_name {
  type    = string
  default = "GP_Gen5_4"
}

variable azurerm_postgreserver_storage_mb {
  type    = string
  default = "10240"
}

variable azurerm_postgreserver_backup_retention_days {
  type    = string
  default = "7"
}

variable azurerm_postgreserver_geo_redundant_backup_enabled {
  type    = string
  default = "true"
}

variable azurerm_postgreserver_auto_grow_enabled {
  type    = string
  default = "true"
}

variable azurerm_postgreserver_version {
  type    = string
  default = "11"
}

variable azurerm_postgreserver_public_network_access_enabled {
  type    = string
  default = "false"
}

variable azurerm_postgreserver_ssl_enforcement_enabled {
  type    = string
  default = "true"
}

variable azurerm_postgreserver_ssl_minimal_tls_version_enforced {
  type    = string
  default = "TLS1_2"
}

variable azurerm_log_analytics_workspace_id {
  type = string
}

variable azurerm_log_analytics_subscription_id {
  type = string
}

variable azurerm_log_analytics_client_id {
  type = string
}

variable azurerm_log_analytics_client_secret {
  type    = string
}

variable azurerm_log_analytics_tenant_id {
  type    = string
}
