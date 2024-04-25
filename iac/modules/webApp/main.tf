// Resource block for creating an Azure Linux Web App
resource "azurerm_linux_web_app" "web_app" {
  name                = var.web_app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.app_service_plan_id
  https_only          = true

  // Configuration settings for the site, including performance and security settings
  site_config {
    always_on     = var.always_on
    http2_enabled = var.http2_enabled
    ftps_state    = "FtpsOnly"

    // Settings for deploying a container using Docker
    application_stack {
      docker_image_name        = var.docker_image_name
      docker_registry_url      = var.docker_registry_url
      docker_registry_username = var.docker_registry_username
      docker_registry_password = var.docker_registry_password
    }
  }

  // Configures an identity for the app, which allows the app to interact with other Azure services securely
  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}


