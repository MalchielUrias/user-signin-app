module "vpc" {
  source = "./modules/vpc"
}

module "gcs" {
  source = "./modules/gcs"
}

module "gcs" {
  source = "./modules/gke"
}