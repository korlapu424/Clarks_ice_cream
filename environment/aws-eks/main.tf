terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
 
}

provider "aws" {
  region = var.region
  access_key = var.devops_access_key
  secret_key = var.devops_secret_key
  
}

module "cic_eks-cluster" {
  source = "../terraform-modules/eks-module-cic"
  region = "us-east-1"
  application_name = "CIC-ECOM"
  Department_name = "ENGINEERING"
  subnet_ids = [var.cic_subnet1,var.cic_subnet2,var.cic_subnet3]
  #subnet_ids = module.vpc-module-cic.cic_subnet_ids
 
  instance_type = ["t2.micro"]
  desired_size = 2
  max_size = 3
  min_size = 2
  
}