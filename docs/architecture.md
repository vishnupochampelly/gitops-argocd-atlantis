# Platform Architecture

## High-Level Architecture

```text
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
         ┌───────────────┴───────────────┐
         ▼                               ▼
 Build Docker Image              Update Helm Chart
         │                               │
         ▼                               ▼
 Google Artifact Registry         GitHub Repository
                 │
                 ▼
              Argo CD
                 │
                 ▼
       Google Kubernetes Engine
                 │
      ┌──────────┴──────────┐
      ▼                     ▼
 Application           Monitoring
                              │
                     Prometheus
                              │
                              ▼
                          Grafana
```

---

## Infrastructure

Terraform provisions

- VPC
- Subnet
- Secondary IP ranges
- GKE Cluster
- Node Pool
- Artifact Registry
- IAM
- Google APIs

---

## CI/CD

GitHub Actions

- Authenticate using OIDC
- Build Docker Image
- Push to Artifact Registry
- Update Helm Chart
- Commit Image Tag

---

## CD

Argo CD continuously watches Git.

Any change pushed to Git automatically syncs to Kubernetes.

Git is the single source of truth.