# https://spacelift.io/blog/terraform-aws-vpc
variable "public_subnet_cidr" {
    type = list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    description = "Public Subnet CIDR Values"
}


variable "private_subnet_cidr" {
    type = list(string)
    default = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
    description = "Private Subnet CIDR Values"
}