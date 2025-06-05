data "azurerm_network_security_group" "nsg" {
  name                = var.azurerm_network_security_group_name
  resource_group_name = var.rg_name
}
