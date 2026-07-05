resource "azurerm_public_ip" "pip" {
  name                = "${var.environment}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.environment}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {

  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location

  size = "Standard_D2ls_v5"

  admin_username = "azureuser"

  disable_password_authentication = false

  admin_password = "Password@123456"

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  custom_data = base64encode(file("${path.root}/scripts/install-docker.sh"))

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
identity {
    type         = "UserAssigned"
    identity_ids = [var.identity_id]
  }
}

resource "azurerm_virtual_machine_extension" "azure_monitor_agent" {

  name                 = "AzureMonitorLinuxAgent"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm.id
  publisher            = "Microsoft.Azure.Monitor"
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.0"

  auto_upgrade_minor_version = true
}