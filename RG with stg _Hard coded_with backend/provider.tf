terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.115.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
    }
     backend "azurerm" {
      resource_group_name  = "rg22"
      storage_account_name = "tfstate20211234"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
    }
}
provider "azurerm" {
  features {}
  subscription_id = "24229dcb-7260-4728-88ae-c8beffd774bc"
}
