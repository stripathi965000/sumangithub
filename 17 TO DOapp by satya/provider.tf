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
  subscription_id = "c20589a3-73b2-4297-8914-e3ed4e471954"
}