resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = var.resource_group_name
}

resource "azurerm_container_registry" "acr" {
  name                = var.container_registry_name
  resource_group_name = var.resource_group_name
  location            = var.container_registry_location
  sku                 = var.container_registry_sku
  admin_enabled       = false
  public_network_access_enabled = false
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = var.virtual_network_range
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_range
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
}

resource "azurerm_storage_account" "stgraccount" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name

  location                 = var.storage_account_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication
}

resource "azurerm_service_plan" "appserviceplan" {
  name                = var.app_service_plan_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  os_type             = var.app_service_plan_ostype
  sku_name            = var.app_service_plan_sku
}

resource "azurerm_linux_web_app" "webapp" {
  name                  = var.webapp_name
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  service_plan_id       = azurerm_service_plan.appserviceplan.id
#  https_only            = true
#  always_on = false
  site_config { 
#    minimum_tls_version = "1.2"
  always_on = false
  }
}
