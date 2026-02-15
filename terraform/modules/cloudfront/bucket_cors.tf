resource "aws_s3_bucket_cors_configuration" "cors" {
  bucket = var.bucket.id

  cors_rule {
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["*"]
    allowed_headers = ["*"]
  }
}