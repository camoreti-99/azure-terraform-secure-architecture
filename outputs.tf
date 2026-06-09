output "load_balancer_public_ip" {
  value       = azurerm_public_ip.lb_pip.ip_address
  description = "IP pública del Load Balancer para acceder a la web."
}

output "bastion_host_name" {
  value       = azurerm_bastion_host.bastion.name
  description = "Nombre del host de Bastion para auditorías."
}