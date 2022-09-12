output "subnets_name" {
  description = "The names of subnets created"
  value       = "${azurerm_subnet.subnet.*.name}"
}


output "subnets_ids" {
  description = "The ids of subnets created"
  value       = "${azurerm_subnet.subnet.*.id}"
}

output "subnets_address_prefix" {
  description = "The address prefix of subnets created"
  value       = "${azurerm_subnet.subnet.*.address_prefixes}"
}
