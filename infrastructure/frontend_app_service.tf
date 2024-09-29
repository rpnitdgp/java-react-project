resource "azurerm_app_service" "frontend" {
  name                = var.frontend_app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}
