variable "rg-name" {
}

variable "rg-location" {
}

variable "storage-account-name" {
  default     = "duckcreekstorageaccount"
  type        = string
  description = "Name of storage account"
}

variable "storage-account-tier" {
  default     = "Standard"
  type        = string
  description = "Name of storage account tier"
}

variable "storage-account-replication_type" {
  default     = "LRS"
  type        = string
  description = "Name of storage-account-replication_type"
}

variable "storage-account-access-tier" {
  default     = "Hot"
  type        = string
  description = "Name of storage-account-access-tier"
}

variable "storage-account-kind" {
  default     = "StorageV2"
  type        = string
  description = "Name of storage-account-kind"
}

variable "storage_container_name" {
  default     = "dc-cds"
  type        = string
  description = "Name of storage container name"
}

variable "container_access_type" {
  default     = "private"
  type        = string
  description = "Name of container access type"
}

variable "storage_blob_name" {
  default     = "data.md"
  type        = string
  description = "Name of storage blob name"
}

variable "postfix" {
}

variable "storage_blob_source_name" {
}

