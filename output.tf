output "bucket" {
  value = google_storage_bucket.name.name
}
output "bucketUrl" {
  value = google_storage_bucket.name.url
}