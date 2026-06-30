resource "azurerm_container_registry" "acr" {

  name                = "${replace(var.environment, "-", "")}acr2026"

  resource_group_name = var.resource_group_name

  location            = var.location

  sku                 = "Basic"

  admin_enabled       = true
}