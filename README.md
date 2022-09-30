# Modernisation Platform Terraform S3 Bucket Replication Role Module

[![repo standards badge](https://img.shields.io/badge/dynamic/json?color=blue&style=for-the-badge&logo=github&label=MoJ%20Compliant&query=%24.result&url=https%3A%2F%2Foperations-engineering-reports.cloud-platform.service.justice.gov.uk%2Fapi%2Fv1%2Fcompliant_public_repositories%2Fmodernisation-platform-terraform-s3-bucket-replication-role)](https://operations-engineering-reports.cloud-platform.service.justice.gov.uk/public-github-repositories.html#modernisation-platform-terraform-s3-bucket-replication-role "Link to report")

A Terraform module to create an IAM role for S3 bucket replication.

## Usage

```
module "s3-replication-role" {
  source             = "modernisation-platform-terraform-s3-bucket-replication-role"
  buckets            = [module.s3-bucket.bucket.arn]
  replication_bucket = "bucket-name"
  tags               = local.tags
}
```

## Inputs
| Name               | Description                                  | Type   | Default | Required |
|--------------------|----------------------------------------------|--------|---------|----------|
| buckets            | A list of bucket ARNs to allow access to     | list   |         | yes      |
| replication_bucket | Name of bucket to be replicated to           | string | ""      | no       |
|                    | (Used to explicitly target bucket in policy) |        |         |          |
| suffix_name        | Suffix for role and policy names             | string | ""      | no       |
| tags               | Tags to apply to resources, where applicable | map    |         | yes      |

## Outputs
See the [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role#attributes-reference) attributes reference. This module outputs the resource map, i.e. `aws_iam_role`, so you can access each attribute from Terraform directly under the `role` output, e.g. `module.s3-replication-role.role.arn` for the role ARN.

## Looking for issues?
If you're looking to raise an issue with this module, please create a new issue in the [Modernisation Platform repository](https://github.com/ministryofjustice/modernisation-platform/issues).
