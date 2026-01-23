module "workload" {
  source = "git::https://github.com/Dfausben/Terraform-Weekly-Stemdo-Aux.git//module"

  name     = var.name
  vpc_cidr = var.vpc_cidr
  subnets  = var.subnets

  instances        = var.instances
  ingress_ssh_cidr = var.ingress_ssh_cidr

  # common_tags se puede dejar vacío porque usamos default_tags en provider
  common_tags = {}
}
