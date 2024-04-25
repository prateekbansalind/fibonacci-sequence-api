// Resource block for creating a role assignment in Azure
resource "azurerm_role_assignment" "generic_role_assignment" {
  scope                = var.scope
  role_definition_name = var.role_definition_name
  principal_id         = var.principal_id
}


