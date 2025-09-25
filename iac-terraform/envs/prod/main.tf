provider "azurerm" { 
    features {}
    subscription_id = "2a09dc0e-0047-45f5-b526-ef94e4dd145b"
 }

variable "rg_name" { default = "iac-prod-rg" }
variable "location" { default = "eastus" }
variable "tags" { default = { owner="chirag"
 env="prod" } }

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

module "network" {
  source        = "../../modules/network"
  rg_name       = azurerm_resource_group.rg.name
  location      = var.location
  vnet_name     = "iac-prod-vnet"
  address_space = ["10.0.0.0/16"]
  subnet_name   = "app-subnet"
  subnet_prefixes = ["10.0.1.0/24"]
  tags          = var.tags
}

module "storage" {
  source           = "../../modules/storage"
  rg_name          = azurerm_resource_group.rg.name
  location         = var.location
  storage_name     = "iacprodstorage01"
  account_tier     = "Standard"
  replication_type = "LRS"
  tags             = var.tags
}
