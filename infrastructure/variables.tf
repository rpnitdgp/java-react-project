variable "resource_group_name" {
  description = "The name for the resource group"
  type        = string
  default     = "ravi-java-react-app"
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "West Europe"
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan"
  type        = string
  default     = "java-react-appservice-plan"
}

variable "frontend_app_service_name" {
  description = "The name of the frontend App Service"
  type        = string
  default     = "react-fe-appservice-plan"
}

variable "backend_app_service_name" {
  description = "The name of the backend App Service"
  type        = string
  default     = "java-be-appservice-plan"
}

variable "container_registry_name" {
  description = "The name of the Azure Container Registry"
  type        = string
   default     = "javareactcontainerregistry"
}
