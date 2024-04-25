// Output the unique identifier of the key vault
output "key_vault_id" {
  value = azurerm_key_vault.kv.id
}