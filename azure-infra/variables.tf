variable "resource_group_location" {
  default     = "eastus2"
  description = "Localização do Resource Group."
}

variable "resource_group_name" {
  default     = "rg-prova-devops"
  description = "Nome do Resource Group."
}

variable "container_registry_name" {
    default = "containerProvaDevops"
    description = "Nome do Container Registry."
}

variable "container_registry_location" {
  default     = "eastus2"
  description = "Localização do Container Registry."
}

variable "container_registry_sku" {
  default     = "Premium"
  description = "Size do Container Registry."  
}

variable "virtual_network_name" {
  default     = "vnet-devops"
  description = "Nome da VNET."  
}

variable "virtual_network_range" {
  default     = ["10.0.0.0/16"]
  description = "Range da VNET."  
}

variable "subnet_name" {
  default     = "subnet-devops"
  description = "Nome da Subnet."  
}

variable "subnet_range" {
  default     = ["10.0.2.0/24"]
  description = "Range da Subnet."  
}

variable "storage_account_name" {
  default = "storagedevops001"
}

variable "storage_account_location" {
  default = "eastus2"
}

variable "storage_account_tier" {
  default = "Standard"
}

variable "storage_account_replication" {
  default = "LRS"
}

variable "app_service_plan_name" {
  default = "webapp-asp-devops"
}

variable "app_service_plan_ostype" {
  default = "Linux"
}

variable "app_service_plan_sku" {
  default = "B1"
}

variable "webapp_name" {
  default = "webapp-devops001"
}

variable "webapp_docker_image" {
  default = "${azurerm_container_registry.acr.login_server}/prova-devops"
}

variable "webapp_docker_tag" {
  default = "1.0"
}

variable "azurerm_app_service_name" {
  default = "DevOps-Prova"
}

variable "docker_username" {
  default = "containerProvaDevops"
}

variable "tenant_id" {
  default = "0d063dd2-62e8-4c33-9ed1-b9756d208d36"
}

variable "principal_id" {
  default= "afe6bf2a-0b6f-4c63-a16a-d35e5f2b39ec"
}