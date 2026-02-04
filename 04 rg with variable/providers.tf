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
}
provider "azurerm" {
  features {}
  subscription_id = "24229dcb-7260-4728-88ae-c8beffd774bc"
}