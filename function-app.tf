data "azurerm_resource_group" "sentinel_rg" {
  name = azurerm_resource_group.rg.name
}

resource "azurerm_storage_account" "function_sa" {
  name                     = "sentinelfnsa001"
  resource_group_name      = data.azurerm_resource_group.sentinel_rg.name
  location                 = data.azurerm_resource_group.sentinel_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_nested_items_to_be_public = false
}

resource "azurerm_service_plan" "function_plan" {
  name                = "ASP-TERRAFORM"
  resource_group_name = data.azurerm_resource_group.sentinel_rg.name
  location            = data.azurerm_resource_group.sentinel_rg.location

  os_type  = "Linux"
  sku_name = "Y1"
}

resource "azurerm_linux_function_app" "sentinel_function" {
  name                = "FA-TERRAFORM"
  resource_group_name = data.azurerm_resource_group.sentinel_rg.name
  location            = data.azurerm_resource_group.sentinel_rg.location

  service_plan_id = azurerm_service_plan.function_plan.id

  storage_account_name       = azurerm_storage_account.function_sa.name
  storage_account_access_key = azurerm_storage_account.function_sa.primary_access_key

  identity {
    type = "SystemAssigned"
  }

  site_config {
    application_stack {
      python_version = "3.11"
    }
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "python"
    WEBSITE_RUN_FROM_PACKAGE = "1"
  }
}
