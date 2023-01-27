variable "rg-name" {
  default     = "test"
  type        = string
  description = "Name of resource group"
}

variable "rg-location" {
  default     = "North Europe"
  type        = string
  description = "Location of resource group"
}

variable "storage_blob_source_name" {
  default     = "../../files/data.md"
  type        = string
  description = "Name of storage blob source file name"
}

variable "postfix" {
  description = "A postfix string to centrally mitigate resource name collisions"
  type        = string
  default     = "resourcedc"
}

variable "client_id" {
  type        = string
  description = "Client ID value"
}

variable "subscription_id" {
  type        = string
}

variable "tenant_id" {
  type        = string
}

variable "client_secret" {
  type        = string
}


