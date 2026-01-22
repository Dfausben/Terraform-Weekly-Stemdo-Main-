output "alb_dns_name" {
  value       = module.workload.alb_dns_name
  description = "DNS público del ALB"
}

output "instance_ids" {
  value       = module.workload.instance_ids
  description = "IDs de EC2 por clave"
}

output "resource_group_name" {
  value       = module.workload.resource_group_name
  description = "Nombre del AWS Resource Group (si está habilitado)"
}
