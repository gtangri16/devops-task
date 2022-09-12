output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
}

output "network_interface" {
  value = module.nic
  }


output "rg" {
  value = module.resource_group
  }

output "vnet" {
  value = module.vnet
}

output "subnet" {
  value = module.subnets
}

output "vm" {
  value = module.vm
}
