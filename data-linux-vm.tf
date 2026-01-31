data "azurerm_virtual_machine" "linux" {
  provider            = azurerm.vm_sub
  name                = "<LINUX VM NAME>"
  resource_group_name = "<RG NAME OF LINUX VM>"
}