resource "azurerm_key_vault_secret" "vm_password" {
  name         = "vm-password"
  value        = "REPLACE_WITH_PIPELINE_SECRET"
  key_vault_id = azurerm_key_vault.kv.id
}