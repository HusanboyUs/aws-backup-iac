run "aws_s3_bucket_name" {
    command = plan

    assert {
      condition = aws_s3_bucket.tf-backup-bucket.bucket == "myweb-db-backup"
      error_message = "S3 bucket name should be as declared in var file, I dont want to change"
    }
}

run "aws_s3_bucket_has_correct_region" {
  command = plan

  assert {
    condition = aws_s3_bucket.tf-backup-bucket.region == "eu-west-1"
    error_message = "S3 bucket should be in correct region!"
  }
}
