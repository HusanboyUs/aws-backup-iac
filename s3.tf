resource "aws_s3_bucket" "tf-backup-bucket" {
    bucket = var.backup_file_name
    tags = {
        Name = "backup_bucket"
        Environment = local.environment
        ManagedBy = "Terraform"
    }
}


output "aws_s3_bucket_name" {
  description = "Name of the s3 bucket created in AWS"
  value = aws_s3_bucket.tf-backup-bucket.bucket
}