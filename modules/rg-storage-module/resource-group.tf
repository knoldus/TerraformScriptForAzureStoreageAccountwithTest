# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A RESOURCE GROUP
# This is an example of how to deploy a Resource Group.
# ---------------------------------------------------------------------------------------------------------------------
# See test/azure_storage for how to write automated tests for this code.
# ---------------------------------------------------------------------------------------------------------------------
resource "azurerm_resource_group" "az-rg" {
  name     = "rg-${var.rg-name}-${var.postfix}"
  location = var.rg-location

  tags = {
    project = "duckcreek"
  }
}