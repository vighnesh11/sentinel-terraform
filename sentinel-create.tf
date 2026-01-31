resource "azapi_resource" "sentinel" {
  type      = "Microsoft.SecurityInsights/onboardingStates@2022-11-01"
  name      = "default"
  parent_id = azurerm_log_analytics_workspace.law.id

  body = {
    properties = {}
  }
}