data "azurerm_resource_group" "devrg" {
  name = "dev-rg"
}

data "azurerm_subnet" "subnet" {
  name                 = "dev-snet"
  virtual_network_name = "dev-vnet"
  resource_group_name  = "dev-rg"
}

data "azurerm_public_ip" "pip" {
  name                = "dev-vm-pip"
  resource_group_name = "dev-rg"
}