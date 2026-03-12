# Cost-Saving Recommendations

- Use small or spot EC2 instances for EKS node groups (configure in Terraform)
- Set low default replica counts in Helm chart (e.g., replicaCount: 1 for dev/test)
- Use ClusterIP services by default; only use LoadBalancer when necessary
- Disable or scale down monitoring components (Prometheus, Grafana) when not needed
- Use Terraform variables for scaling and instance types for easy adjustment
- Clean up unused ECR repositories and images regularly

# Teardown Process

To destroy all AWS infrastructure (EKS, VPC, ECR, etc.):
1. `cd terraform`
2. `terraform destroy` (review the plan before confirming)

To remove Kubernetes resources deployed with Helm:
1. `helm uninstall <release-name>` for each Helm release

For manually applied manifests:
1. `kubectl delete -f <manifest.yaml>`

**Reminders:**
- Double-check for persistent volumes, S3 buckets, or other resources that may not be deleted automatically
- Clean up backend state (S3, DynamoDB) if no longer needed
# Production-Ready EKS Platform Scaffold

## What’s included
- Terraform for VPC, EKS, node groups, IRSA, ECR, backend
- Kubernetes manifests (Deployment, Service, ServiceAccount, ConfigMap)
- Helm chart scaffolding and templates
- Ingress with ALB annotations (verify in AWS docs)
- cert-manager Issuer/ClusterIssuer YAML
- kube-prometheus-stack values and ServiceMonitor
- GitHub Actions pipeline: build → scan → push → deploy

## What you must decide/configure
- VPC/subnet CIDRs, node types, namespaces, ingress design
- IAM policies, pod security, TLS, secrets
- AWS/Kubernetes annotation correctness (check docs)
- Manual testing: terraform plan, kubectl logs, helm dry-run
- Tradeoffs: IRSA vs node roles, Helm vs Kustomize, etc.

## Reminders
- Review all TODOs and placeholders
- Validate security and compliance for your org
- Test in a non-prod environment first
- Keep code modular and idiomatic
