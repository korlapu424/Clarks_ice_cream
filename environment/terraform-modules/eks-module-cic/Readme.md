EKS Cluster terraform module
===========

A terraform module to provide a EKS cluster provision in the AWS cloud platform

This should be used an a generic template to be included in every terraform module.

Module Input Variables
----------------------

- `name` - variable name
- `environment` - variable environment

- `region `             : String        : Enter the AWS region name                                    
- `application_name`    : String        : Enter the Application name used in EKS cluster and Node name  
- `Department_name`     : String        : Enter the Department name used in EKS cluster and Node name   
- `subnet_ids`          : list(String)   : Enter the Provate subnet ids                                  
- `instance_type`       : list(string)   : Enter the EC2 intance tyoe for creating the Worker node       
- `desired_size`        : number        : Enter the Desired size for worker group                      
- `max_size`            : number        : Enter the Max size for worker group                          
- `min_size`            : number        : Enter the Min size for worker group                          

Example calling Module
-----------------------

module "cic_eks-cluster" {
  source = "./terraform-modules/eks-module-cic"
  region = "us-east-1"
  application_name = "CIC-ECOM"
  Department_name = "ENGINEERING"
  subnet_ids = ["subnet-02b576603661c47fc","subnet-0e5c103de070191fb","subnet-0247777776c6a4d43"]
  instance_type = ["t2.micro"]
  desired_size = 2
  max_size = 3
  min_size = 2
  
}

Outputs
=======

 - `Cluster_name` - Cluster Name



Authors
=======

skkorlapu@gmail.com