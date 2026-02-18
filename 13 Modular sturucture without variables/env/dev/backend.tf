terraform {
backend "azurerm" {
    resource_group_name = "storage-rg"
    storage_account_name = "sumanstorageaccount1"
    container_name = "tfstate"
    key = "test1.tfstate"
}
}