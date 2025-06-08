module "resource-group" {
  for_each = var.rg_name
  source   = "./modules/resource-group"
  name  = "roboshop-${each.key}-${var.env}"
  location = each.value["location"]
}

module "databases" {
  depends_on                          = [ module.resource-group ]
  for_each                            = var.databases 
  source                              = "./modules/vm"
  name                                = each.key
  location                            = module.resource-group[each.value["rgname"]].location 
  rg_name                             = module.resource-group[each.value["rgname"]].name
#  name                                = each.value["db_name"]
#  location                            = module.resource-group[each.key].location
#  rg_name                             = module.resource-group[each.key].name
  image_id                            = var.image_id
  network_interface_id                = var.network_interface_id
  zone                                = var.zone
  azurerm_network_security_group_id   = var.azurerm_network_security_group_id
  dns_record_gp_name                  = var.dns_record_gp_name
  env                                 = var.env
}

module "applications" {
  depends_on                          = [ module.databases ]
  for_each                            = var.applications
  source                              = "./modules/vm"
  name                                = each.key
  location                            = module.resource-group[each.value["rgname"]].location 
  rg_name                             = module.resource-group[each.value["rgname"]].name
  image_id                            = var.image_id
  network_interface_id                = var.network_interface_id
  zone                                = var.zone
  azurerm_network_security_group_id   =  var.azurerm_network_security_group_id
  dns_record_gp_name                  = var.dns_record_gp_name
  env                                 = var.env
}
