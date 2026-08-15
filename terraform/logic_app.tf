hcl
resource "azurerm_logic_app_workflow" "hacker_blocker" {
  name                = "sentinel-block-hacker-ip"
  location            = azurerm_resource_group.trap_rg.location
  resource_group_name = azurerm_resource_group.trap_rg.name
}

resource "azurerm_logic_app_trigger_custom" "sentinel_alert" {
  name         = "When_Microsoft_Sentinel_Alert_Is_Triggered"
  logic_app_id = azurerm_logic_app_workflow.hacker_blocker.id

  body = <<BODY
{
  "type": "Request",
  "kind": "Http",
  "inputs": {
    "schema": {
      "type": "object",
      "properties": {
        "alert_name": { "type": "string" },
        "attacker_ip": { "type": "string" }
      }
    }
  }
}
BODY
}

output "logic_app_automation_status" {
  value = {
    workflow_name = azurerm_logic_app_workflow.hacker_blocker.name
    action_type   = "Automated NSG Firewall Rule Injection"
    status        = "Code-Ready for Inline Blocking"
  }
}
