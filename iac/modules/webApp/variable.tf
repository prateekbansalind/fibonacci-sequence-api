variable "web_app_name" {
  description = "The name to be assigned to the Azure Linux Web App."
  type        = string
}

variable "location" {
  description = "The geographic location where the Web App will be deployed. Optional if it should inherit from the resource group."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group within which the Web App is created."
  type        = string
}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan associated with this Web App."
  type        = string
}

variable "always_on" {
  description = "Indicates whether the Web App should be loaded continuously, which can improve performance by avoiding cold starts. Defaults to false."
  type        = bool
  default     = false
}

variable "http2_enabled" {
  description = "Enables HTTP/2 protocol support for the Web App."
  type        = bool
  default     = false
}

variable "docker_registry_username" {
  description = "Username for the Docker registry authentication. Required for pulling Docker images."
  type        = string

}

variable "docker_registry_password" {
  description = "Password for the Docker registry authentication. Required for pulling Docker images."
  type        = string
}

variable "docker_image_name" {
  description = "Name of the Docker image that the Web App will run. Must be available in the specified Docker registry."
  type        = string
}

variable "docker_registry_url" {
  description = "URL of the Docker registry where the Docker image is stored."
  type        = string
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the resource."
  type        = map(string)
  default     = {}
}


