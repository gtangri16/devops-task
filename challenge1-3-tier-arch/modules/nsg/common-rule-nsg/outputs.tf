output "nsg_name" {
  value = azurerm_network_security_group.nsg_details.*.name
}

output "location" {
  value = azurerm_network_security_group.nsg_details.*.location
}


output "resource_group" {
  value = azurerm_network_security_group.nsg_details.*.resource_group_name
}
output "nsg_id" {
  value = azurerm_network_security_group.nsg_details.*.id
}