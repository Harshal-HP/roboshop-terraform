env      = "dev"

image_id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Compute/images/image"
network_interface_id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Network/virtualNetworks/workstation-vnet/subnets/default"
zone = "harshaldevops.online"
azurerm_network_security_group_id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Network/networkSecurityGroups/allow_all"
dns_record_gp_name = "devops_project_ecom"

rg_name = {
    ukwest = {
        location = "UK West"
    }
}

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
    catalogue = {
        rgname = "ukwest"
    }
    payment   = {
        rgname = "ukwest"
    }
    shipping  = {
        rgname = "ukwest"
    }
    dispatch  = {
        rgname = "ukwest"
    }
    user      = {
        rgname = "ukwest"
    }
    cart      = {
        rgname = "ukwest"
    }
    frontend  = {
        rgname = "ukwest"
    }
}


# rg_name = {
#     ukwest = {
#         location = "UK West"
#     }
#     uksouth = {
#         location = "UK South"
#     }
# }

# databases = {
#     ukwest = {
#        db_name = "mongodb"
#     }
#     uksouth = {
#         db_name = "mysql"
#     }
#   }