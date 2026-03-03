# AWS Kubernetes Demo App

This project is a cost-effective demo for practicing Kubernetes, CI/CD (GitHub Actions), and Terraform on AWS.

## Features
- Node.js backend (To-Do API)
- React frontend
- Dockerized services
- Kubernetes manifests for EKS
- Terraform for AWS infrastructure
- GitHub Actions for CI/CD

## Cost-Saving Strategies
- All infrastructure managed by Terraform: destroy with `terraform destroy` to avoid costs when not in use
- Use smallest EKS node size and spot instances
- Prefer stateless services (SQLite, S3)
- No long-running managed services (RDS, ElastiCache, etc.)
- Store persistent data in S3 or backup before destroying infra

## Shutdown/Startup Instructions
1. **Shutdown:**
   - Run `terraform destroy` in `/terraform` to remove all AWS resources
   - Backup any data to S3 if needed
2. **Startup:**
   - Run `terraform apply` in `/terraform` to recreate infrastructure
   - Restore data from S3 if needed

## Structure
```
/app/backend      # Node.js API
/app/frontend     # React app
/docker           # Dockerfiles
/k8s              # Kubernetes manifests
/terraform        # Terraform configs
/.github/workflows # GitHub Actions
```

---

See each folder for setup details. Follow the shutdown/startup steps above to minimize AWS costs.