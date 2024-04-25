variable "app_service_plan_name" {
  description = "The name to be used for the App Service Plan."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the App Service Plan will be located."
  type        = string
}

variable "location" {
  description = "The geographic location where the App Service Plan to be provisioned."
  type        = string
}

variable "os_type" {
  description = "The operating system type for the App Service Plan, e.g., 'Linux' or 'Windows'."
  type        = string
}

variable "sku_name" {
  description = "The SKU name defining the pricing tier and capabilities of the App Service Plan, e.g., 'B1', 'S1'."
  type        = string
}

variable "zone_balancing_enabled" {
  description = "Should the Service Plan balance across Availability Zones in the region. Changing this forces a new resource to be created."
  type        = bool
  default     = false
}

variable "worker_count" {
  description = "The number of Workers (instances) to be allocated."
  type        = number
  default     = 1
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the resource."
  type        = map(string)
  default     = {}
}

