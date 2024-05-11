
# Bucket 
resource "aws_s3_bucket" "Application_log_file" {
  bucket = "${var.environment}-${var.name_prefix}${var.bucket_name}"

  tags = {
    Name        = "${var.environment}-s3-bucket"
    Environment = var.environment
  }
}
#versioning

resource "aws_s3_bucket_versioning" "S3_versioning" {
  bucket = aws_s3_bucket.Application_log_file.id
  versioning_configuration {
    status = "Enabled"
  }
}
# Public Access blocker
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = "${var.environment}-${var.name_prefix}${var.bucket_name}"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# server side encryption
resource "aws_kms_key" "kms_key_s3" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}
resource "aws_s3_bucket_server_side_encryption_configuration" "served_side_encryp_s3" {
  bucket = "${var.environment}-${var.name_prefix}${var.bucket_name}"

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key
      sse_algorithm     = var.sse
    }
  }
  
}