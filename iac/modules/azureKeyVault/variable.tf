variable "key_vault_name" {
  description = "The name to be assigned to the Azure Key Vault."
  type        = string
}

variable "location" {
  description = "The geographic location where the Key Vault will be provisioned."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Azure resource group in which the Key Vault is located."
  type        = string
}

variable "enabled_for_disk_encryption" {
  description = "Indicates whether the Key Vault should be enabled for Azure Disk Encryption."
  type        = bool
  default     = false
}

variable "tenant_id" {
  description = "The tenant ID associated with the Azure services."
  type        = string
}

variable "purge_protection_enabled" {
  description = "Flag to enable purge protection, which prevents the vault from being permanently deleted until the protection period passes."
  type        = bool
  default     = false
}

variable "web_app_object_id" {
  description = "The object ID of the Azure Web App that requires access to the Key Vault."
  type        = string
}

variable "soft_delete_retention_days" {
  description = "The soft delete retention period."
  type        = number
  default     = 7
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the resource."
  type        = map(string)
  default     = {}
}
