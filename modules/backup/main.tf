resource "azurerm_recovery_services_vault" "vault" {
  name                = "${var.environment}-recovery-vault"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku = "Standard"

  soft_delete_enabled = true
}
resource "azurerm_backup_policy_vm" "policy" {
  name                = "${var.environment}-daily-backup"
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 30
  }
}
resource "azurerm_backup_protected_vm" "vm_backup" {
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name

  source_vm_id     = var.vm_id
  backup_policy_id = azurerm_backup_policy_vm.policy.id
}