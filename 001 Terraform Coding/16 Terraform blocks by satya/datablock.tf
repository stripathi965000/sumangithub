# #resource group creted on portal then using its rg in creating stg account
# "name": "datablock-rg",
#     "type": "Microsoft.Resources/resourceGroups",
#     "location": "centralindia",
#it is used to fetch the existing resource group details and use it in creating storage account


# data "azurerm_resource_group" "datablock" {
#   name = "datablock-rg"
# }

# output "id" {
#   value = data.azurerm_resource_group.datablock.id
# }


# resource "azurerm_storage_account" "stg" {
#   name                     = "stgaccountdatablock"
#   resource_group_name      = data.azurerm_resource_group.datablock.name
#   location                 = data.azurerm_resource_group.datablock.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

#   tags = {
#     environment = "staging"
#   }
# }
# resource "azurerm_storage_account" "stg2" {
#   name                     = "stgaccountdatablock2"
#   resource_group_name      = data.azurerm_resource_group.datablock.name
#   location                 = data.azurerm_resource_group.datablock.location
#   account_tier             = "Premium"
#   account_replication_type = "GRS"

#   tags = {
#     environment = "staging"
#   }
# }