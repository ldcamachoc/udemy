terraform {
  backend "azurerm" {
    resource_group_name  = "remote-state"
    storage_account_name = "udemylearnterraform365"
    container_name       = "terraformdemo"
    key                  = "web.tfstate"
  }
}
