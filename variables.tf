variable "location" {
  type        = string
  default     = "spaincentral"
  description = "Región de Azure para desplegar los recursos."
}

variable "environment" {
  type        = string
  default     = "pro"
  description = "Ambiente de despliegue (dev, qa, pro)."
}

variable "vm_count" {
  type        = number
  default     = 2
  description = "Número de máquinas virtuales detrás del balanceador."
}

variable "admin_username" {
  type        = string
  default     = "azureuser"
  description = "Usuario administrador de las VMs."
}

variable "ssh_public_key" {
  type        = string
  description = "Clave pública SSH para las VMs (inyectada por CI/CD o tfvars)."
}