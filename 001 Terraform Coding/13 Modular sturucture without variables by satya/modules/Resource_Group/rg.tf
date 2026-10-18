resource "azurerm_resource_group" "rg" {
  # for_each = var.rgs
  name     = var.name
  location = var.location
}