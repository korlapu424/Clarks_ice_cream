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
    cic_vpc_id = "10.0.0.0/16"
}