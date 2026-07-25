# GitOps Workflow

## Deployment Flow

```text
Developer
     │
git push
     │
     ▼
GitHub Repository
     │
     ▼
GitHub Actions
     │
     ├── Authenticate using OIDC
     ├── Build Docker Image
     ├── Push Image
     ├── Update Helm values.yaml
     └── Commit Image Tag
               │
               ▼
       GitHub Repository
               │
               ▼
            Argo CD
               │
               ▼
            Helm Chart
               │
               ▼
           Kubernetes
               │
               ▼
         Running Application
```

---

## Why GitOps?

Git becomes the single source of truth.

Benefits

- Automated deployment
- Version controlled infrastructure
- Easy rollback
- Drift detection
- Audit trail
- Declarative deployments

---

## Image Versioning

Instead of using

```
latest
```

GitHub Actions tags every image using the Git Commit SHA.

Example

```
gitops-demo:8e6f2a56b4...
```

This guarantees immutable deployments.
