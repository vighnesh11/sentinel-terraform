resource "azurerm_monitor_diagnostic_setting" "azure_activity" {
  for_each                   = var.activity_log_subscriptions
  name                       = "send-azure-activity-to-law"
  target_resource_id         = "/subscriptions/${each.value}"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  enabled_log {
    category = "Administrative"
  }

  enabled_log {
    category = "Security"
  }

  enabled_log {
    category = "Policy"
  }

  enabled_log {
    category = "Alert"
  }

  enabled_log {
    category = "Recommendation"
  }

  enabled_log {
    category = "ServiceHealth"
  }

  enabled_log {
    category = "Autoscale"
  }

  enabled_log {
    category = "ResourceHealth"
  }
}
