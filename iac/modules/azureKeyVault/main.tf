// Data source to fetch the current Azure client configuration
data "azurerm_client_config" "current" {}

// Resource block for creating an Azure Key Vault
resource "azurerm_key_vault" "kv" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled

  sku_name = "standard"

  // Access policy specifically for certificates
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.web_app_object_id

    certificate_permissions = [
      "Get",
      "Import"
    ]
  }
  tags = var.tags
}