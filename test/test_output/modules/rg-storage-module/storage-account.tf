# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A STORAGE ACCOUNT SET
# This is an example of how to deploy a Storage Account.
# ---------------------------------------------------------------------------------------------------------------------
# See test/azure_aks_test.go/terraform_azure_storage_example_test.go for how to write automated tests for this code.
# ---------------------------------------------------------------------------------------------------------------------



# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A STORAGE ACCOUNT
# ---------------------------------------------------------------------------------------------------------------------

resource "azurerm_storage_account" "az_storage_account" {
  name                     = "storage${var.postfix}"
  resource_group_name      = azurerm_resource_group.az-rg.name
  location                 = azurerm_resource_group.az-rg.location
  account_tier             = var.storage-account-tier
  account_replication_type = var.storage-account-replication_type
  account_kind             = var.storage-account-kind
  cross_tenant_replication_enabled = "true"
  access_tier              = var.storage-account-access-tier

  tags = {
    environment = "test"
  }
  depends_on = [
    azurerm_resource_group.az-rg
  ]
}

# ---------------------------------------------------------------------------------------------------------------------
# ADD A CONTAINER TO THE STORAGE ACCOUNT
# ---------------------------------------------------------------------------------------------------------------------

resource "azurerm_storage_container" "dc-container-data" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.az_storage_account.name
  container_access_type = var.container_access_type
  depends_on = [azurerm_storage_account.az_storage_account]
}

# ---------------------------------------------------------------------------------------------------------------------
# ADD A STORAGE BLOB
# ---------------------------------------------------------------------------------------------------------------------

#resource "azurerm_storage_blob" "data-blob-stg" {
#  name                   = var.storage_blob_name
#  storage_account_name   = azurerm_storage_account.az_storage_account.name
#  storage_container_name = azurerm_storage_container.dc-container-data.name
#  type                   = "Block"
#  source                 = var.storage_blob_source_name
#  depends_on = [azurerm_storage_container.dc-container-data]
#}
