# Troubleshooting Guide

## ImagePullBackOff

Cause

Image not found in Artifact Registry.

Verify

```bash
kubectl describe pod
```

Check image

```bash
kubectl get pod -o wide
```

---

## EndpointSlice has no Ports

Verify Service selector

```bash
kubectl get svc
```

Verify Pod labels

```bash
kubectl get pods --show-labels
```

---

## Pod Pending

Check

```bash
kubectl describe pod
```

Common reason

```
Insufficient CPU
```

Solution

- Reduce replica count
- Increase node pool

---

## Argo CD OutOfSync

Sync manually

```bash
argocd app sync gitops-demo
```

Or

Use the Sync button in the Argo CD UI.

---

## LoadBalancer Pending

Verify

```bash
kubectl get svc
```

Check cloud controller logs.

---

## GitHub Actions Failure

Navigate to

GitHub → Actions

Open the failed workflow.

Review

- Authentication
- Docker Build
- Artifact Registry Push
- Helm Update

---

## Prometheus

Check

```bash
kubectl get pods -n monitoring
```

---

## Grafana

Port Forward

```bash
kubectl port-forward svc/prometheus-grafana \
-n monitoring \
3000:80
```

Password

```bash
kubectl get secret prometheus-grafana \
-n monitoring \
-o jsonpath="{.data.admin-password}" | base64 -d
```