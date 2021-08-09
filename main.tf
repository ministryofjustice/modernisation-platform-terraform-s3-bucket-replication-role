locals {
  buckets            = flatten(var.buckets)
  replication_bucket = "arn:aws:s3:::${var.replication_bucket}/*"
}

# S3 bucket replication: role
resource "aws_iam_role" "default" {
  name               = "AWSS3BucketReplication${var.suffix_name}"
  assume_role_policy = data.aws_iam_policy_document.s3-assume-role-policy.json
  tags               = var.tags
}

# S3 bucket replication: assume role policy
data "aws_iam_policy_document" "s3-assume-role-policy" {
  version = "2012-10-17"
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "default" {
  name   = "AWSS3BucketReplicationPolicy${var.suffix_name}"
  policy = data.aws_iam_policy_document.default-policy.json
}

# S3 bucket replication: role policy
data "aws_iam_policy_document" "default-policy" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "s3:GetReplicationConfiguration",
      "s3:ListBucket"

    ]
    resources = local.buckets
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetObjectVersion",
      "s3:GetObjectVersionAcl",
      "s3:GetObjectVersionForReplication",
      "s3:GetObjectLegalHold",
      "s3:GetObjectRetention",
      "s3:GetObjectVersionTagging"
    ]
    resources = [
      for bucket in local.buckets :
      "${bucket}/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:ReplicateObject",
      "s3:ReplicateDelete",
      "s3:ReplicateTags",
      "s3:GetObjectVersionTagging",
      "s3:ObjectOwnerOverrideToBucketOwner"
    ]

    resources = ["${var.replication_bucket != "" ? local.replication_bucket : "*"}"]

    condition {
      test     = "StringLikeIfExists"
      variable = "s3:x-amz-server-side-encryption"
      values = [
        "aws:kms",
        "AES256"
      ]
    }
  }
}

resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.default.name
  policy_arn = aws_iam_policy.default.arn
}
