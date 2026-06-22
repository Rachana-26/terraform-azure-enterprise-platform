output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "web_subnet_id" {
  value = azurerm_subnet.web.id
}