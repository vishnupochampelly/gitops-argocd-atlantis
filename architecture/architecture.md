# GitOps Platform Architecture

```text
                    +---------------------+
                    |     Developer       |
                    +----------+----------+
                               |
                          git push
                               |
                               ▼
                   +----------------------+
                   |   GitHub Repository  |
                   +----------+-----------+
                              |
                              ▼
                   +----------------------+
                   | GitHub Actions (CI)  |
                   +----------+-----------+
                              |
              +---------------+----------------+
              |                                |
              ▼                                ▼
     Build Docker Image             Update Helm values
              |                                |
              ▼                                |
      Google Artifact Registry                 |
              |                                |
              +---------------+----------------+
                              |
                              ▼
                      GitHub Repository
                              |
                              ▼
                      Argo CD (GitOps)
                              |
                              ▼
                 Google Kubernetes Engine
                              |
            +-----------------+----------------+
            |                                  |
            ▼                                  ▼
     Kubernetes Service                 Prometheus
            |                                  |
            ▼                                  ▼
      LoadBalancer                        Grafana
            |
            ▼
       End Users
```