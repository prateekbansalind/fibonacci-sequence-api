// Output the name of the created resource group
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

// Output the location of the created resource group
output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}