variable "tags" {
    description = "Provide mandatory tags based on org policy"  
} 
variable "rg_name" {
    description = "Provide resourcegroup name"  
}
variable "resource_location" {
    description = "Provide resource location"  
}
variable "vnet_address_space" {
  description = "The CIDR block reserved for this vnet"
}
variable "vnet_name" {
  description = "Name of vnet"
}
variable "dns_servers"{
    description = "IP addresses for the DNS server"
}
variable "prefix"{
    description = "provide the prefix as per the naming convention"
}
