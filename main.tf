# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
 
provider "azurerm" {
environment = "china"
  features {}
}

resource "azurerm_virtual_network" "net" {
  name                = "s7-mgmt-p-cnn3-vnet-adds"
  resource_group_name = "s7-mgmt-p-rsg-hub-network"
  location            = "China North 2"
  address_space       = ["10.10.254.0/24"]
}

resource "azurerm_subnet" "sub" {
  name                 = "s7-mgmt-p-cnn3-snet-adds"
  virtual_network_name = azurerm_virtual_network.net.name
  resource_group_name  = "s7-mgmt-p-rsg-hub-network"
  address_prefixes     = ["10.10.254.0/26"]
}

