resource "azurerm_subnet" "subnet" {
  name                      = var.subnet_names[count.index]
  virtual_network_name      = var.vnet_name
  resource_group_name       = var.rg_name 
  address_prefixes          = [var.subnet_prefixes[count.index]]
  service_endpoints         = var.service_endpoint[count.index]
  count			    = length(var.subnet_names)
}

resource "azurerm_subnet_network_security_group_association" "nsg-association" {

count = length(var.subnet_names)
subnet_id                 = element(azurerm_subnet.subnet.*.id, count.index)
network_security_group_id = var.nsg_id[count.index]

}


