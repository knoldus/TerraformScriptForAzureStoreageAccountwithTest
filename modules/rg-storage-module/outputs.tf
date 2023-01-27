output "rg-id" {
  value = azurerm_resource_group.az-rg.id
}

output "storage-account-endpoint" {
  value = azurerm_storage_account.az_storage_account.primary_blob_endpoint
}

output "resource_group_name" {
  value = azurerm_resource_group.az-rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.az-rg.location
}

output "storage_account_name" {
  value = azurerm_storage_account.az_storage_account.name
}

output "storage_account_account_tier" {
  value = azurerm_storage_account.az_storage_account.account_tier
}

output "storage_account_account_kind" {
  value = azurerm_storage_account.az_storage_account.account_kind
}

output "storage_container_name" {
  value = azurerm_storage_container.dc-container-data.name
}