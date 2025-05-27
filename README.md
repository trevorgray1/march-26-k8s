# DevSecOps Demo on AWS EKS

This project demonstrates a complete DevSecOps pipeline for deploying a containerized Python web app to an AWS-managed Kubernetes cluster (EKS), with security scanning, CI/CD, and infrastructure-as-code.

---

## 🚀 Features

- Containerized Python app  
- GitHub Actions CI/CD pipeline  
- Snyk vulnerability scanning  
- Kubernetes manifests for deployment  
- Terraform-managed AWS infrastructure (EKS, VPC)  
- Optional diagrams-as-code support  

---

## 📁 Project Structure

```
dev-demos/
├── app.py               # Flask or FastAPI web app
├── Dockerfile           # Container spec
├── requirements.txt     # Python dependencies
├── k8s/                 # Kubernetes YAMLs (deployment, service)
├── .github/             # GitHub Actions workflow
├── terraform/           # Terraform config for EKS & VPC
│   ├── main.tf
│   ├── variables.tf
│   ├── versions.tf
│   └── outputs.tf
├── README.md
└── .git/
```

---

## 🛠️ Prerequisites

- [AWS CLI v2](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)  
- [eksctl](https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html)  
- [Terraform](https://developer.hashicorp.com/terraform/downloads)  
- [kubectl](https://kubernetes.io/docs/tasks/tools/)  
- Docker  
- GitHub account (for GitHub Actions)  

---

## 🧱 Infrastructure Setup (Terraform)

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

This provisions:
- A new VPC
- An EKS cluster with managed node group
- IAM roles and networking

Once complete, configure `kubectl`:

```bash
aws eks --region us-east-1 update-kubeconfig --name devsecops-demo
kubectl get nodes
```

---

## 🧪 Build, Scan & Deploy (CI/CD)

1. Push changes to GitHub  
2. GitHub Actions workflow:  
   - Builds Docker image  
   - Runs `snyk test` on Docker image  
   - Pushes to Docker Hub (if no criticals)  
   - Applies Kubernetes manifests  

Manual trigger (if needed):

```bash
gh workflow run main.yml --repo your-user/dev-demos
```

---

## 📦 Kubernetes Deployment (Manual Option)

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

---

## 🔐 Security

- Snyk CLI used to scan Docker images before deployment.  
- Fail build on critical vulnerabilities.  

---

## 🧹 Tear Down (Avoid Charges)

```bash
cd terraform
terraform destroy
```

This deletes the EKS cluster, VPC, and related resources.

---

## 📌 TODO

- [ ] Add Ingress & DNS (e.g., AWS ALB)  
- [ ] Add GitHub OIDC authentication to Terraform  
- [ ] Monitor with Prometheus/Grafana  

---

## 📄 License

MIT License
