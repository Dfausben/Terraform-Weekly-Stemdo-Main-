variable "region" {
  description = "Región de AWS donde se desplegará la infraestructura"
  type        = string
}

variable "name" {
  description = "Nombre o prefijo del despliegue"
  type        = string
}

variable "environment" {
  description = "Nombre del entorno (dev/prod/etc.)"
  type        = string
  default     = "prod"
}

variable "vpc_cidr" {
  description = "CIDR de la VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "subnets" {
  description = "Mapa de subnets que se pasarán al módulo"
  type = map(object({
    cidr   = string
    az     = string
    public = bool
  }))
}

variable "instances" {
  description = "Mapa de instancias EC2 a desplegar mediante el módulo"
  type = map(object({
    ami           = string
    instance_type = string
    subnet_key    = string
    user_data     = optional(string)
    tags          = optional(map(string), {})
  }))
}

variable "ingress_ssh_cidr" {
  description = "CIDR permitido para acceso SSH a las instancias (opcional)"
  type        = string
  default     = null
}

# Opcional: si quieres configurar el Resource Group del módulo desde aquí
variable "create_resource_group" {
  description = "Crear AWS Resource Group para agrupar recursos por tags"
  type        = bool
  default     = true
}
