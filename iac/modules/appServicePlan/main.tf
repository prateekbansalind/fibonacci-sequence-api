// Resource block for Azure App Service Plan
resource "azurerm_service_plan" "asp" {
  name                   = var.app_service_plan_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  os_type                = var.os_type
  sku_name               = var.sku_name
  zone_balancing_enabled = var.zone_balancing_enabled
  worker_count           = var.worker_count
  tags                   = var.tags
}