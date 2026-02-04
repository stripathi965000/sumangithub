resource "azurerm_resource_group" "sum-rg" {
    for_each = var.rgs
  name     = each.key    
  location = each.value.location


  tags = {
    Environment = each.value.tags.env
    CostCenter  = each.value.tags.CostCenter
    Owner       = each.value.tags.Owner
    ManagedBy   = "Terraform"
  }
}