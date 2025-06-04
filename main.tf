provider "azurerm" {
  features {}
  subscription_id = "4a491ea7-cd6d-4ec6-aa18-28b31973e70c"
}

resource "azurerm_public_ip" "frontend" {
  name                = "frontend"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "frontend" {
  name                = "frontend"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"

  ip_configuration {
    name                          = "frontend"
    subnet_id                     = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Network/virtualNetworks/workstation-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "frontend" {
  name                  = "frontend"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  network_interface_ids = [azurerm_network_interface.frontend.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Compute/images/image"
  }
  storage_os_disk {
    name              = "frontend-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "frontend"
    admin_username = "harshal"
    admin_password = "harshal@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_public_ip" "mongodb" {
  name                = "mongodb"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "mongodb" {
  name                = "mongodb"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"

  ip_configuration {
    name                          = "mongodb"
    subnet_id                     = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Network/virtualNetworks/workstation-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "mongodb" {
  name                  = "mongodb"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  network_interface_ids = [azurerm_network_interface.mongodb.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Compute/images/image"
  }
  storage_os_disk {
    name              = "mongodb-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "mongodb"
    admin_username = "harshal"
    admin_password = "harshal@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_public_ip" "catalogue" {
  name                = "catalogue"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "catalogue" {
  name                = "catalogue"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"

  ip_configuration {
    name                          = "catalogue"
    subnet_id                     = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Network/virtualNetworks/workstation-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "catalogue" {
  name                  = "catalogue"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  network_interface_ids = [azurerm_network_interface.catalogue.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Compute/images/image"
  }
  storage_os_disk {
    name              = "catalogue-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "catalogue"
    admin_username = "harshal"
    admin_password = "harshal@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_public_ip" "redis" {
  name                = "redis"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "redis" {
  name                = "redis"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"

  ip_configuration {
    name                          = "redis"
    subnet_id                     = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Network/virtualNetworks/workstation-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "redis" {
  name                  = "redis"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  network_interface_ids = [azurerm_network_interface.redis.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Compute/images/image"
  }
  storage_os_disk {
    name              = "redis-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "redis"
    admin_username = "harshal"
    admin_password = "harshal@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_public_ip" "user" {
  name                = "user"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "user" {
  name                = "user"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"

  ip_configuration {
    name                          = "user"
    subnet_id                     = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Network/virtualNetworks/workstation-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "user" {
  name                  = "user"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  network_interface_ids = [azurerm_network_interface.user.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Compute/images/image"
  }
  storage_os_disk {
    name              = "user-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "user"
    admin_username = "harshal"
    admin_password = "harshal@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_public_ip" "cart" {
  name                = "cart"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "cart" {
  name                = "cart"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"

  ip_configuration {
    name                          = "cart"
    subnet_id                     = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Network/virtualNetworks/workstation-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "cart" {
  name                  = "cart"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  network_interface_ids = [azurerm_network_interface.cart.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Compute/images/image"
  }
  storage_os_disk {
    name              = "cart-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "cart"
    admin_username = "harshal"
    admin_password = "harshal@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_public_ip" "mysql" {
  name                = "mysql"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "mysql" {
  name                = "mysql"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"

  ip_configuration {
    name                          = "mysql"
    subnet_id                     = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Network/virtualNetworks/workstation-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "mysql" {
  name                  = "mysql"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  network_interface_ids = [azurerm_network_interface.mysql.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Compute/images/image"
  }
  storage_os_disk {
    name              = "mysql-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "mysql"
    admin_username = "harshal"
    admin_password = "harshal@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_public_ip" "shipping" {
  name                = "shipping"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "shipping" {
  name                = "shipping"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"

  ip_configuration {
    name                          = "shipping"
    subnet_id                     = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Network/virtualNetworks/workstation-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "shipping" {
  name                  = "shipping"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  network_interface_ids = [azurerm_network_interface.shipping.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Compute/images/image"
  }
  storage_os_disk {
    name              = "shipping-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "shipping"
    admin_username = "harshal"
    admin_password = "harshal@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_public_ip" "rabbitmq" {
  name                = "rabbitmq"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "rabbitmq" {
  name                = "rabbitmq"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"

  ip_configuration {
    name                          = "rabbitmq"
    subnet_id                     = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Network/virtualNetworks/workstation-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "rabbitmq" {
  name                  = "rabbitmq"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  network_interface_ids = [azurerm_network_interface.rabbitmq.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Compute/images/image"
  }
  storage_os_disk {
    name              = "rabbitmq-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "rabbitmq"
    admin_username = "harshal"
    admin_password = "harshal@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_public_ip" "payment" {
  name                = "payment"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "payment" {
  name                = "payment"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"

  ip_configuration {
    name                          = "payment"
    subnet_id                     = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Network/virtualNetworks/workstation-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "payment" {
  name                  = "payment"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  network_interface_ids = [azurerm_network_interface.payment.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Compute/images/image"
  }
  storage_os_disk {
    name              = "payment-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "payment"
    admin_username = "harshal"
    admin_password = "harshal@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_public_ip" "dispatch" {
  name                = "dispatch"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "dispatch" {
  name                = "dispatch"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"

  ip_configuration {
    name                          = "dispatch"
    subnet_id                     = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Network/virtualNetworks/workstation-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "dispatch" {
  name                  = "dispatch"
  location              = "UK West"
  resource_group_name   = "devops_project_ecom"
  network_interface_ids = [azurerm_network_interface.dispatch.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Compute/images/image"
  }
  storage_os_disk {
    name              = "dispatch-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "dispatch"
    admin_username = "harshal"
    admin_password = "harshal@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}