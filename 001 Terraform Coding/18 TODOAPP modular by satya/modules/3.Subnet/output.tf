output "subnet_name" {
  value = {
    for subnet, o in azurerm_subnet.subnet : subnet => o.name
  }
}
output "subnet_id" {
  value = {
    for subnet, o in azurerm_subnet.subnet : subnet => o.id
  }
}