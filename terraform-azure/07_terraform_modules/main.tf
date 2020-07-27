provider "azurerm" {
  features {}
  version = 2.20
}

provider "random" {
  version = "2.2"
}

module "location_east1" {
  source = "./location"

  web_server_location      = "eastus"
  web_server_rg            = "${var.web_server_rg}-eastus"
  resource_prefix          = "${var.resource_prefix}-eastus"
  web_server_address_space = "1.0.0.0/22"
  web_server_name          = var.web_server_name
  environment              = var.environment
  web_server_count         = var.web_server_count
  web_server_subnets = {
    web-server-subnet  = "1.0.1.0/24"
    AzureBastionSubnet = "1.0.2.0/24"
  }

  terraform_script_version = var.terraform_script_version
  admin_password           = data.azurerm_key_vault_secret.admin_password.value
  domain_name_label        = var.domain_name_label
}

module "location_east2" {
  source = "./location"

  web_server_location      = "eastus2"
  web_server_rg            = "${var.web_server_rg}-eastus2"
  resource_prefix          = "${var.resource_prefix}-eastus2"
  web_server_address_space = "2.0.0.0/22"
  web_server_name          = var.web_server_name
  environment              = var.environment
  web_server_count         = var.web_server_count
  web_server_subnets = {
    web-server-subnet  = "2.0.1.0/24"
    AzureBastionSubnet = "2.0.2.0/24"
  }

  terraform_script_version = var.terraform_script_version
  admin_password           = data.azurerm_key_vault_secret.admin_password.value
  domain_name_label        = var.domain_name_label
}

resource "azurerm_resource_group" "global_rg" {
  name     = "traffic-manager-rg"
  location = "eastus"
}

resource "azurerm_traffic_manager_profile" "traffic_manager" {
  name                   = "${var.resource_prefix}-traffic-manager"
  resource_group_name    = azurerm_resource_group.global_rg.name
  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = var.domain_name_label
    ttl           = 100
  }

  monitor_config{
    protocol = "http"
    port     = 80
    path     = "/"
  }
}

resource "azurerm_traffic_manager_endpoint" "traffic_manager_east1"{
  name                   = "${var.resource_prefix}-eastus-endpoint"
  resource_group_name    = azurerm_resource_group.global_rg.name
  profile_name           = azurerm_traffic_manager_profile.traffic_manager.name
  target_resource_id     = module.location_east1.web_server_lb_public_ip_id
  type                   = "azureEndpoints"
  weight                 = 100
}

resource "azurerm_traffic_manager_endpoint" "traffic_manager_east2"{
  name                   = "${var.resource_prefix}-eastus2-endpoint"
  resource_group_name    = azurerm_resource_group.global_rg.name
  profile_name           = azurerm_traffic_manager_profile.traffic_manager.name
  target_resource_id     = module.location_east2.web_server_lb_public_ip_id
  type                   = "azureEndpoints"
  weight                 = 100
}
