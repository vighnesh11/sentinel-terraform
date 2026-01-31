data "azurerm_virtual_machine" "windows" {
  provider            = azurerm.vm_sub
  name                = "<WINDOWS VM NAME>"
  resource_group_name = "<RG NAME OF WINDOWS VM>"
}