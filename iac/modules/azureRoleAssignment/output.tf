// Output the unique identifier of the created role assignment
output "role_assignment_id" {
  value = azurerm_role_assignment.generic_role_assignment.id
}
