terraform {
  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}

  client_id = "e263901f-ba6d-4b5f-872e-f709fc157bdb"
  tenant_id = "0d063dd2-62e8-4c33-9ed1-b9756d208d36"
  client_secret = "5Ea8Q~YB9.pVXjdNJrXcumOiXfk0GZ12lqrqic7p"
  subscription_id = "acfa2308-4e24-4c5c-8e13-7563ca3c70d2"
}