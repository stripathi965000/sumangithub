#reference name ko rename krta h without deleting the block

#  resource "azurerm_resource_group" "rgmove" {
#   name     = "rg-move"
#   location = "central india"
  
# }
resource "azurerm_resource_group" "rgroup" {
  name     = "rg-move"
  location = "central india"
  }

 moved  {
from = azurerm_resource_group.rgmove    
to = azurerm_resource_group.rgroup
 }


#Terraform will perform the following actions:

  # azurerm_resource_group.rgmove has moved to azurerm_resource_group.rgroup
#     resource "azurerm_resource_group" "rgroup" {
#         id         = "/subscriptions/c20589a3-73b2-4297-8914-e3ed4e471954/resourceGroups/rg-move"
#         name       = "rg-move"
#         tags       = {}
#         # (2 unchanged attributes hidden)
#     }

# Plan: 0 to add, 0 to change, 0 to destroy.
