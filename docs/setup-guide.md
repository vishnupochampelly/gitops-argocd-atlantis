# Setup Guide

This guide explains how to deploy the complete GitOps Platform from scratch.

---

# Prerequisites

Install the following tools:

- Google Cloud SDK
- Terraform
- Docker Desktop
- kubectl
- Helm
- Git
- GitHub CLI (Optional)

---

# Clone Repository

```bash
git clone https://github.com/vishnupochampelly/gitops-argocd-atlantis.git

cd gitops-argocd-atlantis
```

---

# Configure Google Cloud

Login

```bash
gcloud auth login
```

Set Project

```bash
gcloud config set project vishnu-cloud-lab
```

---

# Deploy Infrastructure

Navigate to Terraform

```bash
cd terraform
```

Initialize

```bash
terraform init
```

Plan

```bash
terraform plan
```

Apply

```bash
terraform apply
```

Terraform provisions:

- VPC
- Subnet
- Secondary IP ranges
- GKE Cluster
- Node Pool
- Artifact Registry
- IAM
- APIs

---

# Connect to GKE

```bash
gcloud container clusters get-credentials gitops-cluster \
--zone asia-south1-a
```

Verify

```bash
kubectl get nodes
```

---

# Build Docker Image

```bash
docker build -t gitops-demo:v1 ./app
```

---

# Push Image

```bash
docker tag gitops-demo:v1 asia-south1-docker.pkg.dev/vishnu-cloud-lab/gitops-images/gitops-demo:v1

docker push asia-south1-docker.pkg.dev/vishnu-cloud-lab/gitops-images/gitops-demo:v1
```

---

# Deploy Argo CD

```bash
kubectl create namespace argocd

kubectl apply -n argocd \
-f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

---

# Deploy Application

```bash
kubectl apply -f argocd/app-of-apps.yaml
```

This applies the root Argo CD app, which then discovers and syncs the manifests under the apps directory, including apps/gitops-demo.yaml.

---

# Install Monitoring

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm install prometheus prometheus-community/kube-prometheus-stack \
--namespace monitoring \
--create-namespace
```

---

# Verify

```bash
kubectl get pods
kubectl get svc
kubectl get ingress
```

Application should now be accessible.