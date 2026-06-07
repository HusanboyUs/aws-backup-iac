variable "backup_file_name" {
  description = "Contains wesbite related config names"
  default = "myweb-db-backup"
  type = string
  nullable = false
  sensitive = false

  validation {
    condition = length(var.backup_file_name) > 5
    error_message = "Bucket name should be more than 5 characters"
  }
}

variable "do_token" {}
variable "website_domain" {}
