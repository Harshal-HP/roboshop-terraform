module "frontend" {
  source                            = "./component"
  name                              = "frontend"
  location                          = var.location
  rg_name                           = var.rg_name
  image_id                          = var.image_id
  network_interface_id              = var.network_interface_id
  zone                              = var.zone
  azurerm_network_security_group_id = var.azurerm_network_security_group_id
}

module "mongodb" {
  source                            = "./component"
  name                              = "mongodb"
  location                          = var.location
  rg_name                           = var.rg_name
  image_id                          = var.image_id
  network_interface_id              = var.network_interface_id
  zone                              = var.zone
  azurerm_network_security_group_id = var.azurerm_network_security_group_id
}

module "catalogue" {
  source                            = "./component"
  name                              = "catalogue"
  location                          = var.location
  rg_name                           = var.rg_name
  image_id                          = var.image_id
  network_interface_id              = var.network_interface_id
  zone                              = var.zone
  azurerm_network_security_group_id = var.azurerm_network_security_group_id
}

module "redis" {
  source                            = "./component"
  name                              = "redis"
  location                          = var.location
  rg_name                           = var.rg_name
  image_id                          = var.image_id
  network_interface_id              = var.network_interface_id
  zone                              = var.zone
  azurerm_network_security_group_id = var.azurerm_network_security_group_id
}

module "user" {
  source                            = "./component"
  name                              = "user"
  location                          = var.location
  rg_name                           = var.rg_name
  image_id                          = var.image_id
  network_interface_id              = var.network_interface_id
  zone                              = var.zone
  azurerm_network_security_group_id = var.azurerm_network_security_group_id
}

module "cart" {
  source                            = "./component"
  name                              = "cart"
  location                          = var.location
  rg_name                           = var.rg_name
  image_id                          = var.image_id
  network_interface_id              = var.network_interface_id
  zone                              = var.zone
  azurerm_network_security_group_id = var.azurerm_network_security_group_id
}

module "mysql" {
  source                            = "./component"
  name                              = "mysql"
  location                          = var.location
  rg_name                           = var.rg_name
  image_id                          = var.image_id
  network_interface_id              = var.network_interface_id
  zone                              = var.zone
  azurerm_network_security_group_id = var.azurerm_network_security_group_id
}

module "rabbitmq" {
  source                            = "./component"
  name                              = "rabbitmq"
  location                          = var.location
  rg_name                           = var.rg_name
  image_id                          = var.image_id
  network_interface_id              = var.network_interface_id
  zone                              = var.zone
  azurerm_network_security_group_id = var.azurerm_network_security_group_id
}

module "payment" {
  source                            = "./component"
  name                              = "payment"
  location                          = var.location
  rg_name                           = var.rg_name
  image_id                          = var.image_id
  network_interface_id              = var.network_interface_id
  zone                              = var.zone
  azurerm_network_security_group_id = var.azurerm_network_security_group_id
}

module "shipping" {
  source                            = "./component"
  name                              = "shipping"
  location                          = var.location
  rg_name                           = var.rg_name
  image_id                          = var.image_id
  network_interface_id              = var.network_interface_id
  zone                              = var.zone
  azurerm_network_security_group_id = var.azurerm_network_security_group_id
}

module "dispatch" {
  source                            = "./component"
  name                              = "dispatch"
  location                          = var.location
  rg_name                           = var.rg_name
  image_id                          = var.image_id
  network_interface_id              = var.network_interface_id
  zone                              = var.zone
  azurerm_network_security_group_id = var.azurerm_network_security_group_id
}
