terraform {
  required_version = ">= 0.14"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.1.0"
    }
  }
}

provider "google" {
  # Configuration options
  project     = var.project-id
  region      = var.region
  credentials = file(var.gcp_svc_key)
}