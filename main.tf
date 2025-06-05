module "resource-group" {
  for_each = var.rg_name
  source   = "./modules/resource-group"
  name  = "roboshop-${each.key}-${var.env}"
  location = each.value["location"]
}

# module "databases" {
#   for_each                            = var.databases 
#   source                              = "./component"
#   name                                = each.key
#   rg_name                             = var.rg_name
#   image_id                            = var.image_id
#   network_interface_id                = var.network_interface_id
#   zone                                = var.zone
#   azurerm_network_security_group_name =  var.azurerm_network_security_group_name
# }

# module "applications" {
#   depends_on                          = [ module.databases ]
#   for_each                            = var.applications
#   source                              = "./component"
#   name                                = each.key
#   rg_name                             = var.rg_name
#   image_id                            = var.image_id
#   network_interface_id                = var.network_interface_id
#   zone                                = var.zone
#   azurerm_network_security_group_name = var.azurerm_network_security_group_name
# }

output "print" {
  value = module.resource-group
}