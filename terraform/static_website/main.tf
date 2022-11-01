variable "bucket" {
  type = string
}

variable "domain_zoneid" {
  type = string
}

data "aws_iam_policy_document" "public" {
  statement {
    actions   = [ "s3:GetObject" ]
    resources = [ "${aws_s3_bucket.demo_bucket.arn}/*" ]
    principals {
      type        = "*"
      identifiers = [ "*" ]
    }
  }
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = var.bucket
  force_destroy = true
}

resource "aws_s3_bucket_policy" "attach_policy" {
  bucket = aws_s3_bucket.demo_bucket.id
  policy = data.aws_iam_policy_document.public.json
}

resource "aws_s3_bucket_website_configuration" "site_config" {
  bucket = aws_s3_bucket.demo_bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_route53_record" "domain" {
  zone_id = var.domain_zoneid
  name    = aws_s3_bucket.demo_bucket.id
  type    = "CNAME"
  ttl     = 5
  records = [aws_s3_bucket.demo_bucket.bucket_domain_name]
}