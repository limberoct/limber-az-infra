terraform {
  required_version = ">= 1.6"
  required_providers {
    azurerm = { source = "hashicorp/azurerm", version = ">= 3.111.0" }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "244d8627-6e32-4de4-b6f3-e01a4cef8118"
}
