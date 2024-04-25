locals {
  tags = {
    environment = "${terraform.workspace}"
  }
}

// Module for Resource Group creation
module "resource_group" {
  source              = "./modules/resourceGroup"
  resource_group_name = "rg-${var.webappname}-${terraform.workspace}-${var.location_code}"
  location            = var.location
  tags                = local.tags
}

// Module for the App Service Plan. Sets up the computing environment for web applications.
module "service_plan" {
  source                 = "./modules/appServicePlan"
  app_service_plan_name  = "asp-${var.webappname}-${terraform.workspace}-${var.location_code}"
  location               = var.location
  resource_group_name    = module.resource_group.resource_group_name
  os_type                = "Linux"
  sku_name               = var.asp_sku_name
  zone_balancing_enabled = var.asp_zone_balancing_enabled
  worker_count           = var.asp_worker_count
  tags                   = local.tags
}

// Module for Web App Service. Configures and deploys the web application with Docker support.
module "app_service" {
  source                   = "./modules/webApp"
  web_app_name             = "api-${var.webappname}-${terraform.workspace}-${var.location_code}"
  location                 = var.location
  resource_group_name      = module.resource_group.resource_group_name
  app_service_plan_id      = module.service_plan.service_plan_id
  docker_registry_username = var.docker_registry_username
  docker_registry_password = var.docker_registry_password
  docker_image_name        = "${var.webappname}:${var.docker_image_tag}"
  docker_registry_url      = var.docker_registry_url
  tags                     = local.tags
}

// Module for Azure Role Assignment. Grants the web app pull permissions from the Shared Azure Container Registry.
module "acrpull" {
  source               = "./modules/azureRoleAssignment"
  scope                = "/subscriptions/${var.subscription_id}/resourceGroups/${var.shared_resource_group}/providers/Microsoft.ContainerRegistry/registries/${var.acr_name}"
  role_definition_name = "AcrPull"
  principal_id         = module.app_service.web_app_identity_principal_id
}

// Module for Azure Key Vault
module "key_vault" {
  source                     = "./modules/azureKeyVault"
  key_vault_name             = "kvault${terraform.workspace}${var.location_code}"
  location                   = var.location
  resource_group_name        = module.resource_group.resource_group_name
  soft_delete_retention_days = var.kv_soft_delete_retention_days
  web_app_object_id          = module.app_service.web_app_identity_principal_id // Web app is assigned to read and import certificate from azure key vault.
  tenant_id                  = var.tenant_id
  tags                       = local.tags
}

// Monitoring and logging

resource "azurerm_log_analytics_workspace" "law" {
  name                = "law-${terraform.workspace}-${var.location_code}"
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = local.tags
}

resource "azurerm_application_insights" "web_app_insights" {
  name                = "ai-api-${var.webappname}-${terraform.workspace}-${var.location_code}"
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  workspace_id        = azurerm_log_analytics_workspace.law.id
  application_type    = "web"
  tags                = local.tags
}
