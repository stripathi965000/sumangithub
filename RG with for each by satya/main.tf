#for_each + list
#for each list support nhi krta isiliye set m covert kia
resource "azurerm_resource_group" "rg" { 
    for_each = toset(var.name)
    name = each.value    #each.value/each.key
  location = "central india"
}
variable "name" {
  
}