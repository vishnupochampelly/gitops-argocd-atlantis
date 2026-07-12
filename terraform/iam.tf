resource "google_project_iam_member" "gke_artifact_registry_reader" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"

  member = "serviceAccount:${data.google_project.current.number}-compute@developer.gserviceaccount.com"
}