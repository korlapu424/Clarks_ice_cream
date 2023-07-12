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
  
}

resource "aws_instance" "cic_host" {
    ami = var.AMI_Name
    instance_type =  var.instance_type
    #security_groups = var.cic_sg
    subnet_id = var.vpc_subnet
    vpc_security_group_ids = var.cic_sg

    tags = {
      "Name" : var.EC2_name
    }
    

  
}