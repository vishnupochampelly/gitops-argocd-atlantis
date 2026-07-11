# GitOps Platform on Google Cloud

A production-inspired GitOps platform built on Google Cloud Platform using Terraform, Kubernetes, Docker, Helm, ArgoCD, GitHub Actions, and Atlantis.

---

# Project Goals

This project demonstrates how to build a complete cloud-native platform from scratch using Infrastructure as Code and GitOps principles.

The objective is to automate infrastructure provisioning, application deployment, and continuous delivery using industry-standard DevOps tools.

---

# Tech Stack

- Google Cloud Platform (GCP)
- Terraform
- Google Kubernetes Engine (GKE)
- Artifact Registry (GAR)
- Docker
- Kubernetes
- Helm
- ArgoCD
- GitHub Actions
- Atlantis
- Prometheus
- Grafana

---

# Architecture

```
GitHub
   │
   ▼
GitHub Actions
   │
   ▼
Docker Build
   │
   ▼
Artifact Registry
   │
   ▼
Google Kubernetes Engine
   │
   ▼
Application
```

Infrastructure is provisioned using Terraform.

Applications are deployed using Kubernetes, Helm, and ArgoCD.

---

# Repository Structure

```
gitops-argocd-atlantis/
│
├── app/                # Sample Docker application
│
├── terraform/          # Infrastructure as Code
│
├── argocd/             # ArgoCD manifests
│
├── helm-charts/        # Helm Charts
│
├── monitoring/         # Prometheus & Grafana
│
├── architecture/       # Architecture diagrams
│
├── docs/               # Documentation
│
└── README.md
```

---

# Infrastructure Created

- VPC Network
- Custom Subnet
- Secondary IP Ranges
- Google Kubernetes Engine
- Node Pool
- Artifact Registry
- Required Google APIs

---

# Current Progress

- [x] Git Repository
- [x] Terraform Setup
- [x] Google Provider
- [x] Variables
- [x] VPC
- [x] Subnet
- [x] GKE Cluster
- [x] Node Pool
- [x] Artifact Registry
- [x] Docker Image
- [x] Push Image to GAR

Upcoming

- [ ] Kubernetes Deployment
- [ ] Kubernetes Service
- [ ] Helm Charts
- [ ] ArgoCD
- [ ] GitHub Actions
- [ ] Atlantis
- [ ] Prometheus
- [ ] Grafana

---

# Learning Objectives

This repository is designed to understand:

- Infrastructure as Code
- Docker Containerization
- Kubernetes
- GitOps
- Continuous Delivery
- Cloud Networking
- Platform Engineering

---

# Author

Vishnu Pochampelly
