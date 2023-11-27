# resource "random_string" "suffix" {
#   length  = 8
#   special = false
#   lower   = true
#   upper   = false
# }
# resource "google_storage_bucket" "name" {
#   location = var.location
#   name     = random_string.suffix.result
# }