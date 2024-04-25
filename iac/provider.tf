terraform {
  // Define the required providers with version constraints
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.83"
    }
  }

  // Configuration for the backend where Terraform's state file will be stored (keep in mind, the below storage account is not managed via IaC to prevent from any mishaps.)
  backend "azurerm" {
    subscription_id      = "171af07e-2ca7-472d-bc77-e33c8d720c4b"
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stoacctfstate"
    container_name       = "terraformstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

