##########################################################
# Custom VPC Network
##########################################################

resource "google_compute_network" "vpc" {
  name                    = "vpc-gitops-lab"
  auto_create_subnetworks = false
}

##########################################################
# GKE Subnet
##########################################################

resource "google_compute_subnetwork" "gke_subnet" {
  name          = "gke-subnet"
  ip_cidr_range = "10.10.0.0/24"

  region = var.region

  network = google_compute_network.vpc.id

  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "pods"
    ip_cidr_range = "10.20.0.0/16"
  }

  secondary_ip_range {
    range_name    = "services"
    ip_cidr_range = "10.30.0.0/20"
  }
}