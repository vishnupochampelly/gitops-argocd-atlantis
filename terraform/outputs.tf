##########################################################
# VPC Outputs
##########################################################

output "vpc_name" {
  description = "VPC Name"

  value = google_compute_network.vpc.name
}

##########################################################
# Subnet
##########################################################

output "subnet_name" {
  description = "Subnet Name"

  value = google_compute_subnetwork.gke_subnet.name
}

##########################################################
# GKE Cluster
##########################################################

output "cluster_name" {
  description = "GKE Cluster Name"

  value = google_container_cluster.primary.name
}

output "cluster_location" {
  description = "Cluster Location"

  value = google_container_cluster.primary.location
}

output "cluster_endpoint" {
  description = "Kubernetes API Endpoint"

  value = google_container_cluster.primary.endpoint
}

##########################################################
# Node Pool
##########################################################

output "node_pool_name" {
  description = "Node Pool Name"

  value = google_container_node_pool.primary_nodes.name
}