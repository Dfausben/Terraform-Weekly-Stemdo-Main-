provider "aws" {
  region = "eu-west-3"

  default_tags {
    tags = {
      Owner       = "dfaustino"
      Project     = "Test"
      Environment = "Sandbox"
      ManagedBy   = "dfb_terraform"
    }
  }
}
