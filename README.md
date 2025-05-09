# DevSecOps Pipeline Demo

This is a complete example of a DevSecOps pipeline that:
- Deploys a simple Python Flask web app
- Uses GitHub Actions for CI/CD
- Integrates Snyk for vulnerability scanning
- Builds and pushes a Docker image
- Deploys to Kubernetes (Minikube or managed)

---

## 🛠️ Project Structure

.
├── app.py # Simple Flask web app
├── requirements.txt # Python dependencies
├── Dockerfile # Containerization
├── .github/
│ └── workflows/
│ └── pipeline.yml # GitHub Actions CI/CD
└── k8s/
└── deployment.yaml # Kubernetes deployment
---

## 🚀 Quick Start

### 1. Build and Run Locally

```bash
docker build -t devsecops-demo .
docker run -p 5000:5000 devsecops-demo

Push to GitHub

    Create a GitHub repo

    Push this code to it:

git init
git remote add origin https://github.com/your-username/your-repo.git
git add .
git commit -m "Initial commit"
git push -u origin main

dd GitHub Secrets

In your repo:

    Go to Settings → Secrets and variables → Actions

    Click "New repository secret" and add the following:

Name	Description
DOCKER_USERNAME	Your Docker Hub username
DOCKER_PASSWORD	Your Docker Hub password or token
SNYK_TOKEN	Snyk API token from https://snyk.io

Let CI/CD Pipeline Run

When you push to the main branch:

    GitHub Actions will:

        Build the Docker image

        Run a Snyk security scan

        Push the image to Docker Hub

Check your Actions tab for status.

Deploy to Kubernetes

For local testing using Minikube:

minikube start
kubectl apply -f k8s/deployment.yaml
kubectl expose deployment devsecops-demo --type=NodePort --port=80 --target-port=5000
minikube service devsecops-demo

Replace image paths if deploying to GKE, EKS, or another cloud platform.


DevSecOps Features

    CI/CD: GitHub Actions

    Security Scanning: Snyk (SAST + container scan)

    Containerization: Docker

    Orchestration: Kubernetes