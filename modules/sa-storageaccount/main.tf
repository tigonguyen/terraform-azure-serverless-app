resource "azurerm_resource_group" "main" {
  name     = "rg-${var.env}-storage"
  location = var.region

  tags = {
    "env"        = var.env
    "infra-type" = "storageaccount"
  }
}

# data "azurerm_subnet" "storage-subnet" {
#   name                 = "subnet-${var.storageSubnetName}"
#   virtual_network_name = var.vnetIntegrationName
#   resource_group_name  = var.vnetResourceGroup
# }

data "azurerm_subnet" "allowed-subnets" {
  count                = length(var.allowedSubnetList)
  name                 = element(var.allowedSubnetList, count.index)
  virtual_network_name = var.vnetIntegrationName
  resource_group_name  = var.vnetResourceGroup
}

resource "azurerm_storage_account" "main" {
  count                    = length(var.storageAccountNames)
  name                     = "sa${element(var.storageAccountNames, count.index)}${var.env}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_kind             = "StorageV2"
  access_tier              = "Hot"

  default_to_oauth_authentication   = false
  cross_tenant_replication_enabled  = true
  min_tls_version                   = "TLS1_2"
  shared_access_key_enabled         = true
  public_network_access_enabled     = element(var.storageAccountNames, count.index) == "pub" ? true : false
  enable_https_traffic_only         = true
  infrastructure_encryption_enabled = false

  network_rules {
    default_action             = element(var.storageAccountNames, count.index) == "pub" ? "Allow" : "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = data.azurerm_subnet.allowed-subnets[*].id
  }

  tags = {
    "env"        = var.env
    "infra-type" = "storage"
  }
}