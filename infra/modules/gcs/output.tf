output "bucket_name" {
  description = "Name of the tfstate bucket"
  value = google_storage_bucket.tfstate_bucket.name
}