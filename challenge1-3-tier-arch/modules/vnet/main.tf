resource "azurerm_virtual_network" "vnet_details" {
  name     = "${var.prefix}-${var.vnet_name}"
  location = var.resource_location
  resource_group_name  = var.rg_name
  address_space = var.vnet_address_space
  dns_servers = var.dns_servers
  tags = var.tags
}