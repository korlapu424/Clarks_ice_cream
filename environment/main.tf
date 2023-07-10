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
    private_subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]
    public_subnet_cidr = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24" ]
    azs = ["us-east-1a","us-east-1b","us-east-1c"]
}

module "sp-module-cic" {
  source = "./terraform-modules/sg-module-cic"
  sg_cidr = ["0.0.0.0/0"]
  Sg_name = "CIC_SG_EC2"  
  cic_vpc_id = "vpc-094732baea607a014"
}

module "cic_ec2-instance" {
  source = "./terraform-modules/ec2-module-cic"
  AMI_Name = "ami-06ca3ca175f37dd66"
  instance_type = "t2.micro"
  #cic_sg = ["sg-0e3123278ee840935"]
  cic_sg = [module.sp-module-cic.Sg_id]
  vpc_subnet = "subnet-01c445a5884143a00"
  region = "us-east-1" 
  EC2_name = "CIC_TEST_Docker_EC2"
  
  
}


