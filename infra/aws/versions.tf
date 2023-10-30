terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "tfstate-bucket-malchiel"
    key = "global/s3/terraform.tfstate"
    dynamodb_table = "TerraformState"
    region = "eu-west-1"
    encrypt = false
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}