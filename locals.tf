locals {
  common_tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = "Laboratorio-Maestro"
    Owner       = var.admin_username
    CostCenter  = "Formacion-ASIR"
  }
}