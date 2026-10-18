output "rg_name" {
  value = {
    for rg, o in azurerm_resource_group.rgs : rg => o.name
  }
}