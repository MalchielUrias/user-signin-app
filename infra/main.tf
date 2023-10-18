module "vpc" {
  source = "./modules/vpc"
}

module "gcs" {
  source = "./modules/gcs"
}