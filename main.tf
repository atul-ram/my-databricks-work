# VARIABLES
variable "host" {}
variable "token" {}
variable "client_secret" {}
variable "client_id" {}
variable "tenant_id" {}
/* azuread variables*/
variable "admin_group" {}
variable "dev_group" {}

# VERSIONS
terraform {
  required_providers {
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.3.5"
    }   
    azuread = {
      source = "hashicorp/azuread"
      version = "=1.6.0"
    }
  }
  backend "azurerm" { }
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

provider "azuread" {}

data "databricks_group" "admin-group" {
    display_name = "admins"
}

data "databricks_group" "users-group" {
    display_name = "users"
}

data "azuread_group" "aad-admin-group" {
  display_name     = var.admin_group
  security_enabled = true
}

data "azuread_group" "aad-dev-group" {
  display_name     = var.dev_group
  security_enabled = true
}

data "azuread_users" "aad-admin-users" {
  object_ids = data.azuread_group.aad-admin-group.members
}

data "azuread_users" "aad-dev-users" {
  object_ids = data.azuread_group.aad-dev-group.members
}

resource "databricks_user" "adb-admin-user" {
    for_each = { for i,v in data.azuread_users.aad-admin-users.users: i=>v }
      user_name     = each.value.mail
      display_name  = each.value.display_name

}

resource "databricks_user" "adb-dev-user" {
    for_each = { for i,v in data.azuread_users.aad-dev-users.users: i=>v }
      user_name     = each.value.mail
      display_name  = each.value.display_name
}
/*
resource "databricks_group_member" "i-am-admin"{

}
*/




