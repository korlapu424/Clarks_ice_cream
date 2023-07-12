# Descripiton   :  This Module will help to create the Security groups
# Author        :  Sunil Kumar Korlapu
# Date          :  10th July,2023

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}

resource "aws_security_group" "CIC_Security_group" {
    name = var.Sg_name
    description = "Create the Security group for CIC"
    vpc_id = var.cic_vpc_id
    ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = var.sg_cidr
    
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 61596
    protocol         = "tcp"
    cidr_blocks      = var.sg_cidr
    
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}