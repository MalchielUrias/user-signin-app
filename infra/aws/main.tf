module "s3" {
  source = "./modules/s3"
}

module "dynamodb" {
  source = "./modules/dynamodb"
}

module "iam" {
  source = "./modules/iam"
}

module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source = "./modules/eks"

  cluster_role_arn = module.iam.k8-iam-role-arn
  worker_role_arn = module.iam.k8-worker-iam-role-arn
  subnet_ids = module.vpc.private_sub_id[*]
} 