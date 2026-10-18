module "resource_group" {
  source = "../../modules/Resource_Group"
  rgs    = var.rgs1
}


module "storage_account" {
  depends_on = [module.resource_group]
  source     = "../../modules/Storage_Account"
  stgs       = var.stgs1
}