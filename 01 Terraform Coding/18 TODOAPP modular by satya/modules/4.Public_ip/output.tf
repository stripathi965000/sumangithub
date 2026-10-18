output "pip_id" {
  value = {
    for pip, o in azurerm_public_ip.pip : pip => o.id
  }
}
