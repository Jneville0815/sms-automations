resource "aws_s3_bucket" "zip_files" {
  bucket = "zip-files-${local.global.repository_name}"
  tags   = local.global.tags
}

resource "aws_s3_bucket_acl" "zip_files" {
  bucket = aws_s3_bucket.zip_files.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "zip_files" {
  bucket = aws_s3_bucket.zip_files.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "zip_files" {
  bucket = aws_s3_bucket.zip_files.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}