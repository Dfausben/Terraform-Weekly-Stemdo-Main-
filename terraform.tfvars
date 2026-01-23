region      = "eu-west-3"
name        = "demo"
environment = "prod"

# Consume el módulo desde GitHub (recomendado: tag de versión)

vpc_cidr = "10.10.0.0/16"

subnets = {
  pub_a = { cidr = "10.10.1.0/24", az = "eu-west-1a", public = true }
  pub_b = { cidr = "10.10.2.0/24", az = "eu-west-1b", public = true }
}

# Opcional: abre SSH desde tu IP
# ingress_ssh_cidr = "1.2.3.4/32"

instances = {
  web1 = {
    ami           = "ami-XXXXXXXX"
    instance_type = "t3.micro"
    subnet_key    = "pub_a"
    user_data     = <<-EOF
      #!/bin/bash
      yum install -y httpd
      systemctl enable --now httpd
      echo "Hola desde web1" > /var/www/html/index.html
    EOF
    tags = { Role = "web" }
  }

  web2 = {
    ami           = "ami-XXXXXXXX"
    instance_type = "t3.small"
    subnet_key    = "pub_b"
    user_data     = <<-EOF
      #!/bin/bash
      yum install -y httpd
      systemctl enable --now httpd
      echo "Hola desde web2" > /var/www/html/index.html
    EOF
    tags = { Role = "web" }
  }
}
