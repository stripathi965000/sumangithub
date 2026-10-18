resource "azurerm_resource_group" "rg" {
    count = length(var.resource_groups)
    name  = var.resource_groups[count.index]
    location = var.location[count.index]
}



