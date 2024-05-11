variable "region" {
  type = string
  default = "us-east-1"
}
variable "environment" {
  type = string
  default = "dev"
}
variable "name_prefix" {
  type = string
  default = "amazon"
}
variable "bucket_name" {
  type = string
  default = "-s3-bucket"
}
variable "kms_key" {
    type = string
    default = "aws_kms_key.kms_key_s3.arn"
}
variable "sse" {
    type = string
    default = "aws:kms"
}