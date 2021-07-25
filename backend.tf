terraform {
    backend "azurerm" {
        storage_account_name = "terraformdemofiles"
        container_name       = "terraform-state"
        key                  = "tf-databricks.tfstate"
    }
}