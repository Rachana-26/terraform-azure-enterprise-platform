resource "azurerm_key_vault_secret" "vm_password" {

  name         = "vm-password"

  value        = "P@ssw0rd123!"

  key_vault_id = azurerm_key_vault.kv.id
}