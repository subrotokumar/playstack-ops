data "aws_iam_policy_document" "cf_policy" {
  statement {
    sid    = "AllowCloudFrontRead"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = ["s3:GetObject"]

    resources = [
      "${var.bucket.arn}/*"
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.streaming.arn]
    }
  }
}

resource "aws_s3_bucket_policy" "policy" {
  bucket = var.bucket.id
  policy = data.aws_iam_policy_document.cf_policy.json
}
