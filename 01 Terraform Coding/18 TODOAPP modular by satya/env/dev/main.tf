module "rg" {
  source = "../../modules/1.Resource_Group"
  resource_groups = var.resource_groups
}

module "vnet" {
  source = "../../modules/2.Vnet"
  vnets = var.vnets
  depends_on = [ module.rg ]
}

module "subnet" {
  source = "../../modules/3.Subnet"
  subnets = var.subnets
  depends_on = [ module.vnet ]
}

module "pip" {
  source = "../../modules/4.Public_ip"
  pips = var.pips
 depends_on = [ module.rg , module.vnet, module.subnet ]
}

module "nic" {
  source = "../../modules/5.Nic"
  nic = var.nic
  depends_on = [ module.subnet, module.pip,module.rg ]
}