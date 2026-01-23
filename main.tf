locals {
  use_default_ami = length([
    for _, i in var.instances : i.ami
    if i.ami == "ami-XXXXXXXX" || i.ami == ""
  ]) > 0
}

data "aws_ami" "al2023" {
  count       = local.use_default_ami ? 1 : 0
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

locals {
  resolved_instances = {
    for k, v in var.instances :
    k => merge(v, {
      ami = local.use_default_ami && (v.ami == "ami-XXXXXXXX" || v.ami == "") ? data.aws_ami.al2023[0].id : v.ami
    })
  }
}

module "workload" {
  source = "git::https://github.com/Dfausben/Terraform-Weekly-Stemdo-Aux.git//module"

  name     = var.name
  vpc_cidr = var.vpc_cidr
  subnets  = var.subnets

  instances        = local.resolved_instances
  ingress_ssh_cidr = var.ingress_ssh_cidr
  enable_alb       = var.enable_alb

  # common_tags se puede dejar vacío porque usamos default_tags en provider
  common_tags = {}
}
