resource "azurerm_network_security_group" "nsg" {
    depends_on = [ azurerm_resource_group.rgs, azurerm_virtual_network.vnet ]
    for_each = var.nsgs
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

#we need to create association between subnet and nsg, for that we need to get the id of subnet and nsg, for that we need to create data source for both subnet and nsg, then we can use the id of both to create association

resource "azurerm_subnet_network_security_group_association" "as" {
  for_each = var.nsgs
  subnet_id                 = data.azurerm_subnet.data_subnet1[each.key].id
  network_security_group_id = data.azurerm_network_security_group.asg[each.key].id
}
data "azurerm_subnet" "data_subnet1" {
  depends_on = [ azurerm_subnet.subnet ,azurerm_resource_group.rgs, azurerm_virtual_network.vnet]
  for_each             = var.nsgs
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
#same way we can create association between nic and nsg, for that we need to create data source for both nic and nsg, then we can use the id of both to create association
#asg = association security group, we can create association between nic and asg, for that we need to create data source for both nic and asg, then we can use the id of both to create association

data "azurerm_network_security_group" "asg" {
    depends_on = [ azurerm_resource_group.rgs, azurerm_network_security_group.nsg ]
    for_each = var.nsgs
  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}

# output "location" {
#   value = data.azurerm_network_security_group.asg[each.key].location
# }