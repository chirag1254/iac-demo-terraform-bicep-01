terraform {
  backend "azurerm" {
    resource_group_name  = "iac-tfstate-rg"
    storage_account_name = "iacstatestorage01"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
