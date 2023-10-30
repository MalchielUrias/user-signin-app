resource "aws_s3_bucket" "tfstate_bucket_malchiel" {

    bucket = var.bucket_name
    
  
}

resource "aws_s3_bucket_versioning" "tfbucket_versioning" {
  bucket = aws_s3_bucket.tfstate_bucket_malchiel.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_kms_key" "tfbucket_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tfbucket_encryption" {
  bucket = aws_s3_bucket.tfstate_bucket_malchiel.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.tfbucket_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}