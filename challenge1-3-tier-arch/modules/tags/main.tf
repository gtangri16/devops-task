locals {
    default_tags = {
        project     = var.project
        environment = var.environment
        app_name    = var.app_name
        region      = var.region
        owner       = var.owner
    }
   
}