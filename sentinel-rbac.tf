resource "azurerm_role_assignment" "sentinel_reader" {
  for_each = {
    soc_l1 = var.sentinel_rbac_groups["soc_l1"]
    cse_l1 = var.sentinel_rbac_groups["cse_l1"]
  }

  scope                = data.azurerm_resource_group.sentinel_rg.id
  role_definition_name = "Microsoft Sentinel Reader"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "sentinel_responder" {
  scope                = data.azurerm_resource_group.sentinel_rg.id
  role_definition_name = "Microsoft Sentinel Responder"
  principal_id         = var.sentinel_rbac_groups["soc_l2"]
}

resource "azurerm_role_assignment" "sentinel_contributor" {
  for_each = {
    soc_l1 = var.sentinel_rbac_groups["soc_l3"]
    cse_l1 = var.sentinel_rbac_groups["cse_l2"]
  }

  scope                = data.azurerm_resource_group.sentinel_rg.id
  role_definition_name = "Microsoft Sentinel Contributor"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "law_reader" {
  for_each = {
    soc_l1 = var.sentinel_rbac_groups["soc_l1"]
    cse_l1 = var.sentinel_rbac_groups["cse_l1"]
  }

  scope                = data.azurerm_resource_group.sentinel_rg.id
  role_definition_name = "Log Analytics Reader"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "law_contributor" {
  for_each = {
    soc_l1 = var.sentinel_rbac_groups["soc_l3"]
    cse_l1 = var.sentinel_rbac_groups["cse_l2"]
  }

  scope                = data.azurerm_resource_group.sentinel_rg.id
  role_definition_name = "Log Analytics Contributor"
  principal_id         = each.value
}
