# Terraform EKS Platform Scaffolding

## What’s included
- VPC, EKS, node groups, IRSA, ECR modules
- Remote backend (S3 + DynamoDB) config
- Outputs for cluster connection

## What you must decide/configure
- VPC CIDRs, subnets, and tags
- EKS node group types, scaling, and labels
- IRSA IAM policies (least privilege!)
- Backend S3 bucket, region, DynamoDB table
- Security best practices (encryption, access controls)

## Usage
1. Review and edit all TODOs and placeholders
2. Initialize: `terraform init`
3. Plan: `terraform plan`
4. Apply: `terraform apply`

**Reminder:**
- Validate all IAM and AWS resource settings for your org’s security/compliance
- Check AWS and Kubernetes docs for latest annotation and config best practices
- Test everything in a non-prod environment first!
