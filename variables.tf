variable "location" {
  type        = string
  default     = "spaincentral"
  description = "Región de Azure para desplegar los recursos."
}

variable "environment" {
  type        = string
  default     = "pro"
  description = "Ambiente de despliegue (dev, qa, pro)."

  validation {
    condition     = contains(["dev", "qa", "pro"], var.environment)
    error_message = "El ambiente debe ser estrictamente 'dev', 'qa' o 'pro'."
  }
}

variable "vm_count" {
  type        = number
  default     = 2
  description = "Número de máquinas virtuales detrás del balanceador."

  validation {
    condition     = var.vm_count > 0 && var.vm_count <= 5
    error_message = "Por costes y diseño, el número de VMs debe estar entre 1 y 5."
  }
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