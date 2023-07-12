variable "sg_cidr" {
    type = list(string)
    description = "enter the cidr block"  
}

variable "Sg_name" {
    type = string
    description = "Enter the sg name"
    default = "cic_ec2_sg"  
}

variable "cic_vpc_id" {
    type = string
    default = "vpc-094732baea607a014"
}