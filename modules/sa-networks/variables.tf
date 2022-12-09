variable "env" {
  type        = string
  description = "(Required) The environment are working on"
}

variable "vnetPrefix" {
  type        = list(any)
  description = "(Required) Prefix of working VNET"
}

variable "subnetPrefixes" {
  type        = map(any)
  description = "(Required) Subnet prefixes of working VNET"
}