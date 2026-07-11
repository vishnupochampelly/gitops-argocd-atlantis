##########################################################
# Artifact Registry
##########################################################

resource "google_artifact_registry_repository" "docker_repo" {

  location = var.region

  repository_id = "gitops-images"

  description = "Docker repository for GitOps lab"

  format = "DOCKER"

  depends_on = [
    google_project_service.artifact_registry_api
  ]
}

resource "google_project_iam_member" "gke_artifact_registry_reader" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"

  member = "serviceAccount:${data.google_project.current.number}-compute@developer.gserviceaccount.com"
}