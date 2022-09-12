output "id" {
    value = azurerm_network_interface.nic_details.id
}

output "ip" {
    value = azurerm_network_interface.nic_details.*.private_ip_address
}

output "nic_name" {
    value = azurerm_network_interface.nic_details.*.name
}