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