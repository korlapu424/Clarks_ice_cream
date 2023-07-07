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
    region = "us-east-1"
    private_subnet_cidr = ["10.0.1.0/24", "10.0.2.0", "10.0.3.0" ]
    public_subnet_cidr = ["10.0.1.0/24", "10.0.2.0", "10.0.3.0" ]
    azs = ["us-east-1a","us-east-1b","us-east-1c"]
}