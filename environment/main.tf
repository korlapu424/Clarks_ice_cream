terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
  required_version = "~> 1.0"
}

resource "aws_vpc" "vpc_clarks_ice_cream" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Application_name = "Clarks_Ice_Cream"
      Create_by = "Terraform"
      resource = "VPC"
    }
  
}

resource "aws_subnet" "Clarks_Ice_Cream_Public_Subnet" {
    count = length(var.public_subnet_cidr)
    vpc_id = aws_vpc.vpc_clarks_ice_cream
    cidr_block = element(var.public_subnet_cidr,count.index)
    tags = {
      Application_name = "Clarks_Ice_Cream"
      Create_by = "Terraform"
      resource = "VPC.Public.Subnet"
      Name = "CIC VPC Public Subnet $(count.index +1)" 
    }
  
}

resource "aws_subnet" "Clarks_Ice_Cream_Private_Subnet" {
    count = length(var.private_subnet_cidr)
    vpc_id = aws_vpc.vpc_clarks_ice_cream
    cidr_block = element(var.private_subnet_cidr,count.index)
    tags = {
      Application_name = "Clarks_Ice_Cream"
      Create_by = "Terraform"
      resource = "VPC.Private.Subnet"
      Name = "CIC VPC Private Subnet $(count.index +1)" 
    }
  
}