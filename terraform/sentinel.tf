resource "azurerm_log_analytics_workspace" "trap_law" {
  name                = "hacker-trap-workspace"
  location            = azurerm_resource_group.trap_rg.location
  resource_group_name = azurerm_resource_group.trap_rg.name
  sku                 = "PerGB2018"
}

resource "azurerm_log_analytics_solution" "sentinel" {
  solution_name         = "SecurityInsights"
  location              = azurerm_resource_group.trap_rg.location
  resource_group_name   = azurerm_resource_group.trap_rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.trap_law.id
  workspace_name        = azurerm_log_analytics_workspace.trap_law.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/SecurityInsights"
  }
}
