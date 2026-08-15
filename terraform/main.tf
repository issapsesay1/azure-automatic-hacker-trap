terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "trap_rg" {
  name     = "Hacker-Trap-Zone-Issa-V2"  # <-- This brand new name clears the duplicate error!
  location = "East US"
}
