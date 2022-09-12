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
    type = list
    description = "IP addresses for the DNS server"
}
variable "subnet_names" {
  description = "Name of the identifying subnets"
}
variable "subnet_prefixes" {
  description = "subnets to be created on the specefied vnet"
}
variable "project" {
    default = "poc"
}
variable "prefix"{
    description = "provide the prefix as per the naming convention"
}
variable "environment" { 
    default = "dev"
}
variable "application_name" {
    default = "test_app"
}
variable "region" {
    default = "east_us"
}
variable "owner" { 
    default = "test@hotmail.com"
}

variable "public_ip_name" {
    description = "Public IP to access the VM form internet"
}
variable "allocation_method" {
    description = "Public IP alloation methond - possible values are Static or Dynamic"
    default = "Dynamic"
}
variable "sku" {
    description = "SKU for the publicip to be created, possible values - Basic or Standard"
    default = "Basic"
}
variable "vm_host_name" {
    description = "Host name for the VM"
}
variable "vm_zone" {
    description = "Zone where the VM is located"
}
variable "virtual_machine_size" {
    description = "The image sku to be used to create the VM"
}
variable "vm_os_disk_size" {
    description = "Size of the managed OS disk for the VM"
}
variable "vm_data_disk_size" {
    description = "Size of the managed data disk for the VM"
}
variable "publisher"{
    description = "publisher details"
}
variable "offer"{
    description = "Offer details for vm"
}
variable "vm_sku"{
    description = "Sku details"
}
variable "vm_version"{
   description = "version details"
   }
   variable "gateway_zones" {
  description = "application gateway zone"
}
variable "gateway_sku_name" {
  description = "The Name of the SKU to use for this Application Gateway. Possible values are Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2"
}
variable "gateway_sku_tier" {
  description = "The Tier of the SKU to use for this Application Gateway. Possible values are Standard, Standard_v2, WAF and WAF_v2"
}
variable "gateway_custom_rules"{
  description = "gateway custom rules"
  default = []
}

variable "gateway_conf_name"{
description = "frontend ip conf name"
}