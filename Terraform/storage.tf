resource "aws_s3_bucket" "buckets" {
  count  = length(var.bucket-names)
  bucket = "${var.project-name}-${var.bucket-names[count.index]}-${var.environment}-${var.account_id}"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_sse" {
  count = length(var.bucket-names)
  bucket = "${var.project-name}-${var.bucket-names[count.index]}-${var.environment}-${var.account_id}"

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Rules to block public access
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  count  = length(var.bucket-names)
  bucket = "${var.project-name}-${var.bucket-names[count.index]}-${var.environment}-${var.account_id}"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}