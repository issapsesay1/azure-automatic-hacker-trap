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
  name     = "Hacker-Trap-Zone-Binissa-Final" # <-- The brand new name for our clean run!
  location = "East US"
}
