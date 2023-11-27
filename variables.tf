variable "project_id" {
  type        = string
  description = "project id"
  default     = "dd-demo-prj"
}
variable "region" {
  type        = string
  description = "default region"
  default     = "us-west1"
}

variable "location" {
  type        = string
  description = "Bucket location"
  default     = "US"
}