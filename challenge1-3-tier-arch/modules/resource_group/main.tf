resource "azurerm_resource_group" "services_resource_group" {
  name     = "${var.prefix}-${var.rg_name}"
  location = var.resource_location
  tags = var.tags
}