variable "region" {
    type = string
    description = "Provide the AWS region name"
    default = "us-east-1"  
}

variable "application_name" {
    type = string
    description = "Application name"
    default = "TEST_CIC"
}


variable "Department_name" {
    type = string
    description = "Department name"
    default = "TEST_CIC"
}

variable "subnet_ids" {
    type = list(string)
    nullable = false
    description = "Enter the Subnet IDS"
  
}

variable "instance_type" {
    type = list(string)
    default = ["t2.micro"]
    description = "Intance type for EC2 worker nodes"
  
}

variable "max_size" {
    type = number
    default = 3  
}

variable "min_size" {
    type = number
    default = 2 
}
variable "desired_size" {
    type = number
    default = 2  
}