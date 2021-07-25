# VERSIONS

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.66"
    }
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.3.5"
    }
  }
}