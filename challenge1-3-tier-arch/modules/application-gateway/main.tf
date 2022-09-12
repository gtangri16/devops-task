data "azurerm_subnet" "gateway_subnet" {
  name = "${var.subnet_name}"
  virtual_network_name = var.vnet_name
  resource_group_name = var.rg_name
}
resource "azurerm_application_gateway" "main" {
  name                = "${var.prefix}-01-appgw"
  resource_group_name = var.rg_name
  location            = var.resource_location
  zones               = var.gateway_zones

  tags = var.tags

  sku {
    name = var.gateway_sku_name
    tier = var.gateway_sku_tier
  }
  
  autoscale_configuration {
    min_capacity = 2
    max_capacity = 4
  }
  gateway_ip_configuration {
    name      = "${var.gateway_conf_name}-gateway-ip-configuration"
    subnet_id = data.azurerm_subnet.gateway_subnet.id
  }

  frontend_ip_configuration {
    name                 = "${var.prefix}-frontendpublicip"
    public_ip_address_id = var.public_id
  }

  frontend_port {
    name = "${var.prefix}-fp-80"
    port = 80
  }

  backend_address_pool {
    name = "${var.prefix}-backend-pool"
	}

  backend_http_settings {
    name                  = "${var.prefix}-http-app"
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = 80
    protocol              = "Https"
    request_timeout       = 300
  }

  http_listener {
    name                           = "${var.prefix}-listner"
    frontend_ip_configuration_name = "${var.prefix}-frontendpublicip"
    frontend_port_name             = "${var.prefix}-fp-80"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "${var.prefix}-rrr_name"
    rule_type                  = "Basic"
    http_listener_name         = "${var.prefix}-listner"
    backend_address_pool_name  = "${var.prefix}-backend-pool"
    backend_http_settings_name = "${var.prefix}-https-app"
  }

}
