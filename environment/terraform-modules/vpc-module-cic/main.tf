terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
  required_version = "~> 1.0"
}

provider "aws" {
  
    region = var.region
  
}

resource "aws_vpc" "vpc_clarks_ice_cream" {
    
    cidr_block = var.cic_vpc_id
    tags = {
      Application_name = "Clarks_Ice_Cream"
      Create_by = "Terraform"
      resource = "VPC"
    }
  
}

resource "aws_subnet" "Clarks_Ice_Cream_Public_Subnet" {
    count = length(var.public_subnet_cidr)
    vpc_id = aws_vpc.vpc_clarks_ice_cream.id
    cidr_block = element(var.public_subnet_cidr,count.index)
    availability_zone = element(var.azs,count.index)
    tags = {
      Application_name = "Clarks_Ice_Cream"
      Create_by = "Terraform"
      resource = "VPC.Public.Subnet"
      Name = "CIC VPC Public Subnet ${count.index +1}" 
    }
  
}

resource "aws_subnet" "Clarks_Ice_Cream_Private_Subnet" {
    count = length(var.private_subnet_cidr)
    vpc_id = aws_vpc.vpc_clarks_ice_cream.id
    cidr_block = element(var.private_subnet_cidr,count.index)
    availability_zone = element(var.azs,count.index)
    tags = {
      Application_name = "Clarks_Ice_Cream"
      Create_by = "Terraform"
      resource = "VPC.Private.Subnet"
      Name = "CIC VPC Private Subnet ${count.index +1}" 
    }
  
}

resource "aws_internet_gateway" "CIC_gw" {
  vpc_id = aws_vpc.vpc_clarks_ice_cream.id
  tags = {
      Application_name = "Clarks_Ice_Cream"
      Create_by = "Terraform"
      resource = "VPC.Private.Subnet"
      Name = "CIC VPC Internet gateway" 
    }
}

resource "aws_route_table" "CIC_second_rt" {
    vpc_id = aws_vpc.vpc_clarks_ice_cream.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.CIC_gw.id
    }
    tags = {
      Application_name = "Clarks_Ice_Cream"
      Create_by = "Terraform"
      resource = "VPC.Private.Subnet"
      Name = "2 round table" 
    }
  
}


resource "aws_route_table_association" "CIC_second_rt_public_subset_asso" {
    count = length(var.public_subnet_cidr)
    subnet_id = element(aws_subnet.Clarks_Ice_Cream_Public_Subnet[*].id,count.index)
    route_table_id = aws_route_table.CIC_second_rt.id
  
}

resource "aws_eip" "CIC_eip" {
  vpc = true
  
}

resource "aws_nat_gateway" "CIC_nat_gateway" {
  subnet_id = aws_subnet.Clarks_Ice_Cream_Public_Subnet[1].id
  allocation_id = aws_eip.CIC_eip.id
    
}

resource "aws_route_table" "CIC_thrid_rt" {
    vpc_id = aws_vpc.vpc_clarks_ice_cream.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.CIC_nat_gateway.id
    }
    tags = {
      Application_name = "Clarks_Ice_Cream"
      Create_by = "Terraform"
      resource = "VPC.Public.Subnet"
      Name = "3rd round table" 
    }
  
}

resource "aws_route_table_association" "CIC_third_rt_private_subset_asso" {
    count = length(var.private_subnet_cidr)
    subnet_id = element(aws_subnet.Clarks_Ice_Cream_Private_Subnet[*].id,count.index)
    route_table_id = aws_route_table.CIC_thrid_rt.id
  
}

#data "aws_subnet_ids" "cic_subnet_ids" {
  #vpc_id = aws_vpc.vpc_clarks_ice_cream.id
#}
#data "aws_subnet" "cic_subnet" {
#  count = "${length(data.aws_subnet_ids.cic_subnet_ids.ids)}"
#  id    = "${tolist(data.aws_subnet_ids.cic_subnet_ids.ids)[count.index]}"
#  depends_on = [ 
#    aws_subnet.Clarks_Ice_Cream_Private_Subnet,
#    aws_subnet.Clarks_Ice_Cream_Public_Subnet
#     ]
#  
#}