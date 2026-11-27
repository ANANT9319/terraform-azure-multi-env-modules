resource "azurerm_network_interface" "devnic" {
  for_each = var.vms
  name                = each.value.nic_name
  location            = data.azurerm_resource_group.devrg.location
  resource_group_name = data.azurerm_resource_group.devrg.name

  ip_configuration {
    name                          = "devconfiguration1"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pip.id
  }
}


# Virtual machine code here 


resource "azurerm_virtual_machine" "linux" {
  for_each = var.vms
  name                  = each.value.vm_name
  location              = each.value.location
  resource_group_name   = each.value.rg_name
  network_interface_ids = [azurerm_network_interface.devnic[each.key].id]
  vm_size               = each.value.vm_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
  storage_os_disk {
    name              = "${each.value.vm_name}-osdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = each.value.vm_name
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}