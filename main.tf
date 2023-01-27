module "rg-storage" {
  source                    = "./modules/rg-storage-module"
  rg-name                   = var.rg-name
  rg-location               = var.rg-location
  storage_blob_source_name  = var.storage_blob_source_name
  postfix                   = var.postfix
}
