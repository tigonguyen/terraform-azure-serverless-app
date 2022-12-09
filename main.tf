module "network" {
  source = "./modules/sa-networks"

  env            = local.env
  vnetPrefix     = local.env_vars.vnetPrefix
  subnetPrefixes = local.env_vars.subnetPrefixes
}

module "appinsights" {
  source = "./modules/sa-appinsights"

  env              = local.env
  appInsightsNames = local.env_vars.appInsightsNames
  logAnalyticSKU   = local.env_vars.logAnalyticSKU
}