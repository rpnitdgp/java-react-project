resource "azurerm_role_assignment" "acr_pull" {
  principal_id   = azurerm_app_service.backend_app_service.identity[0].principal_id  # App Service Managed Identity
  role_definition_name = "AcrPull"
  scope          = azurerm_container_registry.acr.id
}

resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku {
    name = "Basic"
  }
  admin_enabled = true
}
