data "google_service_account" "terraform-access-sa" {
  account_id = "terraform-access-sa"
}

resource "google_storage_bucket" "tfstate_bucket" {
    name = var.bucket_name
    location = "EU"
    
    storage_class = "STANDARD"
}

resource "google_storage_bucket_iam_member" "tfstate_member" {
  bucket = google_storage_bucket.tfstate_bucket.name
  role = "roles/storage.admin"
  member = data.google_service_account.terraform-access-sa.member
}