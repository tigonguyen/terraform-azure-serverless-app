module "appinsights" {
  source = "../../modules/sa-appinsights"

  env              = local.env
  appInsightsNames = local.env_vars.appInsightsNames
  logAnalyticSKU   = local.env_vars.logAnalyticSKU
}