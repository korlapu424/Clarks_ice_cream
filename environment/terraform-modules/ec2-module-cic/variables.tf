variable "AMI_Name" {
    type = string
    description = "Enter the AMI name to provision the EC2 instance"
    default = "dkjjks"
  
}

variable "instance_type" {
    type = string
    description = "Enter the Instance type"  
    default = "t2.micro"
}

variable "cic_sg" {
  type = set(string)
  description = "Enter the Security group name"
  default = ["CIC_ec2_sg"]
}

variable "vpc_subnet" {
    type = string
    description = "Enter the VPC - subnet name"
    default = "subnet-01c445a5884143a00"  
}
variable "region" {
    type = string
    default = "us-east-1"
  
}

variable "EC2_name" {
    type = string
    default = "EC2_Intance"
}
