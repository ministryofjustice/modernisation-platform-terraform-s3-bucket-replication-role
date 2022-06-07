
module "s3-replication-role" {
  source             = "../../"
  buckets            = ["arn:aws:s3:::bucket_name/key_name"]
  replication_bucket = "bucket-name"
  tags               = local.tags
}
