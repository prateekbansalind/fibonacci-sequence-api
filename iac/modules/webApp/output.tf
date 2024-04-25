// Output the principal ID of the system-assigned identity associated with the web app
output "web_app_identity_principal_id" {
  value = azurerm_linux_web_app.web_app.identity[0].principal_id
}   