terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

locals {
  region = "eu-west-1"
  environment = "prod"
}

provider "aws" {
  region = local.region
  profile = "default"
}

resource "aws_s3_bucket" "tf-backup-bucket" {
    bucket = var.backup_file_name
    tags = {
        Name = "backup_bucket"
        Environment = local.environment
        ManagedBy = "Terraform"
    }
}