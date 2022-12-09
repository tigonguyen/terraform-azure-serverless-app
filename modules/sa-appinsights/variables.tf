variable "appInsightsNames" {
  type        = list(any)
  default     = ["platform", "frontend", "backend", "report", "payment"]
  description = "(Optional) List of AppInsights names for each services"
}

variable "env" {
  type        = string
  description = "(Required) The environment are working on"
}

variable "region" {
  type        = string
  default     = "Canada Central"
  description = "(Optional) The region are working on"
}

variable "logAnalyticSKU" {
  type        = string
  default     = "Free"
  description = "(Optional) The SKU of Log Analytic Workspace"
}

