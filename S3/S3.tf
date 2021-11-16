 resource "aws_s3_bucket" "bucket" {
  bucket = "honestrusty"
  acl    = "private"

  lifecycle_rule {
    id      = "lifecycle"
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA" # or "ONEZONE_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }
} 