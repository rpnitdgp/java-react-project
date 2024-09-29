provider "azurerm" {
  features {}
}

# Resource Group for both Frontend and Backend
module "app_rg" {
  source = "./resource_group.tf"
  name   = var.resource_group_name
  location = var.location
}

# Azure Container Registry
module "container_registry" {
  source = "./container_registry.tf"
  name   = var.container_registry_name
  resource_group_name = module.app_rg.name
  location = var.location
}

# App Service Plan for Backend
module "backend_service_plan" {
  source = "./app_service_plans.tf"
  name   = var.app_service_plan_name
  resource_group_name = module.app_rg.name
  location = var.location
}

# App Service Plan for Frontend
module "frontend_service_plan" {
  source = "./app_service_plans.tf"
  name   = var.app_service_plan_name
  resource_group_name = module.app_rg.name
  location = var.location
}

# Backend App Service
module "backend_app_service" {
  source = "./backend_app_service.tf"
  name   = var.backend_app_service_name
  app_service_plan_id = module.backend_service_plan.id
  resource_group_name = module.app_rg.name
}

# Frontend App Service
module "frontend_app_service" {
  source = "./frontend_app_service.tf"
  name   = var.frontend_app_service_name
  app_service_plan_id = module.frontend_service_plan.id
  resource_group_name = module.app_rg.name
}
