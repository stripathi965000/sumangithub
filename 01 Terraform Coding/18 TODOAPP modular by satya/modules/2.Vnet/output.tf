output "vnet_name" {
  value = {
    for vnet, o in azurerm_virtual_network.vnet : vnet => o.name
  }
}