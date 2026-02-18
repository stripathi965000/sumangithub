#for_each + list
#for each list support nhi krta isiliye set m covert kia
# for each support set of string and map

# resource "azurerm_resource_group" "rg" { 
#     for_each = toset(var.name)
#     name = each.value    #each.value/each.key
#   location = "central india"
# }
# variable "name" {
  
# }

# #for_each + MAP (mutliple resource with diff location)
# map only take key value pair thats y nested map came
# resource "azurerm_resource_group" "rg" { 
#     for_each = var.rgs
#     name = each.key
#   location = each.value
# }

# variable "rgs" {}

#for_each + nested MAP (mutliple resource with diff location)
# resource "azurerm_resource_group" "rg" { 
#   for_each = var.rgs
#   name = each.value.name
#   location = each.value.location
# }

# variable "rgs" {}