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
  name     = "Hacker-Trap-Zone-SesayI-VV289"  # <-- Your fresh name completely breaks the loop!
  location = "East US"
}
