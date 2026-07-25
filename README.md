# 🚀 GitOps Platform on Google Cloud

A production-inspired cloud-native platform built on **Google Cloud Platform (GCP)** using **Terraform**, **Google Kubernetes Engine (GKE)**, **GitHub Actions**, **Argo CD**, **Helm**, **Prometheus**, **Grafana**, and **Atlantis**.

This project demonstrates how modern Platform Engineering and GitOps practices can be implemented using industry-standard DevOps tools.

---

# 📌 Project Overview

This repository automates the complete software delivery lifecycle:

- Infrastructure Provisioning
- Container Image Build
- Continuous Integration
- Artifact Management
- GitOps-based Continuous Deployment
- Kubernetes Orchestration
- Infrastructure Monitoring

The entire deployment pipeline follows GitOps principles where **Git is the single source of truth**.

---

# 🛠 Tech Stack

| Category | Technology |
|-----------|------------|
| Cloud | Google Cloud Platform |
| IaC | Terraform |
| Container Platform | Google Kubernetes Engine (GKE) |
| Container Registry | Google Artifact Registry |
| Containerization | Docker |
| Orchestration | Kubernetes |
| Package Management | Helm |
| GitOps | Argo CD |
| CI | GitHub Actions |
| Authentication | Workload Identity Federation (OIDC) |
| Monitoring | Prometheus |
| Visualization | Grafana |
| Terraform Automation | Atlantis |

---

# 🏗 Architecture

```

                    Developer
                        │
                  git push
                        │
                        ▼
                GitHub Repository
                        │
                        ▼
                GitHub Actions (CI)
                        │
         ┌──────────────┴──────────────┐
         │                             │
         ▼                             ▼
 Build Docker Image            Update Helm values.yaml
         │                             │
         ▼                             ▼
 Google Artifact Registry        Commit Image Tag
         │                             │
         └──────────────┬──────────────┘
                        │
                        ▼
                  Argo CD (GitOps)
                        │
                        ▼
                Google Kubernetes Engine
                        │
          ┌─────────────┴─────────────┐
          ▼                           ▼
     Kubernetes Service         Prometheus
          │                           │
          ▼                           ▼
     LoadBalancer                 Grafana
          │
          ▼
    End Users / Browser

```

---

# 📂 Repository Structure

```
gitops-argocd-atlantis/
│
├── .github/
│   └── workflows/
│       └── build-and-deploy.yml
│
├── app/
│   ├── Dockerfile
│   └── index.html
│
├── terraform/
│
├── helm-charts/
│   └── gitops-demo/
│
├── argocd/
│
├── monitoring/
│
├── docs/
│
├── architecture/
│
└── README.md
```

---

# ⚙ Infrastructure Provisioned

Terraform provisions the following resources:

- Custom VPC
- Custom Subnet
- Secondary IP Ranges
- Google Kubernetes Engine
- Node Pool
- Artifact Registry
- IAM Roles
- Required Google APIs

---

# 🚀 CI/CD Workflow

```
Developer
      │
git push
      │
      ▼
GitHub Actions
      │
      ├── Authenticate using OIDC
      ├── Build Docker Image
      ├── Push Image to Artifact Registry
      ├── Update Helm values.yaml
      ├── Commit Image Tag
      ▼
GitHub Repository
      ▼
Argo CD
      ▼
Google Kubernetes Engine
      ▼
Application Deployment
```

---

# 📊 Monitoring Stack

The platform includes:

- Prometheus
- Grafana
- Alertmanager
- Node Exporter
- kube-state-metrics

Grafana provides dashboards for:

- Cluster Health
- CPU Usage
- Memory Usage
- Pod Monitoring
- Node Monitoring
- Kubernetes Resources

---

# ✅ Features

- Infrastructure as Code (Terraform)
- GitOps Deployment using Argo CD
- Continuous Integration with GitHub Actions
- Secure Authentication using Workload Identity Federation (OIDC)
- Docker Image Build & Push
- Automated Helm Image Updates
- Kubernetes Deployment
- LoadBalancer Service
- Prometheus Monitoring
- Grafana Dashboards

---

# 📈 Current Project Status

| Component | Status |
|------------|--------|
| Terraform | ✅ |
| GKE | ✅ |
| Artifact Registry | ✅ |
| Docker | ✅ |
| Kubernetes | ✅ |
| Helm | ✅ |
| Argo CD | ✅ |
| GitHub Actions | ✅ |
| GitOps Deployment | ✅ |
| Prometheus | ✅ |
| Grafana | ✅ |
| Atlantis | 🚧 |

---

# 📚 Learning Outcomes

This project demonstrates practical experience with:

- Infrastructure as Code
- Kubernetes Administration
- GitOps
- Continuous Integration
- Continuous Deployment
- Cloud Networking
- Platform Engineering
- Observability
- Monitoring
- Kubernetes Troubleshooting

---

# 🚀 Future Enhancements

- Horizontal Pod Autoscaler (HPA)
- Ingress Controller
- HTTPS with Managed Certificates
- External Secrets Operator
- GCP Secret Manager Integration
- Argo Rollouts (Blue-Green / Canary)
- Multi-Environment Deployment (Dev / Stage / Prod)

---

# 👨‍💻 Author

**Vishnu Pochampalli**

Cloud | DevOps | Platform Engineer | Site Reliability Engineer (SRE)










![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?logo=terraform)

![GCP](https://img.shields.io/badge/Google_Cloud-GCP-4285F4?logo=googlecloud)

![Kubernetes](https://img.shields.io/badge/Kubernetes-GKE-326CE5?logo=kubernetes)

![Docker](https://img.shields.io/badge/Docker-Containers-2496ED?logo=docker)

![Helm](https://img.shields.io/badge/Helm-Charts-0F1689?logo=helm)

![ArgoCD](https://img.shields.io/badge/ArgoCD-GitOps-EF7B4D)

![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-CI/CD-2088FF?logo=githubactions)

![Prometheus](https://img.shields.io/badge/Prometheus-Monitoring-E6522C?logo=prometheus)

![Grafana](https://img.shields.io/badge/Grafana-Dashboard-F46800?logo=grafana)