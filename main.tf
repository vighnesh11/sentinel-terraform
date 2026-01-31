# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.90.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "~> 2.0"
    }
  }

  required_version = ">= 1.3.0"
}

# Default provider (Sentinel / Logic Apps / LAW)
provider "azurerm" {
  subscription_id = "<DR SUB ID>"
  features {}
}

# Aliased provider (VM / DCR association / other sub)
provider "azurerm" {
  alias           = "vm_sub"
  subscription_id = "SUB ID OF VMs"
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = "RG-TERRAFORM"
  location = "westus2"
}