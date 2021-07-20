provider "azurerm" {
  alias           ="corp_subscription"
  subscription_id =  var.azurerm_log_analytics_subscription_id
  client_id       =  var.azurerm_log_analytics_client_id
  client_secret   =  var.azurerm_log_analytics_client_secret
  tenant_id       =  var.azurerm_log_analytics_tenant_id
      
  features {        
  }

  skip_provider_registration=true
}

resource "random_string" "random" {
  length = 6
  special = false
  upper = false
}

resource "azurerm_postgresql_server" "example" {
  name                = var.azurerm_postgreserver_name
  location            = var.azurerm_location 
  resource_group_name = var.azurerm_resource_group 
  sku_name                          = var.azurerm_postgreserver_sku_name
  administrator_login               = var.azurerm_postgreserver_username
  administrator_login_password      = var.azurerm_postgreserver_password
  storage_mb                        = var.azurerm_postgreserver_storage_mb
  backup_retention_days             = var.azurerm_postgreserver_backup_retention_days
  geo_redundant_backup_enabled      = var.azurerm_postgreserver_geo_redundant_backup_enabled
  auto_grow_enabled                 = var.azurerm_postgreserver_auto_grow_enabled
  version                           = var.azurerm_postgreserver_version
  public_network_access_enabled     = var.azurerm_postgreserver_public_network_access_enabled
  ssl_enforcement_enabled           = var.azurerm_postgreserver_ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced  = var.azurerm_postgreserver_ssl_minimal_tls_version_enforced
}

resource "azurerm_postgresql_configuration" "backslash_quote" {
  name                = "backslash_quote"
  resource_group_name = var.azurerm_resource_group 
  server_name         = azurerm_postgresql_server.example.name
  value               = "on"
}


resource "azurerm_postgresql_configuration" "pg_qs_query_capture_mode" {
  name                = "pg_qs.query_capture_mode"
  resource_group_name = var.azurerm_resource_group 
  server_name         = azurerm_postgresql_server.example.name
  value               = "NONE"
}

 
resource "azurerm_postgresql_configuration" "pg_stat_statements_track" {
 name                = "pg_stat_statements.track"
 resource_group_name = var.azurerm_resource_group
 server_name         = azurerm_postgresql_server.example.name
 value               = "NONE"
}

resource "azurerm_monitor_diagnostic_setting" "monitoring" {
  provider                    = azurerm.corp_subscription
  name                        = "monitoring_postgresql"
  target_resource_id          = azurerm_postgresql_server.example.id
  log_analytics_workspace_id  = var.azurerm_log_analytics_workspace_id
  
  log {
    category = "PostgreSQLLogs"
    enabled  = true
  }
   metric {
    category = "AllMetrics"
    }
}