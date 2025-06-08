provider "azurerm" {
  features {}
  subscription_id = "4a491ea7-cd6d-4ec6-aa18-28b31973e70c"
}

terraform {
  backend "azurerm" {}
}

provider "vault" {
  address = "http://vault.harshaldevops.online:8200"
  token = var.token
}