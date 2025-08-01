resource "azurerm_kubernetes_cluster" "main" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "roboshop"

  default_node_pool {
    name       = "default"
    node_count = var.default_node_pool[ "nodes" ]
    vm_size    = var.default_node_pool[ "vm_size" ]
    vnet_subnet_id = var.network_interface_id
  }

  identity {
    type = "SystemAssigned"
  }

  aci_connector_linux {
    subnet_name = var.network_interface_id
  }

  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.100.0.0/24"
    dns_service_ip = "10.100.0.10"
  }
  lifecycle {
    ignore_changes = [
      default_node_pool
    ]
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "main" {
  for_each = var.app_node_pool
  name = each.key
  kubernetes_cluster_id = azurerm_kubernetes_cluster.main.id
  vm_size = each.value[ "vm_size" ]
  min_count = each.value[ "min_count" ]
  max_count = each.value[ "max_count" ]
  node_count = each.value[ "min_count" ]
  auto_scaling_enabled = each.value[ "auto_scaling_enabled" ]
  node_labels = each.value["node_labels"]
  temporary_name_for_rotation = "${each.key}temp"
  vnet_subnet_id = var.network_interface_id
}

resource "azurerm_role_assignment" "ACRtoAKS" {
  depends_on                       = [ azurerm_kubernetes_cluster.main]
  principal_id                     = azurerm_kubernetes_cluster.main.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = data.azurerm_container_registry.acr.id
}