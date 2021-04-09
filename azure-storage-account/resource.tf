# Terrafrom file to create a resource

# This section is responsible for creation of RG

resource "azurerm_resource_group" "az-rg" {
  name = var.Az-Resource-Group-Name
  location = var.Az-Resource-Location
  tags = {
    "Project" = var.Az-Resource-Tag
  }
}

resource "azurerm_storage_account" "az-storage-account" {
    name = var.Az-Storage-Account-Name
    location = var.Az-Resource-Location
    resource_group_name = azurerm_resource_group.az-rg.name
    account_kind = var.Az-Storage-Account-Kind
    account_tier = var.Az-Storage-Account-Tier
    account_replication_type = var.Az-Storage-Account-Replication
    allow_blob_public_access = var.Az-Account-Access-Type

    tags = {
      "Project" = var.Az-Resource-Tag
    }
    }