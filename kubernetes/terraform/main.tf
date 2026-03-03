provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_cluster" "demo" {
  name     = "demo-eks-cluster"
  role_arn = "<your-eks-role-arn>"
  vpc_config {
    subnet_ids = ["<your-subnet-id>"]
  }
}

# Add node group, networking, and outputs as needed
