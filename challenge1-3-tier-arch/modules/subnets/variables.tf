
variable "rg_name" {
  description   = "Resource Group Name"
}

variable "vnet_name" {
  description	= "Name of the vnet"
}

variable "subnet_names" {
  description 	= "List of subnets inside the VNet"
}

variable "subnet_prefixes" {
  description 	= "List of address prefix to use for each of the subnet"
}

variable "service_endpoint" {
  description 	= "List of service endpoints to use for each of the subnet"
}
variable "nsg_id" {
  type = list
  description 	= "List of network security group ids"
}

