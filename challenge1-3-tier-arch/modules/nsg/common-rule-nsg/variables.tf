variable  "app_name"{
  description = "nsg name"
}
variable "rg_name"{
description = "nsg rg name"
}

variable "resource_location" {
description = "nsg location"
}

variable "tags" {
description = "nsg tags"
}
variable "prefix"{
    description = "provide the prefix as per the naming convention"
}
variable  "nsg_rules"{
  description = "define nsg rules"
}