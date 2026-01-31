resource "azurerm_monitor_data_collection_rule" "windows_security" {
  name                = "DCR-WINDOWS-TERRAFORM"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  destinations {
    log_analytics {
      name                  = "lawdest"
      workspace_resource_id = azurerm_log_analytics_workspace.law.id
    }
  }

  data_flow {
    streams      = ["Microsoft-SecurityEvent"]
    destinations = ["lawdest"]
  }

  data_sources {
    windows_event_log {
      name    = "windows-security"
      streams = ["Microsoft-SecurityEvent"]

      x_path_queries = [
        "Security!*"
      ]
    }
  }
}