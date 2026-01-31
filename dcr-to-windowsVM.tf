resource "azurerm_monitor_data_collection_rule_association" "windows_security_assoc" {
  name                    = "windows-security-assoc"
  target_resource_id      = data.azurerm_virtual_machine.windows.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.windows_security.id
}