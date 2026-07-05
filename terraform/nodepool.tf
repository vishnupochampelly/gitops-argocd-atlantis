##########################################################
# GKE Node Pool
##########################################################

resource "google_container_node_pool" "primary_nodes" {

  name = "primary-node-pool"

  location = var.zone

  cluster = google_container_cluster.primary.name

  node_count = 1

  node_config {

    machine_type = "e2-medium"

    disk_size_gb = 50

    disk_type = "pd-balanced"

    image_type = "COS_CONTAINERD"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      environment = "lab"
    }

    tags = ["gke-node"]

  }

  management {

    auto_repair = true

    auto_upgrade = true

  }

}