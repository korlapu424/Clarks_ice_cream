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
  region = var.region
  application_name = var.application_name
  Department_name = var.Department_name
  subnet_ids = [var.cic_subnet1,var.cic_subnet2,var.cic_subnet3]
  #subnet_ids = module.vpc-module-cic.cic_subnet_ids
 
  instance_type = [var.instance_type]
  desired_size = 2
  max_size = 3
  min_size = 2
  
}