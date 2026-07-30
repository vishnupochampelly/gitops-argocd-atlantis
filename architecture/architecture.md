                    GitHub
                       │
             GitHub Actions (OIDC)
                       │
                       ▼
              Artifact Registry
                       │
                       ▼
                   Argo CD
                 (App of Apps)
                       │
      ┌────────────────┼────────────────┐
      ▼                ▼                ▼
 GitOps Demo      Monitoring     NGINX Ingress
      │                │                │
      └────────────────┴────────────────┘
                       │
                       ▼
                 Google GKE Cluster
                       │
                       ▼
             Google Cloud Load Balancer
                       │
                       ▼
                    Internet