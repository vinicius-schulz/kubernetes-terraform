terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

resource "azurerm_resource_group" "resourcegrouptask4" {
  name     = "ResourceGroupTask4"
  location = "westus2"
}

resource "azurerm_kubernetes_cluster" "kubernetesclustertask4" {
  name                = "KubernetesClusterTask4"
  location            = azurerm_resource_group.resourcegrouptask4.location
  resource_group_name = azurerm_resource_group.resourcegrouptask4.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}