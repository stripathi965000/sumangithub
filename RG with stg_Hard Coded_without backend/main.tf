resource "azurerm_resource_group" "RG" {
  name     = "RG1"
  location = "West Europe"
}

resource "azurerm_storage_account" "stg" {
  name                     = "stg1666887887"
  resource_group_name      = azurerm_resource_group.RG.name
  location                 = azurerm_resource_group.RG.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

 
}