#1 module "resource_group" {
#    source =  "../../modules/Resource_Group"
#    rgs = var.rgs
# }

module "resource_group" {
   source =  "../../modules/Resource_Group"
   rgs = var.rgs
}
