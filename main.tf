# VARIABLES

variable "host" {}
variable "token" {}

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
  host  = var.host
  token = var.token
  azure_subscription_id       = ""
  azure_client_secret         = ""
  azure_client_id             = ""
  azure_tenant_id             = ""
}

resource "databricks_user" "my-user" {
  user_name     = "test-user@databricks.com"
  display_name  = "Test User"
}

