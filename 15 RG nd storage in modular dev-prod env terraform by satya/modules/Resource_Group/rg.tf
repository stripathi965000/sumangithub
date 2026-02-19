#1 resource "azurerm_resource_group" "rg" {
#   for_each = var.rgs
#   name     = each.key
#   location = each.value
# }

resource "azurerm_resource_group" "rg" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location
}