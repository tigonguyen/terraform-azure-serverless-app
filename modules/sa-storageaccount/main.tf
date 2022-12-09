resource "azurerm_resource_group" "main" {
  name     = "rg-${var.env}-storage"
  location = var.region

  tags = {
    "env"        = var.env
    "infra-type" = "storageaccount"
  }
}

