resource "azurerm_resource_group" "app_rg" {
  name     = var.name
  location = var.location
}
