resource "azurerm_network_security_group" "nsg_details" {
  name                = "${var.prefix}-${var.app_name}-01-nsg"
  resource_group_name = var.rg_name
  location            = var.resource_location
  tags = var.tags
}

resource "azurerm_network_security_rule" "nsg_rules" {
  count                                      = length(var.nsg_rules)
  name                                       = lookup(var.nsg_rules[count.index], "name")
  priority                                   = lookup(var.nsg_rules[count.index], "priority")
  direction                                  = lookup(var.nsg_rules[count.index], "direction")
  access                                     = lookup(var.nsg_rules[count.index], "access")
  protocol                                   = lookup(var.nsg_rules[count.index], "protocol")
  source_port_ranges                         = lookup(var.nsg_rules[count.index], "sourcePortRanges")
  source_port_range                          = lookup(var.nsg_rules[count.index], "sourcePortRange")
  destination_port_ranges                    = lookup(var.nsg_rules[count.index], "destinationPortRanges")
  destination_port_range                     = lookup(var.nsg_rules[count.index], "destinationPortRange")
  source_address_prefix                      = lookup(var.nsg_rules[count.index], "sourceAddressPrefix")
  source_address_prefixes                    = lookup(var.nsg_rules[count.index], "sourceAddressPrefixes")
  destination_address_prefix                 = lookup(var.nsg_rules[count.index], "destinationAddressPrefix")
  destination_address_prefixes               = lookup(var.nsg_rules[count.index], "destinationAddressPrefixes")
  description                                = lookup(var.nsg_rules[count.index], "description")
  resource_group_name                        = var.rg_name
  network_security_group_name                = azurerm_network_security_group.nsg_details.name
  depends_on = [ azurerm_network_security_group.nsg_details ]
}
