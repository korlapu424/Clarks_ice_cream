####################################################################################################################################################################
#Description    : This Module will create the eks cluster in the AWS environment
#Author         : Sunil Kumar, Korlapu
#Version        : 1.0.0
#Date:          : 12th July,2023
#Last modified  : Sunil Kumar Korlapu
###################################################################################################################################################################
terraform {
  required_providers {
    aws ={
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}

provider "aws" {
    region = var.region  
}

resource "aws_iam_role" "IAM-ROLE-EKS" {
    name = "IAM-ROLE-${var.Department_name}-EKS-CLUSTER-${var.application_name}"
    path = "/"
    assume_role_policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "eks.amazonaws.com"
                    },
                "Action": "sts:AssumeRole"
            }
        ]

    }
    EOF
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role = aws_iam_role.IAM-ROLE-EKS.name  
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly-EKS" {    
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role = aws_iam_role.IAM-ROLE-EKS.name
}

resource "aws_eks_cluster" "CIC-aws_eks_cluster" {
    name = "CIC-EKS-CLUSTER-${var.Department_name}-${var.application_name}"
    role_arn = aws_iam_role.IAM-ROLE-EKS.arn
    vpc_config {
      subnet_ids = var.subnet_ids
    }

    depends_on = [ 
        aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
        aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly-EKS

     ]

}

resource "aws_iam_role" "IAM-ROLE-EKS-NODES" {
    name = "IAM-ROLE-${var.Department_name}-EKS-CLUSTER-NODE-${var.application_name}"
    path = "/"
    assume_role_policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "ec2.amazonaws.com"
                    },
                "Action": "sts:AssumeRole"
            }
        ]

    }
    EOF
}

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role = aws_iam_role.IAM-ROLE-EKS-NODES.name
  
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role = aws_iam_role.IAM-ROLE-EKS-NODES.name
}

resource "aws_iam_role_policy_attachment" "EC2InstanceProfileForImageBuilderECRContainerBuilds" {
    policy_arn = "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds"
    role = aws_iam_role.IAM-ROLE-EKS-NODES.name  
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role = aws_iam_role.IAM-ROLE-EKS-NODES.name  
}

resource "aws_eks_node_group" "CIC-EKS-WORKER-NODE-aws_eks_node_group" {
    cluster_name = aws_eks_cluster.CIC-aws_eks_cluster.name
    node_group_name = "EKS-WORKER-NODE-${var.Department_name}-${var.application_name}"
    node_role_arn = aws_iam_role.IAM-ROLE-EKS-NODES.arn
    subnet_ids = var.subnet_ids
    
    instance_types = var.instance_type
    scaling_config {
      desired_size = var.desired_size
      max_size = var.max_size
      min_size = var.min_size
    }
    tags = {
      "Name" : "${var.Department_name}-${var.application_name}-EKS-Worker-Node"
    }
    depends_on = [ 
        aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
        aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
        aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
        aws_iam_role_policy_attachment.EC2InstanceProfileForImageBuilderECRContainerBuilds,
        aws_eks_cluster.CIC-aws_eks_cluster
     ]
}
