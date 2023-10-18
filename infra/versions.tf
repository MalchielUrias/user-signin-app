terraform {
  required_version = ">= 0.14"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.1.0"
    }
  }

  backend "gcs" {
    prefix  = "tfstate/"
    bucket  = "tfstate_bucket"
    credentials = "~/.config/gcloud/hidden-solstice-402121-44564fd3a51e.json"
  }
}

provider "google" {
  # Configuration options
  project     = var.project-id
  region      = var.region
  credentials = file(var.gcp_svc_key)
}