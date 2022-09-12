variable "tags" {
  description = "appgateway tags"
}
variable "prefix" {
    description = "provide the prefix as per the naming convention"
}
variable "rg_name" {
    description = "Provide resource group name without prefix."
}
variable "resource_location" {
  description = "Location for the resource group."
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

variable "gateway_conf_name"{
description = "frontend ip conf name"
}
variable "public_id" {
  description = "Public ip address id to be associated with this gateway."
}

variable "subnet_name" {
  description = "Name of the subnet where the NSG needs to be associated with"
}

variable "vnet_name" {
  description = "Name of the virtual network which the subnet belongs to"
}
