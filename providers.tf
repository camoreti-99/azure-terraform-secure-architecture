terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "sttfstatepro2026"
    container_name       = "tfstate"
    key                  = "laboratorio.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}