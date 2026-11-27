dev = {

  rg1 = {
    name     = "dev-rg"
    location = "centralindia"
  }
}
vnets = {
  vnet1 = {

    name                = "dev-vnet"
    location            = "centralindia"
    resource_group_name = "dev-rg"
    address_space       = ["10.124.0.0/16"]
  }
}


snets = {
  snet1 = {

    name                 = "dev-snet"
    location             = "centralindia"
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.124.1.0/24"]
  }
}

public_ips = {
  pip = {
    public_ip_name      = "dev-vm-pip"
    resource_group_name = "dev-rg"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}





vms = {

  linuxvm = {
    nic_name       = "dev-vm-nic"
    subnet_name    = "dev-snet"
    nic_vnet_name  = "dev-vnet"
    location       = "centralindia"
    rg_name        = "dev-rg"
    vm_name        = "dev-linux-vm"
    vm_size        = "Standard_D2als_v6"
    admin_username = "anansin"
    admin_password = "Gyan@123456"
    publisher      = "Canonical"
    offer          = "ubuntu-24_04-lts"
    sku            = "server"
    version        = "latest"
  }
}
