resource "azurerm_monitor_data_collection_rule" "cef" {
  name                = "DCR-CEF-TERRAFORM"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  destinations {
    log_analytics {
      name                  = "lawdest"
      workspace_resource_id = azurerm_log_analytics_workspace.law.id
    }
  }

  data_sources {
    syslog {
      name           = "cef"
      streams        = ["Microsoft-CommonSecurityLog"]
      facility_names = ["*"]
      log_levels     = ["*"]
    }
  }

  data_flow {
    streams      = ["Microsoft-CommonSecurityLog"]
    destinations = ["lawdest"]
  }
}