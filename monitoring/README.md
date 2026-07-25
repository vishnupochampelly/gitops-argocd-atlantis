# Monitoring Stack

This project uses the **kube-prometheus-stack** Helm chart.

## Components

- Prometheus
- Grafana
- Alertmanager
- Node Exporter
- kube-state-metrics

---

# Install

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update

helm install prometheus prometheus-community/kube-prometheus-stack \
--namespace monitoring \
--create-namespace
```

---

# Verify

```bash
kubectl get pods -n monitoring
```

Expected

- Prometheus
- Grafana
- Alertmanager
- Node Exporter
- kube-state-metrics

---

# Access Grafana

```bash
kubectl port-forward svc/prometheus-grafana \
-n monitoring \
3000:80
```

Open

```
http://localhost:3000
```

Username

```
admin
```

Password

```bash
kubectl get secret prometheus-grafana \
-n monitoring \
-o jsonpath="{.data.admin-password}" | base64 -d
```

---

# Default Dashboards

- Kubernetes Cluster
- Kubernetes Nodes
- Kubernetes Pods
- Namespace Resources
- Prometheus Overview
- Node Exporter Full

---

# Metrics Collected

Infrastructure

- CPU Usage
- Memory Usage
- Network Usage
- Disk Usage

Kubernetes

- Pod Status
- Replica Count
- Restarts
- Deployments
- Nodes

Application

- HTTP Requests (if exported)
- Container Metrics