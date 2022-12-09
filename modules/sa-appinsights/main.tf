resource "azurerm_resource_group" "main" {
  name     = "rg-${var.env}-appinsights"
  location = var.region

  tags = {
    "env"        = var.env
    "infra-type" = "appinsights"
  }
}

resource "azurerm_log_analytics_workspace" "main" {
  name                = "sa${var.env}-loganalytics"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = var.logAnalyticSKU
  retention_in_days   = 90

  tags = {
    "env"        = var.env
    "infra-type" = "appinsights"
  }
}

resource "azurerm_application_insights" "main" {
  count               = length(var.appInsightsNames)
  name                = "appinsights-${var.env}-${element(var.appInsightsNames, count.index)}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  application_type           = "web"
  workspace_id               = azurerm_log_analytics_workspace.main.id
  retention_in_days          = 90
  internet_ingestion_enabled = true
  internet_query_enabled     = true

  tags = {
    "env"        = var.env
    "infra-type" = "appinsights"
  }
}

