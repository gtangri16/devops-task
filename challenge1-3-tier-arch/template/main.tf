data "azurerm_subscription" "current" {
}
module "tags" {
  source = "../modules/tags"
  project         = var.project
  environment     = var.environment
  app_name        = var.application_name
  region          = var.region
  owner           = var.owner
}
module "resource_group" {
    source = "../modules/resource_group"
    resource_location   = var.resource_location
    rg_name = var.rg_name
    prefix = var.prefix
    tags                = local.required_tags
}
locals {
    required_tags = module.tags
    resource_group_name = module.resource_group
 }
    
module "nsg_web" {
     source = "../modules/nsg/common-rule-nsg"
  rg_name = var.rg_name
  prefix = var.prefix
  app_name = "web"
  nsg_rules = local.nsg_rules_web
  tags = local.required_tags
  resource_location = var.resource_location
   depends_on     = [ module.resource_group ]
}

module "nsg_db" {
     source = "../modules/nsg/common-rule-nsg"
  rg_name = var.rg_name
  prefix = var.prefix
  app_name =  "db"
  nsg_rules = local.nsg_rules_db
  tags = local.required_tags
  resource_location = var.resource_location
   depends_on     = [ module.resource_group ]
}

module "nsg_backend" {
     source = "../modules/nsg/common-rule-nsg"
  rg_name = var.rg_name
  prefix = var.prefix
  app_name = "backend"
  nsg_rules = local.nsg_rules_backend
  tags = local.required_tags
  resource_location = var.resource_location
   depends_on     = [ module.resource_group ]
}

module "nsg_gateway" {
     source = "../modules/nsg/common-rule-nsg"
  rg_name = var.rg_name
  prefix = var.prefix
  app_name = "gaateway"
  nsg_rules = concat(local.nsg_rules_web, var.gateway_custom_rules)
  tags = local.required_tags
  resource_location = var.resource_location
   depends_on     = [ module.resource_group ,module.nsg_web ]
}

module "vnet" {
    source = "../modules/vnet"
    resource_location   = var.resource_location
    rg_name = var.rg_name
    prefix = var.prefix
    vnet_address_space = var.vnet_address_space
    vnet_name          = var.vnet_name
    dns_servers        = var.dns_servers
    tags           = local.required_tags
    depends_on     = [ module.resource_group ]
}

module "subnets" {
  source             			= "../modules/subnets"
  rg_name			            = var.rg_name
  vnet_name          			= var.vnet_name
  subnet_names       			= var.subnet_names
  subnet_prefixes    			= var.subnet_prefixes
  nsg_id                        = concat(module.nsg_backend.nsg_id,module.nsg_db.nsg_id,module.nsg_gateway.nsg_id,module.nsg_web.nsg_id)
    service_endpoint   			= [["Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage"], ["Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage"],["Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage"],[]]
depends_on     = [ module.vnet, module.nsg_backend ,module.nsg_db, module.nsg_web ]
}


module "public_ip" {
     source = "../modules/publicip"
     public_ip_name = var.public_ip_name
     prefix = var.prefix
     resource_location = var.resource_location
     rg_name = var.rg_name
     allocation_method   = var.allocation_method
     sku = var.sku
     tags = local.required_tags
 }

module "nic" {
      source = "../modules/network_interface"
      
      count = length(var.vm_host_name)
      resource_location   = var.resource_location
      rg_name = var.rg_name
      prefix = var.prefix
      nic_name                 = var.vm_host_name[count.index]
      subnet_name          = var.subnet_names[count.index]
      vnet_name            = var.vnet_name
      depends_on = [ module.vnet]

      tags = local.required_tags
}

module "vm" {
      source = "../modules/vm_windows"

      count = length(var.vm_host_name)
      prefix = var.prefix
      resource_location     = var.resource_location
      rg_name  = var.rg_name
      vm_zone = var.vm_zone

      nic_id = module.nic[count.index].id
      
      vm_name = var.vm_host_name[count.index]
      vm_host_name = var.vm_host_name[count.index]
      vm_os_disk_size = var.vm_os_disk_size
      vm_data_disk_size = var.vm_data_disk_size
      virtual_machine_size =var.virtual_machine_size
      publisher = var.publisher
      offer     = var.offer
      vm_sku     = var.vm_sku
      vm_version = var.vm_version
      depends_on = [ module.resource_group, module.vnet]
      tags = local.required_tags

      
}

module "app_gateway" {
      source = "../modules/application-gateway"
      prefix = var.prefix
      resource_location = var.resource_location
      rg_name			        = var.rg_name
      vnet_name          	    = module.vnet.vnet_name
      subnet_name    			= module.subnets.subnets_name[3]
      gateway_zones             = var.gateway_zones
      gateway_sku_name          = var.gateway_sku_name
      gateway_sku_tier          = var.gateway_sku_tier
      gateway_conf_name         = var.gateway_conf_name
      public_id                 = module.public_ip.id
      tags                      = local.required_tags
       depends_on = [    module.vm, module.vnet , module.public_ip , module.nic  ]
      }
   