resource "azurerm_monitor_data_collection_rule_association" "cef_assoc" {
  name                    = "cef-association"
  target_resource_id      = data.azurerm_virtual_machine.linux.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.cef.id
}