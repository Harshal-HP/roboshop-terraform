resource "azurerm_kubernetes_cluster" "main" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "roboshop"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
    vnet_subnet_id = var.network_interface_id
  }

  identity {
    type = "SystemAssigned"
  }

  # aci_connector_linux {
  #   subnet_name = var.network_interface_id
  # }

  # network_profile {
  #   network_plugin = "azure"
  #   service_cidr   = "10.100.0.0/24"
  #   dns_service_ip = "10.100.0.10"
  # }

}