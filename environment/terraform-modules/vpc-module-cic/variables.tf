# https://spacelift.io/blog/terraform-aws-vpc


variable "cic_vpc_id" {
    type = string
  
}


variable "region" {
    type = string
    default = "us-east-1"
 }

variable "private_subnet_cidr" {
    type = list(string)
  
}

variable "public_subnet_cidr" {
    type = list(string)
}

variable "azs" {
    type = list(string)
  
}


