# Azure Provider source and version being used
terraform {
  required_version = ">= 0.13.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "sa-infra"
    storage_account_name = "stsabackendterraform"
    container_name       = "tfstate-stores"
    key                  = "tfstate-"
  }
}

# Environment for infrastructure deployment
locals {
  env      = terraform.workspace
  env_vars = yamldecode(file("${path.module}/env_vars.yaml"))
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}