resource "azurerm_monitor_action_group" "operations" {

  name                = "${var.environment}-operations"

  resource_group_name = var.resource_group_name

  short_name          = "ops"

  email_receiver {

    name          = "Admin"

    email_address = "your-email@gmail.com"

  }

}
resource "azurerm_monitor_metric_alert" "cpu_alert" {

  name                = "${var.environment}-cpu-alert"

  resource_group_name = var.resource_group_name

  scopes              = [var.vm_id]

  description         = "CPU usage greater than 80%"

  severity            = 2

  frequency           = "PT5M"

  window_size         = "PT5M"

  criteria {

    metric_namespace = "Microsoft.Compute/virtualMachines"

    metric_name      = "Percentage CPU"

    aggregation      = "Average"

    operator         = "GreaterThan"

    threshold        = 80

  }

  action {

    action_group_id = azurerm_monitor_action_group.operations.id

  }

}