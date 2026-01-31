data "azurerm_subscription" "current" {}

resource "azurerm_lighthouse_definition" "sentinel_mssp" {
  name               = "sentinel-mssp-lighthouse"
  description        = "Delegated access for MSSP to manage Microsoft Sentinel"
  managing_tenant_id = var.mssp_tenant_id
  scope              = data.azurerm_subscription.current.id

  authorization {
    principal_id           = var.mssp_principal_id
    principal_display_name = "MSSP SOC Team"
    role_definition_id     = "3e150937-8f8e-4cfb-8069-0eaf05ecd056" # Sentinel Reader
  }

  authorization {
    principal_id           = var.mssp_principal_id
    principal_display_name = "MSSP SOC Team"
    role_definition_id     = "8d289c81-5878-46d4-8554-54e1e3d8b5cb" # Sentinel Responder
  }
}

resource "azurerm_lighthouse_assignment" "sentinel_mssp" {
  scope                       = data.azurerm_subscription.current.id
  lighthouse_definition_id    = azurerm_lighthouse_definition.sentinel_mssp.id
}