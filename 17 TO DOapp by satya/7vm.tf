
resource "azurerm_linux_virtual_machine" "vm" {
    depends_on = [ azurerm_resource_group.rgs, azurerm_virtual_network.vnet, azurerm_network_interface.nic, azurerm_network_security_group.nsg ]
    for_each = var.vms
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  admin_password = "adminuser@123"
  disable_password_authentication = false
  network_interface_ids = [
    data.azurerm_network_interface.data-nic[each.key].id,
  ]

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

data "azurerm_network_interface" "data-nic" {
    depends_on = [ azurerm_network_interface.nic ]
    for_each = var.vms

  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

