# Genera un sufijo aleatorio de 6 caracteres en minúsculas sin caracteres especiales
resource "random_string" "storage_suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_storage_account" "storage" {
  # Nombre único global combinado dinámicamente
  name                     = "stlabmaster${var.environment}${random_string.storage_suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Políticas de Seguridad Avanzada (Garantizan TLS 1.2 y cifrado en tránsito obligatorio)
  min_tls_version            = "TLS1_2"
  https_traffic_only_enabled = true

  tags = local.common_tags
}

resource "azurerm_storage_container" "container" {
  name                  = "backups"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}