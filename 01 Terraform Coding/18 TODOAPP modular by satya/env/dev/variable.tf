variable "resource_groups" {
  description = "The name of the resource group to create."
  type = map(object({
    name     = string
    location = string
  }))
}
variable "vnets" {
  description = "The name of the vnet to create."
  type = map(object({
    name                = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
  }))
  
}
variable "subnets" {
  description = "The name of the subnet to create."
  type = map(object({
    subnet_name          = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
  
}
variable "pips" {
  description = "The name of the public ip to create."
  type = map(object({
    pip_name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                 = string
  }))
  
}
variable "nic" {
    description = "The name of the network interface to create."
    type = map(object({
        nic_name            = string
        location            = string
        resource_group_name = string
        virtual_network_name = string
        subnet_name          = string
        pip_name              = string
        
    }))
}