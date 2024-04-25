variable "location" {
  description = "The geographic location where the resource group will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name to assign to the Azure Resource Group."
  type        = string
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the resource."
  type        = map(string)
  default     = {}
}
