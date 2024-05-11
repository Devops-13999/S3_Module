output "aws_kms_key" {
  value = var.kms_key
}
output "bucket_name" {
  value = "${var.environment}-${var.name_prefix}${var.bucket_name}"
}
output "bucket" {
  value = aws_s3_bucket.Application_log_file.id
}