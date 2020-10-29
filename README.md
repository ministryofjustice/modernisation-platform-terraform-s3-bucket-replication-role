# modernisation-platform-terraform-s3-bucket-replication-role

A Terraform module to create an IAM role for S3 bucket replication.

## Usage

```
module "s3-replication-role" {
  source  = "modernisation-platform-terraform-s3-bucket-replication-role"
  buckets = [module.s3-bucket.bucket.arn]
  tags    = local.tags
}
```

## Inputs
| Name    | Description                                  | Type | Default | Required |
|---------|----------------------------------------------|------|---------|----------|
| buckets | A list of bucket ARNs to allow access to     | list |         | yes      |
| tags    | Tags to apply to resources, where applicable | map  |         | yes      |

## Outputs
See the [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role#attributes-reference) attributes reference. This module outputs the resource map, i.e. `aws_iam_role`, so you can access each attribute from Terraform directly under the `role` output, e.g. `module.s3-replication-role.role.arn` for the role ARN.

## Looking for issues?
If you're looking to raise an issue with this module, please create a new issue in the [Modernisation Platform repository](https://github.com/ministryofjustice/modernisation-platform/issues).
