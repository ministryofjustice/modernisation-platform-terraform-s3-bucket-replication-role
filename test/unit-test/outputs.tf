output "role_name" {
  value       = module.s3-replication-role.role.name
  description = "Direct aws_iam_role resource with all attributes"
}

output "policy_name" {
  value       = module.s3-replication-role.policy.name
  description = "Direct aws_iam_policy resource with all attributes"
}
