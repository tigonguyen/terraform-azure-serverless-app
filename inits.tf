# Azure Provider source and version being used
terraform {
  required_version = ">= 0.13.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.21.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "sa-infra"
    storage_account_name = "stsabackendterraform"
    container_name       = "tfstate-stores"
    key                  = "tfstate-"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}