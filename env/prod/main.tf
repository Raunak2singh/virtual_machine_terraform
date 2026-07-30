module "resource_group" {
  source = "../../chid/resource_group"
  rgs    = var.rgs
}

module "virtual_network" {
  source     = "../../chid/azurerm_virtual_network"
  vnets      = var.vnets
  depends_on = [module.resource_group]
    
}

module "subnets" {
  source     = "../../chid/azurerm_subnet"
  subnet     = var.subnet
  depends_on = [module.virtual_network]
}


module "pip" {
  source     = "../../chid/azurerm_pubic_pip"
  pip        = var.pip
  depends_on = [module.resource_group]

}

module "virtual_machine" {
  source         = "../../chid/azurerm_virtual_machine"
  virtualmachine = var.virtualmachine
  depends_on     = [module.subnets,module.pip]


}
  