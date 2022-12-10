output "vnetResourceGroup" {
  value = data.azurerm_resource_group.main.name
}

output "vnetIntegrationName" {
  value = azurerm_virtual_network.main.name
}

output "allowedSubnetList" {
  value = azurerm_subnet.main[*].name
}