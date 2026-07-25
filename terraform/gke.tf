##########################################################
# GKE Cluster
##########################################################

resource "google_container_cluster" "primary" {

  name     = "gitops-cluster"

  location = var.zone
  
  network    = google_compute_network.vpc.id
  subnetwork = google_compute_subnetwork.gke_subnet.id

  deletion_protection = false

  ##########################################################
  # Remove Default Node Pool
  ##########################################################

  remove_default_node_pool = true

  initial_node_count = 1

  ##########################################################
  # GKE IP Allocation
  ##########################################################

  ip_allocation_policy {

    cluster_secondary_range_name  = "pods"

    services_secondary_range_name = "services"

  }

  ##########################################################
  # Release Channel
  ##########################################################

  release_channel {

    channel = "REGULAR"

  }

  ##########################################################
  # Workload Identity
  ##########################################################

  workload_identity_config {

    workload_pool = "${var.project_id}.svc.id.goog"

  }

  depends_on = [
  google_project_service.container_api
]

}