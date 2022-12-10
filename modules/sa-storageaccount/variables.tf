variable "env" {
  type        = string
  description = "(Required) The environment are working on"
}

variable "region" {
  type        = string
  default     = "Canada Central"
  description = "(Optional) The region are working on"
}

variable "storageAccountNames" {
  type        = list(any)
  default     = ["backend", "pub", "report", "payment"]
  description = "(Optional) List of Storage Account names needed for each services"
}

variable "vnetResourceGroup" {
  type        = string
  description = "(Required) The resource group of the virtual network"
}

variable "vnetIntegrationName" {
  type        = string
  description = "(Required) The name of the virtual network integration"
}

# variable "storageSubnetName" {
#   type        = string
#   description = "(Required) The name of the subnet for the Storage Private link"
# }

# variable "storageSubnetAddressPrefix" {
#   type        = string
#   description = "(Required) The prefix of the subnet for the Storage Private link"
# }

variable "allowedSubnetList" {
  type        = list(any)
  description = "(Required) The list of the web subnet"
}