# Troubleshooting Guide

This document contains common issues encountered while building the GitOps Platform Engineering project and the steps used to diagnose and resolve them.

---

# Table of Contents

- Prometheus CRD Annotation Limit
- Argo CD ApplicationSet Controller CrashLoopBackOff
- kubectl Port Forward Lost Connection
- Git Push Rejected (non-fast-forward)
- Terraform GKE Regional vs Zonal Cluster
- Useful Debugging Commands

---

# 1. Prometheus CRD Annotation Limit

## Problem

While installing kube-prometheus-stack:

```bash
helm install prometheus prometheus-community/kube-prometheus-stack
```

Installation failed with:

```
metadata.annotations: Too long: may not be more than 262144 bytes
```

## Cause

`kubectl apply` stores the entire manifest inside the annotation:

```
kubectl.kubernetes.io/last-applied-configuration
```

Some CRDs (especially Prometheus Operator CRDs) exceed Kubernetes' maximum annotation size.

## Diagnosis

```
kubectl get crd
```

Prometheus CRDs were missing.

## Solution

Install the CRDs separately using Server-Side Apply.

Example:

```bash
kubectl apply --server-side -f crds/
```

or

```bash
kubectl apply --server-side -f <CRD_URL>
```

After CRDs were installed, reinstall Helm chart.

## Lesson Learned

Large CRDs should be installed using Server-Side Apply instead of standard client-side apply.

---

# 2. Argo CD ApplicationSet Controller CrashLoopBackOff

## Problem

```
argocd-applicationset-controller
CrashLoopBackOff
```

Logs:

```
failed to get restmapping:
no matches for kind "ApplicationSet"
```

## Diagnosis

Verify ApplicationSet CRD.

```bash
kubectl get crd | grep applicationset
```

Output:

```
(no output)
```

Also:

```bash
kubectl api-resources | grep ApplicationSet
```

Output:

```
(no output)
```

This confirmed the CRD was missing.

## Root Cause

Installing Argo CD using:

```bash
kubectl apply -f install.yaml
```

failed with:

```
metadata.annotations:
Too long
```

The ApplicationSet CRD was never created.

## Solution

Install Argo CD using Server-Side Apply.

```bash
kubectl apply --server-side \
-f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Verify:

```bash
kubectl api-resources | grep ApplicationSet
```

Expected:

```
applicationsets
```

Restart controller.

```bash
kubectl rollout restart deployment argocd-applicationset-controller \
-n argocd
```

Verify:

```bash
kubectl get pods -n argocd
```

Expected:

```
1/1 Running
```

## Lesson Learned

Large CRDs should always be installed using Server-Side Apply.

---

# 3. kubectl Port Forward Lost Connection

## Problem

```
kubectl port-forward svc/prometheus-grafana
```

returned

```
error: lost connection to pod
```

## Diagnosis

Verify cluster connectivity.

```bash
kubectl cluster-info
```

Verify pod status.

```bash
kubectl get pods -A
```

Verify logs.

```bash
kubectl logs POD_NAME
```

In this project the issue occurred while the ApplicationSet controller was repeatedly crashing because the required CRD was missing.

Once the CRD was restored and the controller became healthy, the cluster returned to a stable state.

## Useful Commands

```bash
kubectl describe pod POD_NAME
```

```bash
kubectl logs POD_NAME
```

```bash
kubectl get events -A
```

---

# 4. Git Push Rejected

## Problem

```
! [rejected]
```

```
non-fast-forward
```

## Solution

```
git pull --rebase origin main
```

Resolve conflicts if required.

Then

```
git push origin main
```

---

# 5. Terraform GKE Regional vs Zonal Cluster

## Problem

Terraform created three nodes instead of one.

## Cause

The cluster was configured as a Regional GKE cluster.

Regional clusters create one node in each zone.

## Solution

Use a zonal cluster.

Example:

```hcl
location = "asia-south1-a"
```

instead of

```hcl
location = "asia-south1"
```

This creates a single-zone cluster.

---

# Useful Debugging Commands

## Cluster

```bash
kubectl cluster-info
```

```bash
kubectl get nodes
```

```bash
kubectl get events -A
```

---

## Pods

```bash
kubectl get pods -A
```

```bash
kubectl describe pod POD_NAME
```

```bash
kubectl logs POD_NAME
```

```bash
kubectl logs POD_NAME --previous
```

---

## Deployments

```bash
kubectl rollout restart deployment DEPLOYMENT_NAME
```

```bash
kubectl rollout status deployment DEPLOYMENT_NAME
```

---

## Services

```bash
kubectl get svc -A
```

```bash
kubectl port-forward svc/SERVICE_NAME LOCAL_PORT:TARGET_PORT
```

---

## CRDs

```bash
kubectl get crd
```

```bash
kubectl api-resources
```

---

# Key Takeaways

- Prefer Server-Side Apply for large CRDs.
- Always verify CRDs before troubleshooting controllers.
- Read logs before making configuration changes.
- Validate Kubernetes resources incrementally after each deployment.
- Use `kubectl describe` and `kubectl logs` as the primary debugging tools.