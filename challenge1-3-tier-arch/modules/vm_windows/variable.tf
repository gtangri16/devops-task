variable "rg_name" {
    description = "Provide rg name without prefix"
}
variable "resource_location" {
    description = "Provide rg location"
}
variable "nic_id" {
    description = "Id of the NIC"
}
variable "vm_name"{
    description = "Please provide Virtual machine name"
}
variable "vm_host_name" {
    description = "Host name for the VM"
}
variable "vm_zone" {
    description = "Zone where the VM is located"
}
variable "prefix"{
    description = "provide the prefix as per the naming convention"
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
variable "admin_username" {
    default = "test-user"
    description = "username to first time login to system"
}
variable "admin_password" {
    default = "Test@12345"
    description = "password to first time login to system"
}
variable "tags" {
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