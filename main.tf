# VARIABLES

variable "databricks_host" {}
variable "databricks_token" {}

# VERSIONS

terraform {
  required_providers {
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.3.5"
    }
  }
}

# PROVIDERS

provider "databricks" {
  host = var.databricks_host
  token = var.databricks_token
}



