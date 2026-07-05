# ##########################################################
# # Allow SSH
# ##########################################################

# resource "google_compute_firewall" "allow_ssh" {

#   name = "allow-ssh"

#   network = google_compute_network.vpc.name

#   allow {
#     protocol = "tcp"

#     ports = ["22"]
#   }

#   source_ranges = ["0.0.0.0/0"]

#   target_tags = ["ssh"]
# }