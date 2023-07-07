terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
  required_version = "~>1.2"
}

module "vpc-module-cic" {
    source = "./terraform-modules/vpc-module-cic"   
}