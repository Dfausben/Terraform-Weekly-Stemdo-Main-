module "workload" {
  source = "git::https://github.com/Dfausben/Terraform-Weekly-Stemdo-Aux.git//module?ref=v1.0.0"

  name     = var.name
  vpc_cidr = var.vpc_cidr
  subnets  = var.subnets

  instances        = var.instances
  ingress_ssh_cidr = var.ingress_ssh_cidr

  # Opcional (si lo dejaste en el módulo):
  create_resource_group = var.create_resource_group

  # common_tags se puede dejar vacío porque usamos default_tags en provider
  common_tags = {}
}
