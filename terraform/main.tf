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
  name     = "Hacker-Trap-Zone-Issa-V289"  # <-- Your custom V289 code clears the duplicate block!
  location = "East US"
}
