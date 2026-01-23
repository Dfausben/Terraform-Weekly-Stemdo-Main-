provider "aws" {
  region = var.region

  # Etiquetas por defecto para TODO lo que soporte tags
  default_tags {
    tags = {
      ManagedBy   = "Terraform"
      Project     = var.name
      Environment = var.environment
    }
  }
}