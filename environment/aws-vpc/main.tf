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
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
  
}

module "vpc-module-cic" {
    source = "../terraform-modules/vpc-module-cic"   
    cic_vpc_id = "10.0.0.0/16"
    region = "us-east-1"
    private_subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]
    public_subnet_cidr = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24" ]
    azs = ["us-east-1a","us-east-1b","us-east-1c"]
 
}
