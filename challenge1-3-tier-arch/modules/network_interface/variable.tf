variable "rg_name" {
    description = "Provide resourcegroup name"  
}
variable "resource_location" {
    description = "Provide resource location"  
}
variable "nic_name" {
    description = "Primary nic card name which will attach to VM"  
}
variable "subnet_name" {
    description = "Subnet name for the nic"  
}
variable "vnet_name" {
    description = "Vnet which the subnet belongs to"  
}
variable "tags" {
    description = "Please provide tags"  
}
variable "nic_address_allocation" {
    default = "dynamic"
    description = "Address allocation type - static or dynamic"  
}
variable "prefix"{
    description = "provide the prefix as per the naming convention"
}