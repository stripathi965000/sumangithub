#local block in Terraform is a way to define and assign values to variables that can be used throughout the configuration.
#  In this example, we have defined a local block with two variables: `location` and `env`.
#1 locals {
#   location = "central india"
#   env = "prod"
#    rg_name = "sumanrg"
# }


#1 resource "azurerm_resource_group" "rglocal" {   
#   name     = "local-${local.rg_name}-${local.env}"                     #local.env = prod/local.rg_name=sumanrg  =     local-sumanrg-prod
#   location = local.location
# }


# #2
#  locals {
#   location = "central india"
#   env = "prod"
#   rg_name = "rglocalblock"
# }

#2 resource "azurerm_resource_group" "rglocal" {
#   name     = local.rg_name
#   location = local.location

#   tags = {
#     environment = local.env
#   }
# }

# #3
#  locals {
#   location = "central india"
#   env = "prod"
#   rg_name = "rglocalblock"
#   stg_name = "stglocalblk"
# }
# resource "azurerm_resource_group" "rglocal" {
#   name     = local.rg_name
#   location = local.location

#   tags = {
#     environment = local.env
#   }
# }

# resource "azurerm_storage_account" "stglocal" {
#   name                     = local.stg_name
#   location                 = local.location
#   resource_group_name      = azurerm_resource_group.rglocal.name
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

#   tags = {
#     environment = local.env
#   }
# }



# 4   name                     = "local-${local.stg_name}
#   resource_group_name      = local.rg_name
#   location                 = local.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

#   tags = {
#     environment = local.env
#   }
# } 

