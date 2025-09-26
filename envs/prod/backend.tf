terraform {
  backend "azurerm" {
    resource_group_name  = "erp"
    storage_account_name = "limbertfstate"
    container_name       = "tfstate"
    key                  = "envs/prod.tfstate"
    use_azuread_auth     = true
  }
}
