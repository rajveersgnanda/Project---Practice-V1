terraform {
  backend "azurerm" {
    resource_group_name  = "sourav-rg"
    storage_account_name = "souravstg1998"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}