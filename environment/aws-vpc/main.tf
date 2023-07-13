terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
  required_version = "~>1.2"
}

provider "aws" {
  region = var.cic_region
  access_key = var.devops_access_key
  secret_key = var.devops_secret_key
}


