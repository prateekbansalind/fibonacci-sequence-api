variable "location" {
  description = "location where the resources would be deployed."
  type        = string
  default     = "australiaeast"
}

variable "location_code" {
  description = "location code where the resources would be deployed."
  type        = string
  default     = "ae"
}


variable "tenant_id" {
  description = "The tenant ID associated with the Azure services."
  type        = string
}

variable "subscription_id" {
  description = "Azure subscription ID under which the resources will be deployed."
  type        = string
  default     = "171af07e-2ca7-472d-bc77-e33c8d720c4b"
}

variable "shared_resource_group" {
  description = "The name of the shared resource group where shared resources are managed."
  type        = string
  default     = "rg-fibonacci-shared"
}

## Azure Container Registry variables ##

variable "acr_name" {
  description = "Username for the Docker registry where images are stored."
  type        = string
  default     = "acrfibonaccishared"
}

variable "docker_registry_username" {
  description = "Username for the Docker registry where images are stored."
  type        = string
  default     = "acrfibonaccishared"
}

variable "docker_registry_password" {
  description = "Password for the Docker registry to authenticate image pulls."
  type        = string
}

variable "docker_image_tag" {
  description = "The tag of the Docker image to be deployed."
  type        = string
  default     = "latest"
}

variable "docker_registry_url" {
  description = "The URL of the Docker registry where Docker images are stored."
  type        = string
  default     = "acrfibonaccishared.azurecr.io"
}

## App Service Plan variables ##
variable "asp_sku_name" {
  description = "The SKU for the plan."
  type        = string
  default     = "S1"
}

variable "asp_zone_balancing_enabled" {
  description = "Should the Service Plan balance across Availability Zones in the region. Changing this forces a new resource to be created."
  type        = bool
  default     = false
}

variable "asp_worker_count" {
  description = "The number of Workers (instances) to be allocated."
  type        = number
  default     = 1
}

variable "webappname" {
  description = "The name of the web application."
  type        = string
  default     = "fibonacci"
}

## Key Vault variables ##

variable "kv_soft_delete_retention_days" {
  description = "The soft delete retention period for key vault."
  type        = number
  default     = 7
}