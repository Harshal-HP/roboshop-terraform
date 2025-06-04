resource "azurerm_public_ip" "publicip" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.rg_name
  allocation_method     = "Static"
}

resource "azurerm_network_interface" "privateip" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.rg_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = var.network_interface_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.rg_name
  network_interface_ids         = [azurerm_network_interface.privateip.id]
  vm_size                       = "Standard_B2s"
  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true
  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true
  
  storage_image_reference {
    id = var.image_id
  }
  
  storage_os_disk {
    name              = "${var.name}-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  
  os_profile {
    computer_name  = var.name
    admin_username = "harshal"
    admin_password = "harshal@12345"
  }
  
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "dns_record" {
  name                  = "${var.name}-dev"
  zone_name             = var.zone
  resource_group_name   = var.rg_name
  ttl                   = 60
  records               = [azurerm_network_interface.privateip.private_ip_address]
}