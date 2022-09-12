data "azurerm_subnet" "sb_details" {
  name        = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name = var.rg_name
}
resource "azurerm_network_interface" "nic_details" {
  name     = "${var.prefix}-${var.nic_name}-nic"
  location = var.resource_location
  resource_group_name  = var.rg_name

  ip_configuration {
    name = var.nic_name
    subnet_id = data.azurerm_subnet.sb_details.id
    private_ip_address_allocation = var.nic_address_allocation
  }
  
  
  tags = var.tags
}