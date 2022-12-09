variable "env" {
  type        = string
  description = "(Required) The environment are working on"
}

variable "storageAccountNames" {
  type        = list(any)
  default     = ["backend", "report", "payment"]
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

variable "storageSubnet" {
  type        = string
  description = "(Required) The name of the subnet for the Storage Private link"
}

variable "storageSubnetAddressPrefix" {
  type        = string
  description = "(Required) The prefix of the subnet for the Storage Private link"
}

variable "storageSubnetAddressPrefix" {
  type        = string
  description = "(Required) The prefix of the subnet for the Storage Private link"
}

variable "subnetList" {
  type        = string
  description = "(Required) The list of the web subnet"
}