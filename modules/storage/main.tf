resource "azurerm_storage_account" "storage" {
  name                     = "${replace(var.environment, "-", "")}racahana2026a"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}