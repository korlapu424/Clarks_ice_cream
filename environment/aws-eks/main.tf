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
  region = "var.region"
  access_key = var.devops_access_key
  secret_key = var.devops_secret_key
  
}

module "cic_eks-cluster" {
  source = "../terraform-modules/eks-module-cic"
  region = "us-east-1"
  application_name = "CIC-ECOM"
  Department_name = "ENGINEERING"
  subnet_ids = ["subnet-01103f6475be1dbd5","subnet-096f5c9c8c62b8fcf","subnet-092de6500894bdc8c"]
  #subnet_ids = module.vpc-module-cic.cic_subnet_ids
 
  instance_type = ["t2.micro"]
  desired_size = 2
  max_size = 3
  min_size = 2
  
}