variable "region" {
  description = "The preferred region for deploying of cloud resources."
  default     = "europe-west2"
}

variable "project-id" {
  description = "The project id of the GCP project."
  default     = "hidden-solstice-402121"
}

variable "gcp_svc_key" {
  description = "Path to the service account credentials used by the Terraform host project."
  default     = "~/.config/gcloud/hidden-solstice-402121-44564fd3a51e.json"
}