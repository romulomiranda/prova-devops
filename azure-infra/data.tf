data "azurerm_key_vault" "key-devops-prova" {
  name = "key-devops-prova"
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "dockerpass" {
  name = "dockerpass"
  key_vault_id = data.azurerm_key_vault.key-devops-prova.id
}

data "azurerm_key_vault_secret" "dockerurl" {
  name = "dockerurl"
  key_vault_id = data.azurerm_key_vault.key-devops-prova.id
}

data "azurerm_key_vault_secret" "storageaccesskey" {
  name = "storageaccesskey"
  key_vault_id = data.azurerm_key_vault.key-devops-prova.id
}

output "dockerpass" {
  value = data.azurerm_key_vault_secret.dockerpass.value
  sensitive = true
}

output "dockerurl" {
  value = data.azurerm_key_vault_secret.dockerurl.value
  sensitive = true
}