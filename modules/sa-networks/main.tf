data "azurerm_resource_group" "main" {
  name = "sa-infra"
}

resource "azurerm_virtual_network" "main" {
  name                = "sa-vnet-${var.env}"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  address_space       = var.vnetPrefix

  tags = {
    "env"        = var.env
    "infra-type" = "infrastructure"
  }
}

resource "azurerm_subnet" "main" {
  count                = length(var.subnetPrefixes)
  name                 = "subnet-${element(keys(var.subnetPrefixes), count.index)}"
  resource_group_name  = data.azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = element(values(var.subnetPrefixes), count.index)
}