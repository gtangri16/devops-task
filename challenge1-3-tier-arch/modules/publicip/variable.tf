variable "rg_name" {
    description = "Provide resourcegroup name"  
}
variable "resource_location" {
    description = "Provide resource location"  
}
variable "public_ip_name" {
    description = "Name of the public IP" 
}
variable "allocation_method" {
    description = "Defines the allocation method, possible values are Static or Dynamic"
    default = "Dynamic"
}
variable "sku" {
    description = "SKU for the publicip to be created, possible values - Basic or Standard"
    default = "Basic"
}
variable "prefix"{
    description = "provide the prefix as per the naming convention"
}
variable "tags" {
  
}
