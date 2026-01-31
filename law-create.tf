resource "azurerm_log_analytics_workspace" "law" {
  name                = "LAW-TERRAFORM"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku               = "PerGB2018"
  retention_in_days = 30

  internet_ingestion_enabled = true
  internet_query_enabled     = true
}