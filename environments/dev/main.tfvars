env      = "dev"

image_id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Compute/images/image"
network_interface_id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Network/virtualNetworks/workstation-vnet/subnets/default"
zone = "harshaldevops.online"
azurerm_network_security_group_name = "allow_all"

databases = {
        mongodb  = {
            rgname = "ukwest"
        }
        mysql    = {
            rgname = "ukwest"
        }
        rabbitmq = {
            rgname = "ukwest"
        }
        redis    = {
            rgname = "ukwest"
        }
  }

applications = {
    catalogue = {}
    payment   = {}
    shipping  = {}
    dispatch  = {}
    user      = {}
    cart      = {}
    frontend  = {}
}

rg_name = {
    ukwest = {
        location = "UK West"
    }
}