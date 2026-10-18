variable "resource_groups" {
  description = "The name of the resource group to create."
  type        = map(object({
    name     = string
    location = string
  }))
}