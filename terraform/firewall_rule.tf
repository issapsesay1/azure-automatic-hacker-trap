hcl
resource "azurerm_virtual_network" "trap_vnet" {
  name                = "hacker-trap-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.trap_rg.location
  resource_group_name = azurerm_resource_group.trap_rg.name
}

resource "azurerm_network_security_group" "trap_nsg" {
  name                = "hacker-block-nsg"
  location            = azurerm_resource_group.trap_rg.location
  resource_group_name = azurerm_resource_group.trap_rg.name
}

output "security_automation_target" {
  value = {
    monitoring_brain  = azurerm_log_analytics_workspace.trap_law.name
    network_security  = azurerm_network_security_group.trap_nsg.name
    automation_target = "Azure Logic App Active Playbook"
  }
}
