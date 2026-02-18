module "resource_group"{
   source =  "../../modules/Resource_Group" 
}
module "storage_account" {
    depends_on = [ module.resource_group ]
  source = "../../modules/Strorage_Account"
}