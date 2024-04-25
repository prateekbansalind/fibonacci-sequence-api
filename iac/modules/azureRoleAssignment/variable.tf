variable "scope" {
  description = "The scope at which the role assignment is applied, typically the ID of the resource, resource group, or subscription."
  type        = string
}

variable "principal_id" {
  description = "The Azure AD object ID of the principal (user, group, service principal, or managed identity) to which the role will be assigned."
  type        = string
}

variable "role_definition_name" {
  description = "The name of the Azure role definition to assign, which specifies the set of permissions granted."
  type        = string
}
