# variable "rg_name" {
#   default = "devops_project_ecom"
# }

# variable "image_id" {
#   default = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Compute/images/image"
# }

# variable "network_interface_id" {
#   default = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Network/virtualNetworks/workstation-vnet/subnets/default"
# }

# variable "zone" {
#   default = "harshaldevops.online"
# }

# variable "azurerm_network_security_group_name" {
#   default = "allow_all"
# }

# variable "databases" {
#   default    = {
#     mongodb  = {}
#     mysql    = {}
#     rabbitmq = {}
#     redis    = {}
#   }
# }

# variable "applications" {
#   default     = {
#     catalogue = {}
#     payment   = {}
#     shipping  = {}
#     dispatch  = {}
#     user      = {}
#     cart      = {}
#     frontend  = {}
#   } 
# }

variable "name" {}
variable "location" {}
variable "databases" {}
variable "image_id" {}
variable "network_interface_id" {}
variable "azurerm_network_security_group_name" {}
variable "zone" {}
variable "rg_name" {
  
}
variable "env" {}