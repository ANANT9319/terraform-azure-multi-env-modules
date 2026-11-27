module "azurerm_resource_group" {
  source = "../../modules/azurerm_resource_group"
  rg     = var.devrajat
}

module "azurerm_vnet" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../modules/azurerm_vnet"
  vnet       = var.vnets
}


module "azurerm_subnet" {
  depends_on = [module.azurerm_vnet]
  source     = "../../modules/azurerm_subnet"
  snet       = var.snets
}

module "azurerm_pip" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../modules/azurerm_pip"
  public_ips = var.public_ips
}


module "azurerm_vm" {
  depends_on = [module.azurerm_subnet]
  source     = "../../modules/azurerm_vm"
  vms        = var.vms
}
