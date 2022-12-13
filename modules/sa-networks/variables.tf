variable "env" {
  type        = string
  description = "(Required) The environment are working on"
}

variable "vnetPrefix" {
  type        = string
  description = "(Required) Prefix of working VNET"
  sensitive   = true
}

variable "subnetPrefixes" {
  type        = map(any)
  description = "(Required) Subnet prefixes of working VNET"
  sensitive   = true
}