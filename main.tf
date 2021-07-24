# VARIABLES


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
}

resource "databricks_user" "my-user" {
  user_name     = "test-user@databricks.com"
  display_name  = "Test User"
}

